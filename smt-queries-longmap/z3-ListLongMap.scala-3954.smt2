; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53784 () Bool)

(assert start!53784)

(declare-fun b!586284 () Bool)

(declare-fun res!374000 () Bool)

(declare-fun e!335293 () Bool)

(assert (=> b!586284 (=> (not res!374000) (not e!335293))))

(declare-datatypes ((array!36630 0))(
  ( (array!36631 (arr!17587 (Array (_ BitVec 32) (_ BitVec 64))) (size!17951 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36630)

(declare-datatypes ((List!11535 0))(
  ( (Nil!11532) (Cons!11531 (h!12579 (_ BitVec 64)) (t!17755 List!11535)) )
))
(declare-fun arrayNoDuplicates!0 (array!36630 (_ BitVec 32) List!11535) Bool)

(assert (=> b!586284 (= res!374000 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11532))))

(declare-fun res!373997 () Bool)

(declare-fun e!335294 () Bool)

(assert (=> start!53784 (=> (not res!373997) (not e!335294))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53784 (= res!373997 (validMask!0 mask!3053))))

(assert (=> start!53784 e!335294))

(assert (=> start!53784 true))

(declare-fun array_inv!13446 (array!36630) Bool)

(assert (=> start!53784 (array_inv!13446 a!2986)))

(declare-fun b!586285 () Bool)

(declare-fun res!374005 () Bool)

(assert (=> b!586285 (=> (not res!374005) (not e!335294))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586285 (= res!374005 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586286 () Bool)

(declare-fun res!374004 () Bool)

(assert (=> b!586286 (=> (not res!374004) (not e!335294))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586286 (= res!374004 (and (= (size!17951 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17951 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17951 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586287 () Bool)

(declare-fun res!374001 () Bool)

(assert (=> b!586287 (=> (not res!374001) (not e!335294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586287 (= res!374001 (validKeyInArray!0 k0!1786))))

(declare-fun b!586288 () Bool)

(declare-fun res!373995 () Bool)

(assert (=> b!586288 (=> (not res!373995) (not e!335293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36630 (_ BitVec 32)) Bool)

(assert (=> b!586288 (= res!373995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586289 () Bool)

(declare-fun res!373998 () Bool)

(assert (=> b!586289 (=> (not res!373998) (not e!335294))))

(assert (=> b!586289 (= res!373998 (validKeyInArray!0 (select (arr!17587 a!2986) j!136)))))

(declare-fun b!586290 () Bool)

(declare-fun res!374002 () Bool)

(assert (=> b!586290 (=> (not res!374002) (not e!335293))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5983 0))(
  ( (MissingZero!5983 (index!26159 (_ BitVec 32))) (Found!5983 (index!26160 (_ BitVec 32))) (Intermediate!5983 (undefined!6795 Bool) (index!26161 (_ BitVec 32)) (x!55127 (_ BitVec 32))) (Undefined!5983) (MissingVacant!5983 (index!26162 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36630 (_ BitVec 32)) SeekEntryResult!5983)

(assert (=> b!586290 (= res!374002 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17587 a!2986) j!136) a!2986 mask!3053) (Found!5983 j!136)))))

(declare-fun b!586291 () Bool)

(declare-fun res!373996 () Bool)

(assert (=> b!586291 (=> (not res!373996) (not e!335293))))

(assert (=> b!586291 (= res!373996 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17587 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17587 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586292 () Bool)

(assert (=> b!586292 (= e!335294 e!335293)))

(declare-fun res!373999 () Bool)

(assert (=> b!586292 (=> (not res!373999) (not e!335293))))

(declare-fun lt!266097 () SeekEntryResult!5983)

(assert (=> b!586292 (= res!373999 (or (= lt!266097 (MissingZero!5983 i!1108)) (= lt!266097 (MissingVacant!5983 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36630 (_ BitVec 32)) SeekEntryResult!5983)

(assert (=> b!586292 (= lt!266097 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586293 () Bool)

(assert (=> b!586293 (= e!335293 (not true))))

(declare-fun lt!266098 () (_ BitVec 32))

(assert (=> b!586293 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266098 vacantSpotIndex!68 (select (arr!17587 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266098 vacantSpotIndex!68 (select (store (arr!17587 a!2986) i!1108 k0!1786) j!136) (array!36631 (store (arr!17587 a!2986) i!1108 k0!1786) (size!17951 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18163 0))(
  ( (Unit!18164) )
))
(declare-fun lt!266096 () Unit!18163)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36630 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18163)

(assert (=> b!586293 (= lt!266096 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266098 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586293 (= lt!266098 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!586294 () Bool)

(declare-fun res!374003 () Bool)

(assert (=> b!586294 (=> (not res!374003) (not e!335293))))

(assert (=> b!586294 (= res!374003 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17587 a!2986) index!984) (select (arr!17587 a!2986) j!136))) (not (= (select (arr!17587 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53784 res!373997) b!586286))

(assert (= (and b!586286 res!374004) b!586289))

(assert (= (and b!586289 res!373998) b!586287))

(assert (= (and b!586287 res!374001) b!586285))

(assert (= (and b!586285 res!374005) b!586292))

(assert (= (and b!586292 res!373999) b!586288))

(assert (= (and b!586288 res!373995) b!586284))

(assert (= (and b!586284 res!374000) b!586291))

(assert (= (and b!586291 res!373996) b!586290))

(assert (= (and b!586290 res!374002) b!586294))

(assert (= (and b!586294 res!374003) b!586293))

(declare-fun m!564737 () Bool)

(assert (=> start!53784 m!564737))

(declare-fun m!564739 () Bool)

(assert (=> start!53784 m!564739))

(declare-fun m!564741 () Bool)

(assert (=> b!586284 m!564741))

(declare-fun m!564743 () Bool)

(assert (=> b!586293 m!564743))

(declare-fun m!564745 () Bool)

(assert (=> b!586293 m!564745))

(declare-fun m!564747 () Bool)

(assert (=> b!586293 m!564747))

(declare-fun m!564749 () Bool)

(assert (=> b!586293 m!564749))

(declare-fun m!564751 () Bool)

(assert (=> b!586293 m!564751))

(declare-fun m!564753 () Bool)

(assert (=> b!586293 m!564753))

(assert (=> b!586293 m!564749))

(assert (=> b!586293 m!564745))

(declare-fun m!564755 () Bool)

(assert (=> b!586293 m!564755))

(declare-fun m!564757 () Bool)

(assert (=> b!586287 m!564757))

(declare-fun m!564759 () Bool)

(assert (=> b!586292 m!564759))

(declare-fun m!564761 () Bool)

(assert (=> b!586285 m!564761))

(assert (=> b!586289 m!564749))

(assert (=> b!586289 m!564749))

(declare-fun m!564763 () Bool)

(assert (=> b!586289 m!564763))

(declare-fun m!564765 () Bool)

(assert (=> b!586288 m!564765))

(assert (=> b!586290 m!564749))

(assert (=> b!586290 m!564749))

(declare-fun m!564767 () Bool)

(assert (=> b!586290 m!564767))

(declare-fun m!564769 () Bool)

(assert (=> b!586291 m!564769))

(assert (=> b!586291 m!564747))

(declare-fun m!564771 () Bool)

(assert (=> b!586291 m!564771))

(declare-fun m!564773 () Bool)

(assert (=> b!586294 m!564773))

(assert (=> b!586294 m!564749))

(check-sat (not b!586293) (not b!586285) (not b!586289) (not b!586288) (not b!586290) (not b!586292) (not b!586287) (not start!53784) (not b!586284))
(check-sat)
