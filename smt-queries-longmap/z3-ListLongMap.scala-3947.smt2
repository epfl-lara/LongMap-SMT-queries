; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53694 () Bool)

(assert start!53694)

(declare-fun b!585402 () Bool)

(declare-fun res!373225 () Bool)

(declare-fun e!334972 () Bool)

(assert (=> b!585402 (=> (not res!373225) (not e!334972))))

(declare-datatypes ((array!36595 0))(
  ( (array!36596 (arr!17572 (Array (_ BitVec 32) (_ BitVec 64))) (size!17936 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36595)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585402 (= res!373225 (validKeyInArray!0 (select (arr!17572 a!2986) j!136)))))

(declare-fun b!585403 () Bool)

(declare-fun res!373227 () Bool)

(declare-fun e!334974 () Bool)

(assert (=> b!585403 (=> (not res!373227) (not e!334974))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585403 (= res!373227 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17572 a!2986) index!984) (select (arr!17572 a!2986) j!136))) (not (= (select (arr!17572 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585404 () Bool)

(declare-fun res!373228 () Bool)

(assert (=> b!585404 (=> (not res!373228) (not e!334974))))

(declare-datatypes ((List!11613 0))(
  ( (Nil!11610) (Cons!11609 (h!12654 (_ BitVec 64)) (t!17841 List!11613)) )
))
(declare-fun arrayNoDuplicates!0 (array!36595 (_ BitVec 32) List!11613) Bool)

(assert (=> b!585404 (= res!373228 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11610))))

(declare-fun b!585405 () Bool)

(declare-fun res!373221 () Bool)

(assert (=> b!585405 (=> (not res!373221) (not e!334974))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36595 (_ BitVec 32)) Bool)

(assert (=> b!585405 (= res!373221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585407 () Bool)

(declare-fun res!373218 () Bool)

(assert (=> b!585407 (=> (not res!373218) (not e!334972))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585407 (= res!373218 (and (= (size!17936 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17936 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17936 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585408 () Bool)

(declare-fun res!373226 () Bool)

(assert (=> b!585408 (=> (not res!373226) (not e!334974))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6012 0))(
  ( (MissingZero!6012 (index!26275 (_ BitVec 32))) (Found!6012 (index!26276 (_ BitVec 32))) (Intermediate!6012 (undefined!6824 Bool) (index!26277 (_ BitVec 32)) (x!55097 (_ BitVec 32))) (Undefined!6012) (MissingVacant!6012 (index!26278 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36595 (_ BitVec 32)) SeekEntryResult!6012)

(assert (=> b!585408 (= res!373226 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17572 a!2986) j!136) a!2986 mask!3053) (Found!6012 j!136)))))

(declare-fun b!585409 () Bool)

(declare-fun e!334973 () Bool)

(assert (=> b!585409 (= e!334973 false)))

(declare-fun lt!265815 () SeekEntryResult!6012)

(declare-fun lt!265814 () (_ BitVec 32))

(assert (=> b!585409 (= lt!265815 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265814 vacantSpotIndex!68 (select (arr!17572 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585410 () Bool)

(assert (=> b!585410 (= e!334972 e!334974)))

(declare-fun res!373220 () Bool)

(assert (=> b!585410 (=> (not res!373220) (not e!334974))))

(declare-fun lt!265816 () SeekEntryResult!6012)

(assert (=> b!585410 (= res!373220 (or (= lt!265816 (MissingZero!6012 i!1108)) (= lt!265816 (MissingVacant!6012 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36595 (_ BitVec 32)) SeekEntryResult!6012)

(assert (=> b!585410 (= lt!265816 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585411 () Bool)

(declare-fun res!373219 () Bool)

(assert (=> b!585411 (=> (not res!373219) (not e!334974))))

(assert (=> b!585411 (= res!373219 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17572 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17572 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585412 () Bool)

(assert (=> b!585412 (= e!334974 e!334973)))

(declare-fun res!373223 () Bool)

(assert (=> b!585412 (=> (not res!373223) (not e!334973))))

(assert (=> b!585412 (= res!373223 (and (bvsge lt!265814 #b00000000000000000000000000000000) (bvslt lt!265814 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585412 (= lt!265814 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585413 () Bool)

(declare-fun res!373224 () Bool)

(assert (=> b!585413 (=> (not res!373224) (not e!334972))))

(assert (=> b!585413 (= res!373224 (validKeyInArray!0 k0!1786))))

(declare-fun res!373229 () Bool)

(assert (=> start!53694 (=> (not res!373229) (not e!334972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53694 (= res!373229 (validMask!0 mask!3053))))

(assert (=> start!53694 e!334972))

(assert (=> start!53694 true))

(declare-fun array_inv!13368 (array!36595) Bool)

(assert (=> start!53694 (array_inv!13368 a!2986)))

(declare-fun b!585406 () Bool)

(declare-fun res!373222 () Bool)

(assert (=> b!585406 (=> (not res!373222) (not e!334972))))

(declare-fun arrayContainsKey!0 (array!36595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585406 (= res!373222 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53694 res!373229) b!585407))

(assert (= (and b!585407 res!373218) b!585402))

(assert (= (and b!585402 res!373225) b!585413))

(assert (= (and b!585413 res!373224) b!585406))

(assert (= (and b!585406 res!373222) b!585410))

(assert (= (and b!585410 res!373220) b!585405))

(assert (= (and b!585405 res!373221) b!585404))

(assert (= (and b!585404 res!373228) b!585411))

(assert (= (and b!585411 res!373219) b!585408))

(assert (= (and b!585408 res!373226) b!585403))

(assert (= (and b!585403 res!373227) b!585412))

(assert (= (and b!585412 res!373223) b!585409))

(declare-fun m!563649 () Bool)

(assert (=> b!585405 m!563649))

(declare-fun m!563651 () Bool)

(assert (=> b!585402 m!563651))

(assert (=> b!585402 m!563651))

(declare-fun m!563653 () Bool)

(assert (=> b!585402 m!563653))

(declare-fun m!563655 () Bool)

(assert (=> b!585413 m!563655))

(declare-fun m!563657 () Bool)

(assert (=> start!53694 m!563657))

(declare-fun m!563659 () Bool)

(assert (=> start!53694 m!563659))

(declare-fun m!563661 () Bool)

(assert (=> b!585406 m!563661))

(declare-fun m!563663 () Bool)

(assert (=> b!585412 m!563663))

(assert (=> b!585409 m!563651))

(assert (=> b!585409 m!563651))

(declare-fun m!563665 () Bool)

(assert (=> b!585409 m!563665))

(declare-fun m!563667 () Bool)

(assert (=> b!585411 m!563667))

(declare-fun m!563669 () Bool)

(assert (=> b!585411 m!563669))

(declare-fun m!563671 () Bool)

(assert (=> b!585411 m!563671))

(declare-fun m!563673 () Bool)

(assert (=> b!585410 m!563673))

(assert (=> b!585408 m!563651))

(assert (=> b!585408 m!563651))

(declare-fun m!563675 () Bool)

(assert (=> b!585408 m!563675))

(declare-fun m!563677 () Bool)

(assert (=> b!585403 m!563677))

(assert (=> b!585403 m!563651))

(declare-fun m!563679 () Bool)

(assert (=> b!585404 m!563679))

(check-sat (not b!585405) (not b!585412) (not b!585409) (not b!585402) (not b!585406) (not start!53694) (not b!585408) (not b!585413) (not b!585410) (not b!585404))
