; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57356 () Bool)

(assert start!57356)

(declare-fun b!635030 () Bool)

(declare-fun res!410851 () Bool)

(declare-fun e!363176 () Bool)

(assert (=> b!635030 (=> (not res!410851) (not e!363176))))

(declare-datatypes ((array!38209 0))(
  ( (array!38210 (arr!18333 (Array (_ BitVec 32) (_ BitVec 64))) (size!18697 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38209)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635030 (= res!410851 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635031 () Bool)

(declare-fun e!363180 () Bool)

(declare-fun e!363178 () Bool)

(assert (=> b!635031 (= e!363180 e!363178)))

(declare-fun res!410842 () Bool)

(assert (=> b!635031 (=> res!410842 e!363178)))

(declare-fun lt!293619 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293620 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635031 (= res!410842 (or (not (= (select (arr!18333 a!2986) j!136) lt!293620)) (not (= (select (arr!18333 a!2986) j!136) lt!293619)) (bvsge j!136 index!984)))))

(declare-fun e!363175 () Bool)

(assert (=> b!635031 e!363175))

(declare-fun res!410854 () Bool)

(assert (=> b!635031 (=> (not res!410854) (not e!363175))))

(assert (=> b!635031 (= res!410854 (= lt!293619 (select (arr!18333 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635031 (= lt!293619 (select (store (arr!18333 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!635032 () Bool)

(declare-fun e!363179 () Bool)

(assert (=> b!635032 (= e!363179 (not e!363180))))

(declare-fun res!410848 () Bool)

(assert (=> b!635032 (=> res!410848 e!363180)))

(declare-datatypes ((SeekEntryResult!6773 0))(
  ( (MissingZero!6773 (index!29394 (_ BitVec 32))) (Found!6773 (index!29395 (_ BitVec 32))) (Intermediate!6773 (undefined!7585 Bool) (index!29396 (_ BitVec 32)) (x!58139 (_ BitVec 32))) (Undefined!6773) (MissingVacant!6773 (index!29397 (_ BitVec 32))) )
))
(declare-fun lt!293614 () SeekEntryResult!6773)

(assert (=> b!635032 (= res!410848 (not (= lt!293614 (Found!6773 index!984))))))

(declare-datatypes ((Unit!21426 0))(
  ( (Unit!21427) )
))
(declare-fun lt!293611 () Unit!21426)

(declare-fun e!363172 () Unit!21426)

(assert (=> b!635032 (= lt!293611 e!363172)))

(declare-fun c!72461 () Bool)

(assert (=> b!635032 (= c!72461 (= lt!293614 Undefined!6773))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!293616 () array!38209)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38209 (_ BitVec 32)) SeekEntryResult!6773)

(assert (=> b!635032 (= lt!293614 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293620 lt!293616 mask!3053))))

(declare-fun e!363183 () Bool)

(assert (=> b!635032 e!363183))

(declare-fun res!410857 () Bool)

(assert (=> b!635032 (=> (not res!410857) (not e!363183))))

(declare-fun lt!293615 () SeekEntryResult!6773)

(declare-fun lt!293612 () (_ BitVec 32))

(assert (=> b!635032 (= res!410857 (= lt!293615 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 lt!293620 lt!293616 mask!3053)))))

(assert (=> b!635032 (= lt!293615 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 (select (arr!18333 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635032 (= lt!293620 (select (store (arr!18333 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293613 () Unit!21426)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21426)

(assert (=> b!635032 (= lt!293613 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635032 (= lt!293612 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635033 () Bool)

(declare-fun e!363174 () Bool)

(assert (=> b!635033 (= e!363174 e!363179)))

(declare-fun res!410858 () Bool)

(assert (=> b!635033 (=> (not res!410858) (not e!363179))))

(declare-fun lt!293610 () SeekEntryResult!6773)

(assert (=> b!635033 (= res!410858 (and (= lt!293610 (Found!6773 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18333 a!2986) index!984) (select (arr!18333 a!2986) j!136))) (not (= (select (arr!18333 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635033 (= lt!293610 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18333 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635034 () Bool)

(assert (=> b!635034 (= e!363178 (bvslt (size!18697 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!635034 (arrayContainsKey!0 lt!293616 (select (arr!18333 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293618 () Unit!21426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21426)

(assert (=> b!635034 (= lt!293618 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293616 (select (arr!18333 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635035 () Bool)

(declare-fun res!410853 () Bool)

(declare-fun e!363182 () Bool)

(assert (=> b!635035 (=> (not res!410853) (not e!363182))))

(declare-datatypes ((List!12374 0))(
  ( (Nil!12371) (Cons!12370 (h!13415 (_ BitVec 64)) (t!18602 List!12374)) )
))
(declare-fun arrayNoDuplicates!0 (array!38209 (_ BitVec 32) List!12374) Bool)

(assert (=> b!635035 (= res!410853 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12371))))

(declare-fun b!635036 () Bool)

(declare-fun e!363177 () Bool)

(assert (=> b!635036 (= e!363177 (arrayContainsKey!0 lt!293616 (select (arr!18333 a!2986) j!136) index!984))))

(declare-fun b!635037 () Bool)

(assert (=> b!635037 (= e!363176 e!363182)))

(declare-fun res!410855 () Bool)

(assert (=> b!635037 (=> (not res!410855) (not e!363182))))

(declare-fun lt!293617 () SeekEntryResult!6773)

(assert (=> b!635037 (= res!410855 (or (= lt!293617 (MissingZero!6773 i!1108)) (= lt!293617 (MissingVacant!6773 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38209 (_ BitVec 32)) SeekEntryResult!6773)

(assert (=> b!635037 (= lt!293617 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!635038 () Bool)

(declare-fun res!410844 () Bool)

(assert (=> b!635038 (=> (not res!410844) (not e!363176))))

(assert (=> b!635038 (= res!410844 (and (= (size!18697 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18697 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18697 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635039 () Bool)

(declare-fun Unit!21428 () Unit!21426)

(assert (=> b!635039 (= e!363172 Unit!21428)))

(declare-fun b!635040 () Bool)

(declare-fun e!363181 () Bool)

(assert (=> b!635040 (= e!363181 e!363177)))

(declare-fun res!410845 () Bool)

(assert (=> b!635040 (=> (not res!410845) (not e!363177))))

(assert (=> b!635040 (= res!410845 (arrayContainsKey!0 lt!293616 (select (arr!18333 a!2986) j!136) j!136))))

(declare-fun b!635041 () Bool)

(assert (=> b!635041 (= e!363175 e!363181)))

(declare-fun res!410846 () Bool)

(assert (=> b!635041 (=> res!410846 e!363181)))

(assert (=> b!635041 (= res!410846 (or (not (= (select (arr!18333 a!2986) j!136) lt!293620)) (not (= (select (arr!18333 a!2986) j!136) lt!293619)) (bvsge j!136 index!984)))))

(declare-fun b!635042 () Bool)

(assert (=> b!635042 (= e!363182 e!363174)))

(declare-fun res!410849 () Bool)

(assert (=> b!635042 (=> (not res!410849) (not e!363174))))

(assert (=> b!635042 (= res!410849 (= (select (store (arr!18333 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635042 (= lt!293616 (array!38210 (store (arr!18333 a!2986) i!1108 k!1786) (size!18697 a!2986)))))

(declare-fun res!410843 () Bool)

(assert (=> start!57356 (=> (not res!410843) (not e!363176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57356 (= res!410843 (validMask!0 mask!3053))))

(assert (=> start!57356 e!363176))

(assert (=> start!57356 true))

(declare-fun array_inv!14129 (array!38209) Bool)

(assert (=> start!57356 (array_inv!14129 a!2986)))

(declare-fun b!635043 () Bool)

(declare-fun res!410850 () Bool)

(assert (=> b!635043 (=> (not res!410850) (not e!363176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635043 (= res!410850 (validKeyInArray!0 k!1786))))

(declare-fun b!635044 () Bool)

(declare-fun res!410856 () Bool)

(assert (=> b!635044 (=> (not res!410856) (not e!363182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38209 (_ BitVec 32)) Bool)

(assert (=> b!635044 (= res!410856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635045 () Bool)

(assert (=> b!635045 (= e!363183 (= lt!293610 lt!293615))))

(declare-fun b!635046 () Bool)

(declare-fun Unit!21429 () Unit!21426)

(assert (=> b!635046 (= e!363172 Unit!21429)))

(assert (=> b!635046 false))

(declare-fun b!635047 () Bool)

(declare-fun res!410852 () Bool)

(assert (=> b!635047 (=> (not res!410852) (not e!363176))))

(assert (=> b!635047 (= res!410852 (validKeyInArray!0 (select (arr!18333 a!2986) j!136)))))

(declare-fun b!635048 () Bool)

(declare-fun res!410847 () Bool)

(assert (=> b!635048 (=> (not res!410847) (not e!363182))))

(assert (=> b!635048 (= res!410847 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18333 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57356 res!410843) b!635038))

(assert (= (and b!635038 res!410844) b!635047))

(assert (= (and b!635047 res!410852) b!635043))

(assert (= (and b!635043 res!410850) b!635030))

(assert (= (and b!635030 res!410851) b!635037))

(assert (= (and b!635037 res!410855) b!635044))

(assert (= (and b!635044 res!410856) b!635035))

(assert (= (and b!635035 res!410853) b!635048))

(assert (= (and b!635048 res!410847) b!635042))

(assert (= (and b!635042 res!410849) b!635033))

(assert (= (and b!635033 res!410858) b!635032))

(assert (= (and b!635032 res!410857) b!635045))

(assert (= (and b!635032 c!72461) b!635046))

(assert (= (and b!635032 (not c!72461)) b!635039))

(assert (= (and b!635032 (not res!410848)) b!635031))

(assert (= (and b!635031 res!410854) b!635041))

(assert (= (and b!635041 (not res!410846)) b!635040))

(assert (= (and b!635040 res!410845) b!635036))

(assert (= (and b!635031 (not res!410842)) b!635034))

(declare-fun m!609443 () Bool)

(assert (=> b!635034 m!609443))

(assert (=> b!635034 m!609443))

(declare-fun m!609445 () Bool)

(assert (=> b!635034 m!609445))

(assert (=> b!635034 m!609443))

(declare-fun m!609447 () Bool)

(assert (=> b!635034 m!609447))

(declare-fun m!609449 () Bool)

(assert (=> b!635043 m!609449))

(declare-fun m!609451 () Bool)

(assert (=> b!635044 m!609451))

(declare-fun m!609453 () Bool)

(assert (=> b!635033 m!609453))

(assert (=> b!635033 m!609443))

(assert (=> b!635033 m!609443))

(declare-fun m!609455 () Bool)

(assert (=> b!635033 m!609455))

(assert (=> b!635031 m!609443))

(declare-fun m!609457 () Bool)

(assert (=> b!635031 m!609457))

(declare-fun m!609459 () Bool)

(assert (=> b!635031 m!609459))

(declare-fun m!609461 () Bool)

(assert (=> b!635035 m!609461))

(assert (=> b!635041 m!609443))

(declare-fun m!609463 () Bool)

(assert (=> b!635037 m!609463))

(declare-fun m!609465 () Bool)

(assert (=> start!57356 m!609465))

(declare-fun m!609467 () Bool)

(assert (=> start!57356 m!609467))

(assert (=> b!635040 m!609443))

(assert (=> b!635040 m!609443))

(declare-fun m!609469 () Bool)

(assert (=> b!635040 m!609469))

(declare-fun m!609471 () Bool)

(assert (=> b!635032 m!609471))

(assert (=> b!635032 m!609443))

(assert (=> b!635032 m!609457))

(declare-fun m!609473 () Bool)

(assert (=> b!635032 m!609473))

(declare-fun m!609475 () Bool)

(assert (=> b!635032 m!609475))

(assert (=> b!635032 m!609443))

(declare-fun m!609477 () Bool)

(assert (=> b!635032 m!609477))

(declare-fun m!609479 () Bool)

(assert (=> b!635032 m!609479))

(declare-fun m!609481 () Bool)

(assert (=> b!635032 m!609481))

(declare-fun m!609483 () Bool)

(assert (=> b!635048 m!609483))

(assert (=> b!635036 m!609443))

(assert (=> b!635036 m!609443))

(declare-fun m!609485 () Bool)

(assert (=> b!635036 m!609485))

(declare-fun m!609487 () Bool)

(assert (=> b!635030 m!609487))

(assert (=> b!635047 m!609443))

(assert (=> b!635047 m!609443))

(declare-fun m!609489 () Bool)

(assert (=> b!635047 m!609489))

(assert (=> b!635042 m!609457))

(declare-fun m!609491 () Bool)

(assert (=> b!635042 m!609491))

(push 1)

(assert (not b!635043))

(assert (not b!635036))

(assert (not b!635030))

(assert (not b!635040))

(assert (not b!635032))

(assert (not b!635047))

(assert (not b!635034))

(assert (not b!635037))

(assert (not b!635033))

(assert (not b!635044))

(assert (not b!635035))

(assert (not start!57356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89723 () Bool)

(declare-fun res!410982 () Bool)

(declare-fun e!363289 () Bool)

(assert (=> d!89723 (=> res!410982 e!363289)))

(assert (=> d!89723 (= res!410982 (= (select (arr!18333 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89723 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!363289)))

(declare-fun b!635208 () Bool)

(declare-fun e!363290 () Bool)

(assert (=> b!635208 (= e!363289 e!363290)))

(declare-fun res!410983 () Bool)

(assert (=> b!635208 (=> (not res!410983) (not e!363290))))

(assert (=> b!635208 (= res!410983 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18697 a!2986)))))

(declare-fun b!635209 () Bool)

(assert (=> b!635209 (= e!363290 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89723 (not res!410982)) b!635208))

(assert (= (and b!635208 res!410983) b!635209))

(declare-fun m!609619 () Bool)

(assert (=> d!89723 m!609619))

(declare-fun m!609623 () Bool)

(assert (=> b!635209 m!609623))

(assert (=> b!635030 d!89723))

(declare-fun b!635269 () Bool)

(declare-fun e!363327 () SeekEntryResult!6773)

(assert (=> b!635269 (= e!363327 (Found!6773 lt!293612))))

(declare-fun b!635270 () Bool)

(declare-fun e!363328 () SeekEntryResult!6773)

(assert (=> b!635270 (= e!363328 e!363327)))

(declare-fun c!72506 () Bool)

(declare-fun lt!293723 () (_ BitVec 64))

(assert (=> b!635270 (= c!72506 (= lt!293723 lt!293620))))

(declare-fun d!89731 () Bool)

(declare-fun lt!293722 () SeekEntryResult!6773)

(assert (=> d!89731 (and (or (is-Undefined!6773 lt!293722) (not (is-Found!6773 lt!293722)) (and (bvsge (index!29395 lt!293722) #b00000000000000000000000000000000) (bvslt (index!29395 lt!293722) (size!18697 lt!293616)))) (or (is-Undefined!6773 lt!293722) (is-Found!6773 lt!293722) (not (is-MissingVacant!6773 lt!293722)) (not (= (index!29397 lt!293722) vacantSpotIndex!68)) (and (bvsge (index!29397 lt!293722) #b00000000000000000000000000000000) (bvslt (index!29397 lt!293722) (size!18697 lt!293616)))) (or (is-Undefined!6773 lt!293722) (ite (is-Found!6773 lt!293722) (= (select (arr!18333 lt!293616) (index!29395 lt!293722)) lt!293620) (and (is-MissingVacant!6773 lt!293722) (= (index!29397 lt!293722) vacantSpotIndex!68) (= (select (arr!18333 lt!293616) (index!29397 lt!293722)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89731 (= lt!293722 e!363328)))

(declare-fun c!72505 () Bool)

(assert (=> d!89731 (= c!72505 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89731 (= lt!293723 (select (arr!18333 lt!293616) lt!293612))))

(assert (=> d!89731 (validMask!0 mask!3053)))

(assert (=> d!89731 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 lt!293620 lt!293616 mask!3053) lt!293722)))

(declare-fun b!635271 () Bool)

(assert (=> b!635271 (= e!363328 Undefined!6773)))

(declare-fun b!635272 () Bool)

(declare-fun c!72504 () Bool)

(assert (=> b!635272 (= c!72504 (= lt!293723 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363326 () SeekEntryResult!6773)

(assert (=> b!635272 (= e!363327 e!363326)))

(declare-fun b!635273 () Bool)

(assert (=> b!635273 (= e!363326 (MissingVacant!6773 vacantSpotIndex!68))))

(declare-fun b!635274 () Bool)

(assert (=> b!635274 (= e!363326 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293612 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!293620 lt!293616 mask!3053))))

(assert (= (and d!89731 c!72505) b!635271))

(assert (= (and d!89731 (not c!72505)) b!635270))

(assert (= (and b!635270 c!72506) b!635269))

(assert (= (and b!635270 (not c!72506)) b!635272))

(assert (= (and b!635272 c!72504) b!635273))

(assert (= (and b!635272 (not c!72504)) b!635274))

(declare-fun m!609659 () Bool)

(assert (=> d!89731 m!609659))

(declare-fun m!609661 () Bool)

(assert (=> d!89731 m!609661))

(declare-fun m!609663 () Bool)

(assert (=> d!89731 m!609663))

(assert (=> d!89731 m!609465))

(declare-fun m!609665 () Bool)

(assert (=> b!635274 m!609665))

(assert (=> b!635274 m!609665))

(declare-fun m!609667 () Bool)

(assert (=> b!635274 m!609667))

(assert (=> b!635032 d!89731))

(declare-fun d!89751 () Bool)

(declare-fun lt!293726 () (_ BitVec 32))

(assert (=> d!89751 (and (bvsge lt!293726 #b00000000000000000000000000000000) (bvslt lt!293726 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89751 (= lt!293726 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89751 (validMask!0 mask!3053)))

(assert (=> d!89751 (= (nextIndex!0 index!984 x!910 mask!3053) lt!293726)))

(declare-fun bs!19091 () Bool)

(assert (= bs!19091 d!89751))

(declare-fun m!609669 () Bool)

(assert (=> bs!19091 m!609669))

(assert (=> bs!19091 m!609465))

(assert (=> b!635032 d!89751))

(declare-fun b!635275 () Bool)

(declare-fun e!363330 () SeekEntryResult!6773)

(assert (=> b!635275 (= e!363330 (Found!6773 index!984))))

(declare-fun b!635276 () Bool)

(declare-fun e!363331 () SeekEntryResult!6773)

(assert (=> b!635276 (= e!363331 e!363330)))

(declare-fun c!72509 () Bool)

(declare-fun lt!293728 () (_ BitVec 64))

(assert (=> b!635276 (= c!72509 (= lt!293728 lt!293620))))

(declare-fun lt!293727 () SeekEntryResult!6773)

(declare-fun d!89753 () Bool)

(assert (=> d!89753 (and (or (is-Undefined!6773 lt!293727) (not (is-Found!6773 lt!293727)) (and (bvsge (index!29395 lt!293727) #b00000000000000000000000000000000) (bvslt (index!29395 lt!293727) (size!18697 lt!293616)))) (or (is-Undefined!6773 lt!293727) (is-Found!6773 lt!293727) (not (is-MissingVacant!6773 lt!293727)) (not (= (index!29397 lt!293727) vacantSpotIndex!68)) (and (bvsge (index!29397 lt!293727) #b00000000000000000000000000000000) (bvslt (index!29397 lt!293727) (size!18697 lt!293616)))) (or (is-Undefined!6773 lt!293727) (ite (is-Found!6773 lt!293727) (= (select (arr!18333 lt!293616) (index!29395 lt!293727)) lt!293620) (and (is-MissingVacant!6773 lt!293727) (= (index!29397 lt!293727) vacantSpotIndex!68) (= (select (arr!18333 lt!293616) (index!29397 lt!293727)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89753 (= lt!293727 e!363331)))

(declare-fun c!72508 () Bool)

(assert (=> d!89753 (= c!72508 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89753 (= lt!293728 (select (arr!18333 lt!293616) index!984))))

(assert (=> d!89753 (validMask!0 mask!3053)))

(assert (=> d!89753 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293620 lt!293616 mask!3053) lt!293727)))

(declare-fun b!635277 () Bool)

(assert (=> b!635277 (= e!363331 Undefined!6773)))

(declare-fun b!635278 () Bool)

(declare-fun c!72507 () Bool)

(assert (=> b!635278 (= c!72507 (= lt!293728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363329 () SeekEntryResult!6773)

(assert (=> b!635278 (= e!363330 e!363329)))

(declare-fun b!635279 () Bool)

(assert (=> b!635279 (= e!363329 (MissingVacant!6773 vacantSpotIndex!68))))

(declare-fun b!635280 () Bool)

(assert (=> b!635280 (= e!363329 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!293620 lt!293616 mask!3053))))

(assert (= (and d!89753 c!72508) b!635277))

(assert (= (and d!89753 (not c!72508)) b!635276))

(assert (= (and b!635276 c!72509) b!635275))

(assert (= (and b!635276 (not c!72509)) b!635278))

(assert (= (and b!635278 c!72507) b!635279))

(assert (= (and b!635278 (not c!72507)) b!635280))

(declare-fun m!609671 () Bool)

(assert (=> d!89753 m!609671))

(declare-fun m!609673 () Bool)

(assert (=> d!89753 m!609673))

(declare-fun m!609675 () Bool)

(assert (=> d!89753 m!609675))

(assert (=> d!89753 m!609465))

(assert (=> b!635280 m!609479))

(assert (=> b!635280 m!609479))

(declare-fun m!609677 () Bool)

(assert (=> b!635280 m!609677))

(assert (=> b!635032 d!89753))

(declare-fun d!89755 () Bool)

(declare-fun e!363340 () Bool)

(assert (=> d!89755 e!363340))

(declare-fun res!410997 () Bool)

(assert (=> d!89755 (=> (not res!410997) (not e!363340))))

(assert (=> d!89755 (= res!410997 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18697 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18697 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18697 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18697 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18697 a!2986))))))

(declare-fun lt!293737 () Unit!21426)

(declare-fun choose!9 (array!38209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21426)

(assert (=> d!89755 (= lt!293737 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89755 (validMask!0 mask!3053)))

(assert (=> d!89755 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 mask!3053) lt!293737)))

(declare-fun b!635295 () Bool)

(assert (=> b!635295 (= e!363340 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 (select (arr!18333 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 (select (store (arr!18333 a!2986) i!1108 k!1786) j!136) (array!38210 (store (arr!18333 a!2986) i!1108 k!1786) (size!18697 a!2986)) mask!3053)))))

(assert (= (and d!89755 res!410997) b!635295))

(declare-fun m!609679 () Bool)

(assert (=> d!89755 m!609679))

(assert (=> d!89755 m!609465))

(assert (=> b!635295 m!609443))

(assert (=> b!635295 m!609471))

(assert (=> b!635295 m!609471))

(declare-fun m!609681 () Bool)

(assert (=> b!635295 m!609681))

(assert (=> b!635295 m!609457))

(assert (=> b!635295 m!609443))

(assert (=> b!635295 m!609477))

(assert (=> b!635032 d!89755))

(declare-fun b!635302 () Bool)

(declare-fun e!363345 () SeekEntryResult!6773)

(assert (=> b!635302 (= e!363345 (Found!6773 lt!293612))))

(declare-fun b!635303 () Bool)

(declare-fun e!363346 () SeekEntryResult!6773)

(assert (=> b!635303 (= e!363346 e!363345)))

(declare-fun lt!293742 () (_ BitVec 64))

(declare-fun c!72521 () Bool)

(assert (=> b!635303 (= c!72521 (= lt!293742 (select (arr!18333 a!2986) j!136)))))

(declare-fun d!89761 () Bool)

(declare-fun lt!293741 () SeekEntryResult!6773)

(assert (=> d!89761 (and (or (is-Undefined!6773 lt!293741) (not (is-Found!6773 lt!293741)) (and (bvsge (index!29395 lt!293741) #b00000000000000000000000000000000) (bvslt (index!29395 lt!293741) (size!18697 a!2986)))) (or (is-Undefined!6773 lt!293741) (is-Found!6773 lt!293741) (not (is-MissingVacant!6773 lt!293741)) (not (= (index!29397 lt!293741) vacantSpotIndex!68)) (and (bvsge (index!29397 lt!293741) #b00000000000000000000000000000000) (bvslt (index!29397 lt!293741) (size!18697 a!2986)))) (or (is-Undefined!6773 lt!293741) (ite (is-Found!6773 lt!293741) (= (select (arr!18333 a!2986) (index!29395 lt!293741)) (select (arr!18333 a!2986) j!136)) (and (is-MissingVacant!6773 lt!293741) (= (index!29397 lt!293741) vacantSpotIndex!68) (= (select (arr!18333 a!2986) (index!29397 lt!293741)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89761 (= lt!293741 e!363346)))

(declare-fun c!72520 () Bool)

(assert (=> d!89761 (= c!72520 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89761 (= lt!293742 (select (arr!18333 a!2986) lt!293612))))

(assert (=> d!89761 (validMask!0 mask!3053)))

(assert (=> d!89761 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293612 vacantSpotIndex!68 (select (arr!18333 a!2986) j!136) a!2986 mask!3053) lt!293741)))

(declare-fun b!635304 () Bool)

(assert (=> b!635304 (= e!363346 Undefined!6773)))

(declare-fun b!635305 () Bool)

(declare-fun c!72519 () Bool)

(assert (=> b!635305 (= c!72519 (= lt!293742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363344 () SeekEntryResult!6773)

(assert (=> b!635305 (= e!363345 e!363344)))

(declare-fun b!635306 () Bool)

(assert (=> b!635306 (= e!363344 (MissingVacant!6773 vacantSpotIndex!68))))

(declare-fun b!635307 () Bool)

(assert (=> b!635307 (= e!363344 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293612 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18333 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89761 c!72520) b!635304))

(assert (= (and d!89761 (not c!72520)) b!635303))

(assert (= (and b!635303 c!72521) b!635302))

(assert (= (and b!635303 (not c!72521)) b!635305))

(assert (= (and b!635305 c!72519) b!635306))

(assert (= (and b!635305 (not c!72519)) b!635307))

(declare-fun m!609697 () Bool)

(assert (=> d!89761 m!609697))

(declare-fun m!609699 () Bool)

(assert (=> d!89761 m!609699))

(declare-fun m!609701 () Bool)

(assert (=> d!89761 m!609701))

(assert (=> d!89761 m!609465))

(assert (=> b!635307 m!609665))

(assert (=> b!635307 m!609665))

(assert (=> b!635307 m!609443))

(declare-fun m!609707 () Bool)

(assert (=> b!635307 m!609707))

(assert (=> b!635032 d!89761))

(declare-fun b!635336 () Bool)

(declare-fun e!363364 () Bool)

(declare-fun e!363366 () Bool)

(assert (=> b!635336 (= e!363364 e!363366)))

(declare-fun lt!293760 () (_ BitVec 64))

(assert (=> b!635336 (= lt!293760 (select (arr!18333 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!293762 () Unit!21426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38209 (_ BitVec 64) (_ BitVec 32)) Unit!21426)

(assert (=> b!635336 (= lt!293762 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!293760 #b00000000000000000000000000000000))))

(assert (=> b!635336 (arrayContainsKey!0 a!2986 lt!293760 #b00000000000000000000000000000000)))

(declare-fun lt!293761 () Unit!21426)

(assert (=> b!635336 (= lt!293761 lt!293762)))

(declare-fun res!411004 () Bool)

(assert (=> b!635336 (= res!411004 (= (seekEntryOrOpen!0 (select (arr!18333 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6773 #b00000000000000000000000000000000)))))

(assert (=> b!635336 (=> (not res!411004) (not e!363366))))

(declare-fun d!89767 () Bool)

(declare-fun res!411005 () Bool)

(declare-fun e!363365 () Bool)

(assert (=> d!89767 (=> res!411005 e!363365)))

(assert (=> d!89767 (= res!411005 (bvsge #b00000000000000000000000000000000 (size!18697 a!2986)))))

(assert (=> d!89767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!363365)))

(declare-fun b!635337 () Bool)

(declare-fun call!33404 () Bool)

(assert (=> b!635337 (= e!363366 call!33404)))

(declare-fun bm!33401 () Bool)

(assert (=> bm!33401 (= call!33404 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!635338 () Bool)

(assert (=> b!635338 (= e!363364 call!33404)))

(declare-fun b!635339 () Bool)

(assert (=> b!635339 (= e!363365 e!363364)))

(declare-fun c!72533 () Bool)

(assert (=> b!635339 (= c!72533 (validKeyInArray!0 (select (arr!18333 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89767 (not res!411005)) b!635339))

(assert (= (and b!635339 c!72533) b!635336))

(assert (= (and b!635339 (not c!72533)) b!635338))

(assert (= (and b!635336 res!411004) b!635337))

(assert (= (or b!635337 b!635338) bm!33401))

