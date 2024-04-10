; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53754 () Bool)

(assert start!53754)

(declare-fun b!586405 () Bool)

(declare-fun res!374228 () Bool)

(declare-fun e!335254 () Bool)

(assert (=> b!586405 (=> (not res!374228) (not e!335254))))

(declare-datatypes ((array!36655 0))(
  ( (array!36656 (arr!17602 (Array (_ BitVec 32) (_ BitVec 64))) (size!17966 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36655)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586405 (= res!374228 (validKeyInArray!0 (select (arr!17602 a!2986) j!136)))))

(declare-fun b!586406 () Bool)

(declare-fun e!335255 () Bool)

(assert (=> b!586406 (= e!335254 e!335255)))

(declare-fun res!374227 () Bool)

(assert (=> b!586406 (=> (not res!374227) (not e!335255))))

(declare-datatypes ((SeekEntryResult!6042 0))(
  ( (MissingZero!6042 (index!26395 (_ BitVec 32))) (Found!6042 (index!26396 (_ BitVec 32))) (Intermediate!6042 (undefined!6854 Bool) (index!26397 (_ BitVec 32)) (x!55207 (_ BitVec 32))) (Undefined!6042) (MissingVacant!6042 (index!26398 (_ BitVec 32))) )
))
(declare-fun lt!266086 () SeekEntryResult!6042)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586406 (= res!374227 (or (= lt!266086 (MissingZero!6042 i!1108)) (= lt!266086 (MissingVacant!6042 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36655 (_ BitVec 32)) SeekEntryResult!6042)

(assert (=> b!586406 (= lt!266086 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!374221 () Bool)

(assert (=> start!53754 (=> (not res!374221) (not e!335254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53754 (= res!374221 (validMask!0 mask!3053))))

(assert (=> start!53754 e!335254))

(assert (=> start!53754 true))

(declare-fun array_inv!13398 (array!36655) Bool)

(assert (=> start!53754 (array_inv!13398 a!2986)))

(declare-fun b!586407 () Bool)

(declare-fun res!374230 () Bool)

(assert (=> b!586407 (=> (not res!374230) (not e!335255))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586407 (= res!374230 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17602 a!2986) index!984) (select (arr!17602 a!2986) j!136))) (not (= (select (arr!17602 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586408 () Bool)

(declare-fun res!374229 () Bool)

(assert (=> b!586408 (=> (not res!374229) (not e!335254))))

(assert (=> b!586408 (= res!374229 (and (= (size!17966 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17966 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17966 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586409 () Bool)

(assert (=> b!586409 (= e!335255 (not true))))

(declare-fun lt!266084 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36655 (_ BitVec 32)) SeekEntryResult!6042)

(assert (=> b!586409 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266084 vacantSpotIndex!68 (select (arr!17602 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266084 vacantSpotIndex!68 (select (store (arr!17602 a!2986) i!1108 k0!1786) j!136) (array!36656 (store (arr!17602 a!2986) i!1108 k0!1786) (size!17966 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18204 0))(
  ( (Unit!18205) )
))
(declare-fun lt!266085 () Unit!18204)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36655 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18204)

(assert (=> b!586409 (= lt!266085 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266084 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586409 (= lt!266084 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586410 () Bool)

(declare-fun res!374226 () Bool)

(assert (=> b!586410 (=> (not res!374226) (not e!335255))))

(assert (=> b!586410 (= res!374226 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17602 a!2986) j!136) a!2986 mask!3053) (Found!6042 j!136)))))

(declare-fun b!586411 () Bool)

(declare-fun res!374222 () Bool)

(assert (=> b!586411 (=> (not res!374222) (not e!335255))))

(declare-datatypes ((List!11643 0))(
  ( (Nil!11640) (Cons!11639 (h!12684 (_ BitVec 64)) (t!17871 List!11643)) )
))
(declare-fun arrayNoDuplicates!0 (array!36655 (_ BitVec 32) List!11643) Bool)

(assert (=> b!586411 (= res!374222 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11640))))

(declare-fun b!586412 () Bool)

(declare-fun res!374223 () Bool)

(assert (=> b!586412 (=> (not res!374223) (not e!335254))))

(declare-fun arrayContainsKey!0 (array!36655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586412 (= res!374223 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586413 () Bool)

(declare-fun res!374231 () Bool)

(assert (=> b!586413 (=> (not res!374231) (not e!335254))))

(assert (=> b!586413 (= res!374231 (validKeyInArray!0 k0!1786))))

(declare-fun b!586414 () Bool)

(declare-fun res!374225 () Bool)

(assert (=> b!586414 (=> (not res!374225) (not e!335255))))

(assert (=> b!586414 (= res!374225 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17602 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17602 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586415 () Bool)

(declare-fun res!374224 () Bool)

(assert (=> b!586415 (=> (not res!374224) (not e!335255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36655 (_ BitVec 32)) Bool)

(assert (=> b!586415 (= res!374224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53754 res!374221) b!586408))

(assert (= (and b!586408 res!374229) b!586405))

(assert (= (and b!586405 res!374228) b!586413))

(assert (= (and b!586413 res!374231) b!586412))

(assert (= (and b!586412 res!374223) b!586406))

(assert (= (and b!586406 res!374227) b!586415))

(assert (= (and b!586415 res!374224) b!586411))

(assert (= (and b!586411 res!374222) b!586414))

(assert (= (and b!586414 res!374225) b!586410))

(assert (= (and b!586410 res!374226) b!586407))

(assert (= (and b!586407 res!374230) b!586409))

(declare-fun m!564759 () Bool)

(assert (=> b!586410 m!564759))

(assert (=> b!586410 m!564759))

(declare-fun m!564761 () Bool)

(assert (=> b!586410 m!564761))

(assert (=> b!586405 m!564759))

(assert (=> b!586405 m!564759))

(declare-fun m!564763 () Bool)

(assert (=> b!586405 m!564763))

(declare-fun m!564765 () Bool)

(assert (=> b!586414 m!564765))

(declare-fun m!564767 () Bool)

(assert (=> b!586414 m!564767))

(declare-fun m!564769 () Bool)

(assert (=> b!586414 m!564769))

(declare-fun m!564771 () Bool)

(assert (=> b!586412 m!564771))

(declare-fun m!564773 () Bool)

(assert (=> start!53754 m!564773))

(declare-fun m!564775 () Bool)

(assert (=> start!53754 m!564775))

(declare-fun m!564777 () Bool)

(assert (=> b!586415 m!564777))

(declare-fun m!564779 () Bool)

(assert (=> b!586413 m!564779))

(declare-fun m!564781 () Bool)

(assert (=> b!586409 m!564781))

(declare-fun m!564783 () Bool)

(assert (=> b!586409 m!564783))

(assert (=> b!586409 m!564759))

(declare-fun m!564785 () Bool)

(assert (=> b!586409 m!564785))

(assert (=> b!586409 m!564759))

(assert (=> b!586409 m!564783))

(declare-fun m!564787 () Bool)

(assert (=> b!586409 m!564787))

(assert (=> b!586409 m!564767))

(declare-fun m!564789 () Bool)

(assert (=> b!586409 m!564789))

(declare-fun m!564791 () Bool)

(assert (=> b!586407 m!564791))

(assert (=> b!586407 m!564759))

(declare-fun m!564793 () Bool)

(assert (=> b!586411 m!564793))

(declare-fun m!564795 () Bool)

(assert (=> b!586406 m!564795))

(check-sat (not b!586415) (not b!586409) (not b!586405) (not b!586411) (not b!586413) (not start!53754) (not b!586410) (not b!586412) (not b!586406))
(check-sat)
