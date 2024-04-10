; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56824 () Bool)

(assert start!56824)

(declare-fun b!629425 () Bool)

(declare-fun res!406820 () Bool)

(declare-fun e!359987 () Bool)

(assert (=> b!629425 (=> (not res!406820) (not e!359987))))

(declare-datatypes ((array!38014 0))(
  ( (array!38015 (arr!18244 (Array (_ BitVec 32) (_ BitVec 64))) (size!18608 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38014)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629425 (= res!406820 (validKeyInArray!0 (select (arr!18244 a!2986) j!136)))))

(declare-fun b!629426 () Bool)

(declare-fun res!406828 () Bool)

(assert (=> b!629426 (=> (not res!406828) (not e!359987))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629426 (= res!406828 (and (= (size!18608 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18608 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18608 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629427 () Bool)

(declare-fun res!406825 () Bool)

(declare-fun e!359988 () Bool)

(assert (=> b!629427 (=> (not res!406825) (not e!359988))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6684 0))(
  ( (MissingZero!6684 (index!29020 (_ BitVec 32))) (Found!6684 (index!29021 (_ BitVec 32))) (Intermediate!6684 (undefined!7496 Bool) (index!29022 (_ BitVec 32)) (x!57756 (_ BitVec 32))) (Undefined!6684) (MissingVacant!6684 (index!29023 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38014 (_ BitVec 32)) SeekEntryResult!6684)

(assert (=> b!629427 (= res!406825 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053) (Found!6684 j!136)))))

(declare-fun b!629428 () Bool)

(declare-fun res!406822 () Bool)

(assert (=> b!629428 (=> (not res!406822) (not e!359988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38014 (_ BitVec 32)) Bool)

(assert (=> b!629428 (= res!406822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!406827 () Bool)

(assert (=> start!56824 (=> (not res!406827) (not e!359987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56824 (= res!406827 (validMask!0 mask!3053))))

(assert (=> start!56824 e!359987))

(assert (=> start!56824 true))

(declare-fun array_inv!14040 (array!38014) Bool)

(assert (=> start!56824 (array_inv!14040 a!2986)))

(declare-fun b!629429 () Bool)

(declare-fun res!406829 () Bool)

(assert (=> b!629429 (=> (not res!406829) (not e!359988))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!629429 (= res!406829 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18244 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18244 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629430 () Bool)

(declare-fun res!406824 () Bool)

(assert (=> b!629430 (=> (not res!406824) (not e!359988))))

(declare-datatypes ((List!12285 0))(
  ( (Nil!12282) (Cons!12281 (h!13326 (_ BitVec 64)) (t!18513 List!12285)) )
))
(declare-fun arrayNoDuplicates!0 (array!38014 (_ BitVec 32) List!12285) Bool)

(assert (=> b!629430 (= res!406824 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12282))))

(declare-fun b!629431 () Bool)

(assert (=> b!629431 (= e!359987 e!359988)))

(declare-fun res!406826 () Bool)

(assert (=> b!629431 (=> (not res!406826) (not e!359988))))

(declare-fun lt!290748 () SeekEntryResult!6684)

(assert (=> b!629431 (= res!406826 (or (= lt!290748 (MissingZero!6684 i!1108)) (= lt!290748 (MissingVacant!6684 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38014 (_ BitVec 32)) SeekEntryResult!6684)

(assert (=> b!629431 (= lt!290748 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629432 () Bool)

(declare-fun res!406819 () Bool)

(assert (=> b!629432 (=> (not res!406819) (not e!359987))))

(assert (=> b!629432 (= res!406819 (validKeyInArray!0 k0!1786))))

(declare-fun b!629433 () Bool)

(assert (=> b!629433 (= e!359988 (not true))))

(declare-fun lt!290747 () (_ BitVec 32))

(assert (=> b!629433 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290747 vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290747 vacantSpotIndex!68 (select (store (arr!18244 a!2986) i!1108 k0!1786) j!136) (array!38015 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21110 0))(
  ( (Unit!21111) )
))
(declare-fun lt!290749 () Unit!21110)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38014 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21110)

(assert (=> b!629433 (= lt!290749 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290747 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629433 (= lt!290747 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629434 () Bool)

(declare-fun res!406823 () Bool)

(assert (=> b!629434 (=> (not res!406823) (not e!359988))))

(assert (=> b!629434 (= res!406823 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18244 a!2986) index!984) (select (arr!18244 a!2986) j!136))) (not (= (select (arr!18244 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629435 () Bool)

(declare-fun res!406821 () Bool)

(assert (=> b!629435 (=> (not res!406821) (not e!359987))))

(declare-fun arrayContainsKey!0 (array!38014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629435 (= res!406821 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56824 res!406827) b!629426))

(assert (= (and b!629426 res!406828) b!629425))

(assert (= (and b!629425 res!406820) b!629432))

(assert (= (and b!629432 res!406819) b!629435))

(assert (= (and b!629435 res!406821) b!629431))

(assert (= (and b!629431 res!406826) b!629428))

(assert (= (and b!629428 res!406822) b!629430))

(assert (= (and b!629430 res!406824) b!629429))

(assert (= (and b!629429 res!406829) b!629427))

(assert (= (and b!629427 res!406825) b!629434))

(assert (= (and b!629434 res!406823) b!629433))

(declare-fun m!604427 () Bool)

(assert (=> b!629430 m!604427))

(declare-fun m!604429 () Bool)

(assert (=> b!629433 m!604429))

(declare-fun m!604431 () Bool)

(assert (=> b!629433 m!604431))

(declare-fun m!604433 () Bool)

(assert (=> b!629433 m!604433))

(assert (=> b!629433 m!604433))

(declare-fun m!604435 () Bool)

(assert (=> b!629433 m!604435))

(declare-fun m!604437 () Bool)

(assert (=> b!629433 m!604437))

(declare-fun m!604439 () Bool)

(assert (=> b!629433 m!604439))

(assert (=> b!629433 m!604431))

(declare-fun m!604441 () Bool)

(assert (=> b!629433 m!604441))

(declare-fun m!604443 () Bool)

(assert (=> b!629435 m!604443))

(assert (=> b!629427 m!604433))

(assert (=> b!629427 m!604433))

(declare-fun m!604445 () Bool)

(assert (=> b!629427 m!604445))

(declare-fun m!604447 () Bool)

(assert (=> b!629431 m!604447))

(declare-fun m!604449 () Bool)

(assert (=> start!56824 m!604449))

(declare-fun m!604451 () Bool)

(assert (=> start!56824 m!604451))

(declare-fun m!604453 () Bool)

(assert (=> b!629434 m!604453))

(assert (=> b!629434 m!604433))

(declare-fun m!604455 () Bool)

(assert (=> b!629432 m!604455))

(assert (=> b!629425 m!604433))

(assert (=> b!629425 m!604433))

(declare-fun m!604457 () Bool)

(assert (=> b!629425 m!604457))

(declare-fun m!604459 () Bool)

(assert (=> b!629429 m!604459))

(assert (=> b!629429 m!604437))

(declare-fun m!604461 () Bool)

(assert (=> b!629429 m!604461))

(declare-fun m!604463 () Bool)

(assert (=> b!629428 m!604463))

(check-sat (not b!629430) (not b!629425) (not start!56824) (not b!629427) (not b!629435) (not b!629432) (not b!629431) (not b!629433) (not b!629428))
(check-sat)
