; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54006 () Bool)

(assert start!54006)

(declare-fun b!589332 () Bool)

(declare-fun e!336494 () Bool)

(declare-fun e!336489 () Bool)

(assert (=> b!589332 (= e!336494 e!336489)))

(declare-fun res!376796 () Bool)

(assert (=> b!589332 (=> (not res!376796) (not e!336489))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36795 0))(
  ( (array!36796 (arr!17668 (Array (_ BitVec 32) (_ BitVec 64))) (size!18032 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36795)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!589332 (= res!376796 (= (select (store (arr!17668 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267262 () array!36795)

(assert (=> b!589332 (= lt!267262 (array!36796 (store (arr!17668 a!2986) i!1108 k0!1786) (size!18032 a!2986)))))

(declare-fun b!589333 () Bool)

(declare-datatypes ((Unit!18349 0))(
  ( (Unit!18350) )
))
(declare-fun e!336493 () Unit!18349)

(declare-fun Unit!18351 () Unit!18349)

(assert (=> b!589333 (= e!336493 Unit!18351)))

(assert (=> b!589333 false))

(declare-fun b!589334 () Bool)

(declare-fun e!336491 () Bool)

(assert (=> b!589334 (= e!336491 e!336494)))

(declare-fun res!376789 () Bool)

(assert (=> b!589334 (=> (not res!376789) (not e!336494))))

(declare-datatypes ((SeekEntryResult!6064 0))(
  ( (MissingZero!6064 (index!26486 (_ BitVec 32))) (Found!6064 (index!26487 (_ BitVec 32))) (Intermediate!6064 (undefined!6876 Bool) (index!26488 (_ BitVec 32)) (x!55433 (_ BitVec 32))) (Undefined!6064) (MissingVacant!6064 (index!26489 (_ BitVec 32))) )
))
(declare-fun lt!267263 () SeekEntryResult!6064)

(assert (=> b!589334 (= res!376789 (or (= lt!267263 (MissingZero!6064 i!1108)) (= lt!267263 (MissingVacant!6064 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36795 (_ BitVec 32)) SeekEntryResult!6064)

(assert (=> b!589334 (= lt!267263 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589335 () Bool)

(declare-fun Unit!18352 () Unit!18349)

(assert (=> b!589335 (= e!336493 Unit!18352)))

(declare-fun res!376797 () Bool)

(assert (=> start!54006 (=> (not res!376797) (not e!336491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54006 (= res!376797 (validMask!0 mask!3053))))

(assert (=> start!54006 e!336491))

(assert (=> start!54006 true))

(declare-fun array_inv!13527 (array!36795) Bool)

(assert (=> start!54006 (array_inv!13527 a!2986)))

(declare-fun b!589336 () Bool)

(declare-fun res!376798 () Bool)

(assert (=> b!589336 (=> (not res!376798) (not e!336491))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589336 (= res!376798 (validKeyInArray!0 (select (arr!17668 a!2986) j!136)))))

(declare-fun b!589337 () Bool)

(declare-fun e!336492 () Bool)

(declare-fun lt!267264 () SeekEntryResult!6064)

(declare-fun lt!267261 () SeekEntryResult!6064)

(assert (=> b!589337 (= e!336492 (= lt!267264 lt!267261))))

(declare-fun b!589338 () Bool)

(declare-fun res!376793 () Bool)

(assert (=> b!589338 (=> (not res!376793) (not e!336494))))

(declare-datatypes ((List!11616 0))(
  ( (Nil!11613) (Cons!11612 (h!12660 (_ BitVec 64)) (t!17836 List!11616)) )
))
(declare-fun arrayNoDuplicates!0 (array!36795 (_ BitVec 32) List!11616) Bool)

(assert (=> b!589338 (= res!376793 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11613))))

(declare-fun b!589339 () Bool)

(declare-fun res!376791 () Bool)

(assert (=> b!589339 (=> (not res!376791) (not e!336494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36795 (_ BitVec 32)) Bool)

(assert (=> b!589339 (= res!376791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589340 () Bool)

(declare-fun e!336490 () Bool)

(assert (=> b!589340 (= e!336489 e!336490)))

(declare-fun res!376792 () Bool)

(assert (=> b!589340 (=> (not res!376792) (not e!336490))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589340 (= res!376792 (and (= lt!267264 (Found!6064 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17668 a!2986) index!984) (select (arr!17668 a!2986) j!136))) (not (= (select (arr!17668 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36795 (_ BitVec 32)) SeekEntryResult!6064)

(assert (=> b!589340 (= lt!267264 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17668 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589341 () Bool)

(declare-fun res!376788 () Bool)

(assert (=> b!589341 (=> (not res!376788) (not e!336491))))

(declare-fun arrayContainsKey!0 (array!36795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589341 (= res!376788 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589342 () Bool)

(declare-fun res!376790 () Bool)

(assert (=> b!589342 (=> (not res!376790) (not e!336494))))

(assert (=> b!589342 (= res!376790 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17668 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589343 () Bool)

(declare-fun res!376787 () Bool)

(assert (=> b!589343 (=> (not res!376787) (not e!336491))))

(assert (=> b!589343 (= res!376787 (and (= (size!18032 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18032 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18032 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589344 () Bool)

(assert (=> b!589344 (= e!336490 (not true))))

(declare-fun lt!267266 () Unit!18349)

(assert (=> b!589344 (= lt!267266 e!336493)))

(declare-fun c!66641 () Bool)

(declare-fun lt!267267 () (_ BitVec 64))

(assert (=> b!589344 (= c!66641 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267267 lt!267262 mask!3053) Undefined!6064))))

(assert (=> b!589344 e!336492))

(declare-fun res!376795 () Bool)

(assert (=> b!589344 (=> (not res!376795) (not e!336492))))

(declare-fun lt!267268 () (_ BitVec 32))

(assert (=> b!589344 (= res!376795 (= lt!267261 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267268 vacantSpotIndex!68 lt!267267 lt!267262 mask!3053)))))

(assert (=> b!589344 (= lt!267261 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267268 vacantSpotIndex!68 (select (arr!17668 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589344 (= lt!267267 (select (store (arr!17668 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267265 () Unit!18349)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18349)

(assert (=> b!589344 (= lt!267265 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267268 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589344 (= lt!267268 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!589345 () Bool)

(declare-fun res!376794 () Bool)

(assert (=> b!589345 (=> (not res!376794) (not e!336491))))

(assert (=> b!589345 (= res!376794 (validKeyInArray!0 k0!1786))))

(assert (= (and start!54006 res!376797) b!589343))

(assert (= (and b!589343 res!376787) b!589336))

(assert (= (and b!589336 res!376798) b!589345))

(assert (= (and b!589345 res!376794) b!589341))

(assert (= (and b!589341 res!376788) b!589334))

(assert (= (and b!589334 res!376789) b!589339))

(assert (= (and b!589339 res!376791) b!589338))

(assert (= (and b!589338 res!376793) b!589342))

(assert (= (and b!589342 res!376790) b!589332))

(assert (= (and b!589332 res!376796) b!589340))

(assert (= (and b!589340 res!376792) b!589344))

(assert (= (and b!589344 res!376795) b!589337))

(assert (= (and b!589344 c!66641) b!589333))

(assert (= (and b!589344 (not c!66641)) b!589335))

(declare-fun m!568031 () Bool)

(assert (=> b!589336 m!568031))

(assert (=> b!589336 m!568031))

(declare-fun m!568033 () Bool)

(assert (=> b!589336 m!568033))

(declare-fun m!568035 () Bool)

(assert (=> b!589340 m!568035))

(assert (=> b!589340 m!568031))

(assert (=> b!589340 m!568031))

(declare-fun m!568037 () Bool)

(assert (=> b!589340 m!568037))

(declare-fun m!568039 () Bool)

(assert (=> b!589339 m!568039))

(declare-fun m!568041 () Bool)

(assert (=> b!589342 m!568041))

(declare-fun m!568043 () Bool)

(assert (=> b!589341 m!568043))

(declare-fun m!568045 () Bool)

(assert (=> start!54006 m!568045))

(declare-fun m!568047 () Bool)

(assert (=> start!54006 m!568047))

(declare-fun m!568049 () Bool)

(assert (=> b!589338 m!568049))

(declare-fun m!568051 () Bool)

(assert (=> b!589334 m!568051))

(declare-fun m!568053 () Bool)

(assert (=> b!589344 m!568053))

(declare-fun m!568055 () Bool)

(assert (=> b!589344 m!568055))

(declare-fun m!568057 () Bool)

(assert (=> b!589344 m!568057))

(assert (=> b!589344 m!568031))

(declare-fun m!568059 () Bool)

(assert (=> b!589344 m!568059))

(declare-fun m!568061 () Bool)

(assert (=> b!589344 m!568061))

(assert (=> b!589344 m!568031))

(declare-fun m!568063 () Bool)

(assert (=> b!589344 m!568063))

(declare-fun m!568065 () Bool)

(assert (=> b!589344 m!568065))

(assert (=> b!589332 m!568059))

(declare-fun m!568067 () Bool)

(assert (=> b!589332 m!568067))

(declare-fun m!568069 () Bool)

(assert (=> b!589345 m!568069))

(check-sat (not start!54006) (not b!589341) (not b!589344) (not b!589336) (not b!589340) (not b!589338) (not b!589334) (not b!589345) (not b!589339))
(check-sat)
