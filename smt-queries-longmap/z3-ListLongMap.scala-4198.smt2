; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57340 () Bool)

(assert start!57340)

(declare-fun b!634578 () Bool)

(declare-fun res!410452 () Bool)

(declare-fun e!362895 () Bool)

(assert (=> b!634578 (=> (not res!410452) (not e!362895))))

(declare-datatypes ((array!38193 0))(
  ( (array!38194 (arr!18325 (Array (_ BitVec 32) (_ BitVec 64))) (size!18689 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38193)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634578 (= res!410452 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634579 () Bool)

(declare-fun res!410443 () Bool)

(assert (=> b!634579 (=> (not res!410443) (not e!362895))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634579 (= res!410443 (validKeyInArray!0 (select (arr!18325 a!2986) j!136)))))

(declare-fun b!634580 () Bool)

(declare-fun e!362898 () Bool)

(declare-fun e!362896 () Bool)

(assert (=> b!634580 (= e!362898 e!362896)))

(declare-fun res!410450 () Bool)

(assert (=> b!634580 (=> (not res!410450) (not e!362896))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!634580 (= res!410450 (= (select (store (arr!18325 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293358 () array!38193)

(assert (=> b!634580 (= lt!293358 (array!38194 (store (arr!18325 a!2986) i!1108 k0!1786) (size!18689 a!2986)))))

(declare-fun b!634581 () Bool)

(declare-fun e!362892 () Bool)

(assert (=> b!634581 (= e!362896 e!362892)))

(declare-fun res!410451 () Bool)

(assert (=> b!634581 (=> (not res!410451) (not e!362892))))

(declare-datatypes ((SeekEntryResult!6765 0))(
  ( (MissingZero!6765 (index!29362 (_ BitVec 32))) (Found!6765 (index!29363 (_ BitVec 32))) (Intermediate!6765 (undefined!7577 Bool) (index!29364 (_ BitVec 32)) (x!58107 (_ BitVec 32))) (Undefined!6765) (MissingVacant!6765 (index!29365 (_ BitVec 32))) )
))
(declare-fun lt!293359 () SeekEntryResult!6765)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634581 (= res!410451 (and (= lt!293359 (Found!6765 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18325 a!2986) index!984) (select (arr!18325 a!2986) j!136))) (not (= (select (arr!18325 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38193 (_ BitVec 32)) SeekEntryResult!6765)

(assert (=> b!634581 (= lt!293359 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18325 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634582 () Bool)

(declare-fun e!362894 () Bool)

(declare-fun e!362890 () Bool)

(assert (=> b!634582 (= e!362894 e!362890)))

(declare-fun res!410445 () Bool)

(assert (=> b!634582 (=> res!410445 e!362890)))

(declare-fun lt!293355 () (_ BitVec 64))

(declare-fun lt!293350 () (_ BitVec 64))

(assert (=> b!634582 (= res!410445 (or (not (= (select (arr!18325 a!2986) j!136) lt!293350)) (not (= (select (arr!18325 a!2986) j!136) lt!293355)) (bvsge j!136 index!984)))))

(declare-fun b!634583 () Bool)

(declare-fun res!410440 () Bool)

(assert (=> b!634583 (=> (not res!410440) (not e!362895))))

(assert (=> b!634583 (= res!410440 (and (= (size!18689 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18689 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18689 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634584 () Bool)

(declare-fun res!410448 () Bool)

(assert (=> b!634584 (=> (not res!410448) (not e!362895))))

(assert (=> b!634584 (= res!410448 (validKeyInArray!0 k0!1786))))

(declare-fun b!634585 () Bool)

(declare-fun e!362893 () Bool)

(declare-fun lt!293353 () SeekEntryResult!6765)

(assert (=> b!634585 (= e!362893 (= lt!293359 lt!293353))))

(declare-fun b!634586 () Bool)

(declare-datatypes ((Unit!21394 0))(
  ( (Unit!21395) )
))
(declare-fun e!362897 () Unit!21394)

(declare-fun Unit!21396 () Unit!21394)

(assert (=> b!634586 (= e!362897 Unit!21396)))

(assert (=> b!634586 false))

(declare-fun e!362891 () Bool)

(declare-fun b!634587 () Bool)

(assert (=> b!634587 (= e!362891 (arrayContainsKey!0 lt!293358 (select (arr!18325 a!2986) j!136) index!984))))

(declare-fun b!634588 () Bool)

(declare-fun e!362889 () Bool)

(assert (=> b!634588 (= e!362889 true)))

(assert (=> b!634588 e!362894))

(declare-fun res!410441 () Bool)

(assert (=> b!634588 (=> (not res!410441) (not e!362894))))

(assert (=> b!634588 (= res!410441 (= lt!293355 (select (arr!18325 a!2986) j!136)))))

(assert (=> b!634588 (= lt!293355 (select (store (arr!18325 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634589 () Bool)

(assert (=> b!634589 (= e!362892 (not e!362889))))

(declare-fun res!410442 () Bool)

(assert (=> b!634589 (=> res!410442 e!362889)))

(declare-fun lt!293354 () SeekEntryResult!6765)

(assert (=> b!634589 (= res!410442 (not (= lt!293354 (Found!6765 index!984))))))

(declare-fun lt!293357 () Unit!21394)

(assert (=> b!634589 (= lt!293357 e!362897)))

(declare-fun c!72437 () Bool)

(assert (=> b!634589 (= c!72437 (= lt!293354 Undefined!6765))))

(assert (=> b!634589 (= lt!293354 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293350 lt!293358 mask!3053))))

(assert (=> b!634589 e!362893))

(declare-fun res!410444 () Bool)

(assert (=> b!634589 (=> (not res!410444) (not e!362893))))

(declare-fun lt!293351 () (_ BitVec 32))

(assert (=> b!634589 (= res!410444 (= lt!293353 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293351 vacantSpotIndex!68 lt!293350 lt!293358 mask!3053)))))

(assert (=> b!634589 (= lt!293353 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293351 vacantSpotIndex!68 (select (arr!18325 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634589 (= lt!293350 (select (store (arr!18325 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293352 () Unit!21394)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21394)

(assert (=> b!634589 (= lt!293352 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293351 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634589 (= lt!293351 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634590 () Bool)

(declare-fun res!410439 () Bool)

(assert (=> b!634590 (=> (not res!410439) (not e!362898))))

(declare-datatypes ((List!12366 0))(
  ( (Nil!12363) (Cons!12362 (h!13407 (_ BitVec 64)) (t!18594 List!12366)) )
))
(declare-fun arrayNoDuplicates!0 (array!38193 (_ BitVec 32) List!12366) Bool)

(assert (=> b!634590 (= res!410439 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12363))))

(declare-fun b!634591 () Bool)

(assert (=> b!634591 (= e!362890 e!362891)))

(declare-fun res!410438 () Bool)

(assert (=> b!634591 (=> (not res!410438) (not e!362891))))

(assert (=> b!634591 (= res!410438 (arrayContainsKey!0 lt!293358 (select (arr!18325 a!2986) j!136) j!136))))

(declare-fun res!410453 () Bool)

(assert (=> start!57340 (=> (not res!410453) (not e!362895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57340 (= res!410453 (validMask!0 mask!3053))))

(assert (=> start!57340 e!362895))

(assert (=> start!57340 true))

(declare-fun array_inv!14121 (array!38193) Bool)

(assert (=> start!57340 (array_inv!14121 a!2986)))

(declare-fun b!634592 () Bool)

(assert (=> b!634592 (= e!362895 e!362898)))

(declare-fun res!410447 () Bool)

(assert (=> b!634592 (=> (not res!410447) (not e!362898))))

(declare-fun lt!293356 () SeekEntryResult!6765)

(assert (=> b!634592 (= res!410447 (or (= lt!293356 (MissingZero!6765 i!1108)) (= lt!293356 (MissingVacant!6765 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38193 (_ BitVec 32)) SeekEntryResult!6765)

(assert (=> b!634592 (= lt!293356 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634593 () Bool)

(declare-fun res!410449 () Bool)

(assert (=> b!634593 (=> (not res!410449) (not e!362898))))

(assert (=> b!634593 (= res!410449 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18325 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634594 () Bool)

(declare-fun res!410446 () Bool)

(assert (=> b!634594 (=> (not res!410446) (not e!362898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38193 (_ BitVec 32)) Bool)

(assert (=> b!634594 (= res!410446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634595 () Bool)

(declare-fun Unit!21397 () Unit!21394)

(assert (=> b!634595 (= e!362897 Unit!21397)))

(assert (= (and start!57340 res!410453) b!634583))

(assert (= (and b!634583 res!410440) b!634579))

(assert (= (and b!634579 res!410443) b!634584))

(assert (= (and b!634584 res!410448) b!634578))

(assert (= (and b!634578 res!410452) b!634592))

(assert (= (and b!634592 res!410447) b!634594))

(assert (= (and b!634594 res!410446) b!634590))

(assert (= (and b!634590 res!410439) b!634593))

(assert (= (and b!634593 res!410449) b!634580))

(assert (= (and b!634580 res!410450) b!634581))

(assert (= (and b!634581 res!410451) b!634589))

(assert (= (and b!634589 res!410444) b!634585))

(assert (= (and b!634589 c!72437) b!634586))

(assert (= (and b!634589 (not c!72437)) b!634595))

(assert (= (and b!634589 (not res!410442)) b!634588))

(assert (= (and b!634588 res!410441) b!634582))

(assert (= (and b!634582 (not res!410445)) b!634591))

(assert (= (and b!634591 res!410438) b!634587))

(declare-fun m!609051 () Bool)

(assert (=> b!634589 m!609051))

(declare-fun m!609053 () Bool)

(assert (=> b!634589 m!609053))

(declare-fun m!609055 () Bool)

(assert (=> b!634589 m!609055))

(declare-fun m!609057 () Bool)

(assert (=> b!634589 m!609057))

(declare-fun m!609059 () Bool)

(assert (=> b!634589 m!609059))

(declare-fun m!609061 () Bool)

(assert (=> b!634589 m!609061))

(declare-fun m!609063 () Bool)

(assert (=> b!634589 m!609063))

(assert (=> b!634589 m!609063))

(declare-fun m!609065 () Bool)

(assert (=> b!634589 m!609065))

(declare-fun m!609067 () Bool)

(assert (=> b!634590 m!609067))

(assert (=> b!634579 m!609063))

(assert (=> b!634579 m!609063))

(declare-fun m!609069 () Bool)

(assert (=> b!634579 m!609069))

(declare-fun m!609071 () Bool)

(assert (=> start!57340 m!609071))

(declare-fun m!609073 () Bool)

(assert (=> start!57340 m!609073))

(declare-fun m!609075 () Bool)

(assert (=> b!634592 m!609075))

(declare-fun m!609077 () Bool)

(assert (=> b!634593 m!609077))

(declare-fun m!609079 () Bool)

(assert (=> b!634594 m!609079))

(assert (=> b!634591 m!609063))

(assert (=> b!634591 m!609063))

(declare-fun m!609081 () Bool)

(assert (=> b!634591 m!609081))

(assert (=> b!634587 m!609063))

(assert (=> b!634587 m!609063))

(declare-fun m!609083 () Bool)

(assert (=> b!634587 m!609083))

(declare-fun m!609085 () Bool)

(assert (=> b!634581 m!609085))

(assert (=> b!634581 m!609063))

(assert (=> b!634581 m!609063))

(declare-fun m!609087 () Bool)

(assert (=> b!634581 m!609087))

(assert (=> b!634588 m!609063))

(assert (=> b!634588 m!609053))

(declare-fun m!609089 () Bool)

(assert (=> b!634588 m!609089))

(declare-fun m!609091 () Bool)

(assert (=> b!634578 m!609091))

(assert (=> b!634582 m!609063))

(assert (=> b!634580 m!609053))

(declare-fun m!609093 () Bool)

(assert (=> b!634580 m!609093))

(declare-fun m!609095 () Bool)

(assert (=> b!634584 m!609095))

(check-sat (not b!634591) (not b!634584) (not b!634578) (not b!634589) (not b!634594) (not start!57340) (not b!634581) (not b!634587) (not b!634579) (not b!634592) (not b!634590))
(check-sat)
