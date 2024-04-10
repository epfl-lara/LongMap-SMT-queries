; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53886 () Bool)

(assert start!53886)

(declare-fun b!587845 () Bool)

(declare-fun e!335753 () Bool)

(assert (=> b!587845 (= e!335753 (not true))))

(declare-fun e!335750 () Bool)

(assert (=> b!587845 e!335750))

(declare-fun res!375490 () Bool)

(assert (=> b!587845 (=> (not res!375490) (not e!335750))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!266524 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36730 0))(
  ( (array!36731 (arr!17638 (Array (_ BitVec 32) (_ BitVec 64))) (size!18002 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36730)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6078 0))(
  ( (MissingZero!6078 (index!26542 (_ BitVec 32))) (Found!6078 (index!26543 (_ BitVec 32))) (Intermediate!6078 (undefined!6890 Bool) (index!26544 (_ BitVec 32)) (x!55348 (_ BitVec 32))) (Undefined!6078) (MissingVacant!6078 (index!26545 (_ BitVec 32))) )
))
(declare-fun lt!266522 () SeekEntryResult!6078)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36730 (_ BitVec 32)) SeekEntryResult!6078)

(assert (=> b!587845 (= res!375490 (= lt!266522 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266524 vacantSpotIndex!68 (select (store (arr!17638 a!2986) i!1108 k0!1786) j!136) (array!36731 (store (arr!17638 a!2986) i!1108 k0!1786) (size!18002 a!2986)) mask!3053)))))

(assert (=> b!587845 (= lt!266522 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266524 vacantSpotIndex!68 (select (arr!17638 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18276 0))(
  ( (Unit!18277) )
))
(declare-fun lt!266523 () Unit!18276)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36730 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18276)

(assert (=> b!587845 (= lt!266523 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266524 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587845 (= lt!266524 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587846 () Bool)

(declare-fun res!375482 () Bool)

(declare-fun e!335754 () Bool)

(assert (=> b!587846 (=> (not res!375482) (not e!335754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587846 (= res!375482 (validKeyInArray!0 (select (arr!17638 a!2986) j!136)))))

(declare-fun b!587847 () Bool)

(declare-fun res!375488 () Bool)

(declare-fun e!335752 () Bool)

(assert (=> b!587847 (=> (not res!375488) (not e!335752))))

(declare-datatypes ((List!11679 0))(
  ( (Nil!11676) (Cons!11675 (h!12720 (_ BitVec 64)) (t!17907 List!11679)) )
))
(declare-fun arrayNoDuplicates!0 (array!36730 (_ BitVec 32) List!11679) Bool)

(assert (=> b!587847 (= res!375488 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11676))))

(declare-fun b!587848 () Bool)

(declare-fun res!375489 () Bool)

(assert (=> b!587848 (=> (not res!375489) (not e!335754))))

(assert (=> b!587848 (= res!375489 (and (= (size!18002 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18002 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18002 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587849 () Bool)

(declare-fun res!375486 () Bool)

(assert (=> b!587849 (=> (not res!375486) (not e!335754))))

(declare-fun arrayContainsKey!0 (array!36730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587849 (= res!375486 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587850 () Bool)

(assert (=> b!587850 (= e!335754 e!335752)))

(declare-fun res!375484 () Bool)

(assert (=> b!587850 (=> (not res!375484) (not e!335752))))

(declare-fun lt!266520 () SeekEntryResult!6078)

(assert (=> b!587850 (= res!375484 (or (= lt!266520 (MissingZero!6078 i!1108)) (= lt!266520 (MissingVacant!6078 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36730 (_ BitVec 32)) SeekEntryResult!6078)

(assert (=> b!587850 (= lt!266520 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587851 () Bool)

(declare-fun res!375481 () Bool)

(assert (=> b!587851 (=> (not res!375481) (not e!335752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36730 (_ BitVec 32)) Bool)

(assert (=> b!587851 (= res!375481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!375491 () Bool)

(assert (=> start!53886 (=> (not res!375491) (not e!335754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53886 (= res!375491 (validMask!0 mask!3053))))

(assert (=> start!53886 e!335754))

(assert (=> start!53886 true))

(declare-fun array_inv!13434 (array!36730) Bool)

(assert (=> start!53886 (array_inv!13434 a!2986)))

(declare-fun b!587852 () Bool)

(declare-fun res!375485 () Bool)

(assert (=> b!587852 (=> (not res!375485) (not e!335752))))

(assert (=> b!587852 (= res!375485 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17638 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17638 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587853 () Bool)

(declare-fun res!375483 () Bool)

(assert (=> b!587853 (=> (not res!375483) (not e!335754))))

(assert (=> b!587853 (= res!375483 (validKeyInArray!0 k0!1786))))

(declare-fun b!587854 () Bool)

(assert (=> b!587854 (= e!335752 e!335753)))

(declare-fun res!375487 () Bool)

(assert (=> b!587854 (=> (not res!375487) (not e!335753))))

(declare-fun lt!266521 () SeekEntryResult!6078)

(assert (=> b!587854 (= res!375487 (and (= lt!266521 (Found!6078 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17638 a!2986) index!984) (select (arr!17638 a!2986) j!136))) (not (= (select (arr!17638 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!587854 (= lt!266521 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17638 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587855 () Bool)

(assert (=> b!587855 (= e!335750 (= lt!266521 lt!266522))))

(assert (= (and start!53886 res!375491) b!587848))

(assert (= (and b!587848 res!375489) b!587846))

(assert (= (and b!587846 res!375482) b!587853))

(assert (= (and b!587853 res!375483) b!587849))

(assert (= (and b!587849 res!375486) b!587850))

(assert (= (and b!587850 res!375484) b!587851))

(assert (= (and b!587851 res!375481) b!587847))

(assert (= (and b!587847 res!375488) b!587852))

(assert (= (and b!587852 res!375485) b!587854))

(assert (= (and b!587854 res!375487) b!587845))

(assert (= (and b!587845 res!375490) b!587855))

(declare-fun m!566307 () Bool)

(assert (=> b!587854 m!566307))

(declare-fun m!566309 () Bool)

(assert (=> b!587854 m!566309))

(assert (=> b!587854 m!566309))

(declare-fun m!566311 () Bool)

(assert (=> b!587854 m!566311))

(declare-fun m!566313 () Bool)

(assert (=> b!587853 m!566313))

(declare-fun m!566315 () Bool)

(assert (=> b!587850 m!566315))

(declare-fun m!566317 () Bool)

(assert (=> start!53886 m!566317))

(declare-fun m!566319 () Bool)

(assert (=> start!53886 m!566319))

(declare-fun m!566321 () Bool)

(assert (=> b!587845 m!566321))

(declare-fun m!566323 () Bool)

(assert (=> b!587845 m!566323))

(assert (=> b!587845 m!566309))

(declare-fun m!566325 () Bool)

(assert (=> b!587845 m!566325))

(assert (=> b!587845 m!566323))

(declare-fun m!566327 () Bool)

(assert (=> b!587845 m!566327))

(declare-fun m!566329 () Bool)

(assert (=> b!587845 m!566329))

(assert (=> b!587845 m!566309))

(declare-fun m!566331 () Bool)

(assert (=> b!587845 m!566331))

(declare-fun m!566333 () Bool)

(assert (=> b!587847 m!566333))

(declare-fun m!566335 () Bool)

(assert (=> b!587852 m!566335))

(assert (=> b!587852 m!566325))

(declare-fun m!566337 () Bool)

(assert (=> b!587852 m!566337))

(declare-fun m!566339 () Bool)

(assert (=> b!587849 m!566339))

(declare-fun m!566341 () Bool)

(assert (=> b!587851 m!566341))

(assert (=> b!587846 m!566309))

(assert (=> b!587846 m!566309))

(declare-fun m!566343 () Bool)

(assert (=> b!587846 m!566343))

(check-sat (not start!53886) (not b!587849) (not b!587845) (not b!587853) (not b!587850) (not b!587851) (not b!587854) (not b!587847) (not b!587846))
(check-sat)
