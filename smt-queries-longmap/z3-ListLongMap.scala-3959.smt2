; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53814 () Bool)

(assert start!53814)

(declare-fun b!586779 () Bool)

(declare-fun e!335428 () Bool)

(declare-fun e!335429 () Bool)

(assert (=> b!586779 (= e!335428 e!335429)))

(declare-fun res!374490 () Bool)

(assert (=> b!586779 (=> (not res!374490) (not e!335429))))

(declare-datatypes ((SeekEntryResult!5998 0))(
  ( (MissingZero!5998 (index!26219 (_ BitVec 32))) (Found!5998 (index!26220 (_ BitVec 32))) (Intermediate!5998 (undefined!6810 Bool) (index!26221 (_ BitVec 32)) (x!55182 (_ BitVec 32))) (Undefined!5998) (MissingVacant!5998 (index!26222 (_ BitVec 32))) )
))
(declare-fun lt!266233 () SeekEntryResult!5998)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586779 (= res!374490 (or (= lt!266233 (MissingZero!5998 i!1108)) (= lt!266233 (MissingVacant!5998 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36660 0))(
  ( (array!36661 (arr!17602 (Array (_ BitVec 32) (_ BitVec 64))) (size!17966 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36660)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36660 (_ BitVec 32)) SeekEntryResult!5998)

(assert (=> b!586779 (= lt!266233 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586780 () Bool)

(declare-fun res!374499 () Bool)

(assert (=> b!586780 (=> (not res!374499) (not e!335429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36660 (_ BitVec 32)) Bool)

(assert (=> b!586780 (= res!374499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586781 () Bool)

(declare-fun res!374500 () Bool)

(assert (=> b!586781 (=> (not res!374500) (not e!335428))))

(declare-fun arrayContainsKey!0 (array!36660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586781 (= res!374500 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586782 () Bool)

(assert (=> b!586782 (= e!335429 (not true))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!266232 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36660 (_ BitVec 32)) SeekEntryResult!5998)

(assert (=> b!586782 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266232 vacantSpotIndex!68 (select (arr!17602 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266232 vacantSpotIndex!68 (select (store (arr!17602 a!2986) i!1108 k0!1786) j!136) (array!36661 (store (arr!17602 a!2986) i!1108 k0!1786) (size!17966 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18193 0))(
  ( (Unit!18194) )
))
(declare-fun lt!266231 () Unit!18193)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36660 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18193)

(assert (=> b!586782 (= lt!266231 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266232 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586782 (= lt!266232 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!586783 () Bool)

(declare-fun res!374498 () Bool)

(assert (=> b!586783 (=> (not res!374498) (not e!335429))))

(declare-datatypes ((List!11550 0))(
  ( (Nil!11547) (Cons!11546 (h!12594 (_ BitVec 64)) (t!17770 List!11550)) )
))
(declare-fun arrayNoDuplicates!0 (array!36660 (_ BitVec 32) List!11550) Bool)

(assert (=> b!586783 (= res!374498 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11547))))

(declare-fun b!586784 () Bool)

(declare-fun res!374497 () Bool)

(assert (=> b!586784 (=> (not res!374497) (not e!335429))))

(assert (=> b!586784 (= res!374497 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17602 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17602 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586786 () Bool)

(declare-fun res!374492 () Bool)

(assert (=> b!586786 (=> (not res!374492) (not e!335428))))

(assert (=> b!586786 (= res!374492 (and (= (size!17966 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17966 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17966 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586787 () Bool)

(declare-fun res!374493 () Bool)

(assert (=> b!586787 (=> (not res!374493) (not e!335428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586787 (= res!374493 (validKeyInArray!0 (select (arr!17602 a!2986) j!136)))))

(declare-fun res!374496 () Bool)

(assert (=> start!53814 (=> (not res!374496) (not e!335428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53814 (= res!374496 (validMask!0 mask!3053))))

(assert (=> start!53814 e!335428))

(assert (=> start!53814 true))

(declare-fun array_inv!13461 (array!36660) Bool)

(assert (=> start!53814 (array_inv!13461 a!2986)))

(declare-fun b!586785 () Bool)

(declare-fun res!374491 () Bool)

(assert (=> b!586785 (=> (not res!374491) (not e!335429))))

(assert (=> b!586785 (= res!374491 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17602 a!2986) index!984) (select (arr!17602 a!2986) j!136))) (not (= (select (arr!17602 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586788 () Bool)

(declare-fun res!374495 () Bool)

(assert (=> b!586788 (=> (not res!374495) (not e!335428))))

(assert (=> b!586788 (= res!374495 (validKeyInArray!0 k0!1786))))

(declare-fun b!586789 () Bool)

(declare-fun res!374494 () Bool)

(assert (=> b!586789 (=> (not res!374494) (not e!335429))))

(assert (=> b!586789 (= res!374494 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17602 a!2986) j!136) a!2986 mask!3053) (Found!5998 j!136)))))

(assert (= (and start!53814 res!374496) b!586786))

(assert (= (and b!586786 res!374492) b!586787))

(assert (= (and b!586787 res!374493) b!586788))

(assert (= (and b!586788 res!374495) b!586781))

(assert (= (and b!586781 res!374500) b!586779))

(assert (= (and b!586779 res!374490) b!586780))

(assert (= (and b!586780 res!374499) b!586783))

(assert (= (and b!586783 res!374498) b!586784))

(assert (= (and b!586784 res!374497) b!586789))

(assert (= (and b!586789 res!374494) b!586785))

(assert (= (and b!586785 res!374491) b!586782))

(declare-fun m!565307 () Bool)

(assert (=> b!586780 m!565307))

(declare-fun m!565309 () Bool)

(assert (=> b!586788 m!565309))

(declare-fun m!565311 () Bool)

(assert (=> start!53814 m!565311))

(declare-fun m!565313 () Bool)

(assert (=> start!53814 m!565313))

(declare-fun m!565315 () Bool)

(assert (=> b!586783 m!565315))

(declare-fun m!565317 () Bool)

(assert (=> b!586785 m!565317))

(declare-fun m!565319 () Bool)

(assert (=> b!586785 m!565319))

(assert (=> b!586789 m!565319))

(assert (=> b!586789 m!565319))

(declare-fun m!565321 () Bool)

(assert (=> b!586789 m!565321))

(declare-fun m!565323 () Bool)

(assert (=> b!586782 m!565323))

(assert (=> b!586782 m!565323))

(declare-fun m!565325 () Bool)

(assert (=> b!586782 m!565325))

(assert (=> b!586782 m!565319))

(declare-fun m!565327 () Bool)

(assert (=> b!586782 m!565327))

(declare-fun m!565329 () Bool)

(assert (=> b!586782 m!565329))

(declare-fun m!565331 () Bool)

(assert (=> b!586782 m!565331))

(assert (=> b!586782 m!565319))

(declare-fun m!565333 () Bool)

(assert (=> b!586782 m!565333))

(declare-fun m!565335 () Bool)

(assert (=> b!586779 m!565335))

(declare-fun m!565337 () Bool)

(assert (=> b!586781 m!565337))

(declare-fun m!565339 () Bool)

(assert (=> b!586784 m!565339))

(assert (=> b!586784 m!565327))

(declare-fun m!565341 () Bool)

(assert (=> b!586784 m!565341))

(assert (=> b!586787 m!565319))

(assert (=> b!586787 m!565319))

(declare-fun m!565343 () Bool)

(assert (=> b!586787 m!565343))

(check-sat (not b!586781) (not b!586783) (not b!586780) (not b!586779) (not b!586782) (not b!586788) (not b!586787) (not b!586789) (not start!53814))
(check-sat)
