; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53790 () Bool)

(assert start!53790)

(declare-fun b!586999 () Bool)

(declare-fun res!374820 () Bool)

(declare-fun e!335418 () Bool)

(assert (=> b!586999 (=> (not res!374820) (not e!335418))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36691 0))(
  ( (array!36692 (arr!17620 (Array (_ BitVec 32) (_ BitVec 64))) (size!17984 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36691)

(assert (=> b!586999 (= res!374820 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17620 a!2986) index!984) (select (arr!17620 a!2986) j!136))) (not (= (select (arr!17620 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587000 () Bool)

(declare-fun res!374823 () Bool)

(assert (=> b!587000 (=> (not res!374823) (not e!335418))))

(declare-datatypes ((List!11661 0))(
  ( (Nil!11658) (Cons!11657 (h!12702 (_ BitVec 64)) (t!17889 List!11661)) )
))
(declare-fun arrayNoDuplicates!0 (array!36691 (_ BitVec 32) List!11661) Bool)

(assert (=> b!587000 (= res!374823 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11658))))

(declare-fun b!587001 () Bool)

(declare-fun res!374821 () Bool)

(declare-fun e!335417 () Bool)

(assert (=> b!587001 (=> (not res!374821) (not e!335417))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587001 (= res!374821 (validKeyInArray!0 k0!1786))))

(declare-fun b!587002 () Bool)

(declare-fun res!374815 () Bool)

(assert (=> b!587002 (=> (not res!374815) (not e!335417))))

(declare-fun arrayContainsKey!0 (array!36691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587002 (= res!374815 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587003 () Bool)

(declare-fun res!374818 () Bool)

(assert (=> b!587003 (=> (not res!374818) (not e!335418))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!587003 (= res!374818 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17620 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17620 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587004 () Bool)

(declare-fun res!374825 () Bool)

(assert (=> b!587004 (=> (not res!374825) (not e!335418))))

(declare-datatypes ((SeekEntryResult!6060 0))(
  ( (MissingZero!6060 (index!26467 (_ BitVec 32))) (Found!6060 (index!26468 (_ BitVec 32))) (Intermediate!6060 (undefined!6872 Bool) (index!26469 (_ BitVec 32)) (x!55273 (_ BitVec 32))) (Undefined!6060) (MissingVacant!6060 (index!26470 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36691 (_ BitVec 32)) SeekEntryResult!6060)

(assert (=> b!587004 (= res!374825 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17620 a!2986) j!136) a!2986 mask!3053) (Found!6060 j!136)))))

(declare-fun b!587005 () Bool)

(assert (=> b!587005 (= e!335418 (not true))))

(declare-fun lt!266247 () (_ BitVec 32))

(assert (=> b!587005 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266247 vacantSpotIndex!68 (select (arr!17620 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266247 vacantSpotIndex!68 (select (store (arr!17620 a!2986) i!1108 k0!1786) j!136) (array!36692 (store (arr!17620 a!2986) i!1108 k0!1786) (size!17984 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18240 0))(
  ( (Unit!18241) )
))
(declare-fun lt!266248 () Unit!18240)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18240)

(assert (=> b!587005 (= lt!266248 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266247 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587005 (= lt!266247 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587006 () Bool)

(declare-fun res!374817 () Bool)

(assert (=> b!587006 (=> (not res!374817) (not e!335417))))

(assert (=> b!587006 (= res!374817 (and (= (size!17984 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17984 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17984 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587007 () Bool)

(assert (=> b!587007 (= e!335417 e!335418)))

(declare-fun res!374824 () Bool)

(assert (=> b!587007 (=> (not res!374824) (not e!335418))))

(declare-fun lt!266246 () SeekEntryResult!6060)

(assert (=> b!587007 (= res!374824 (or (= lt!266246 (MissingZero!6060 i!1108)) (= lt!266246 (MissingVacant!6060 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36691 (_ BitVec 32)) SeekEntryResult!6060)

(assert (=> b!587007 (= lt!266246 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!374822 () Bool)

(assert (=> start!53790 (=> (not res!374822) (not e!335417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53790 (= res!374822 (validMask!0 mask!3053))))

(assert (=> start!53790 e!335417))

(assert (=> start!53790 true))

(declare-fun array_inv!13416 (array!36691) Bool)

(assert (=> start!53790 (array_inv!13416 a!2986)))

(declare-fun b!587008 () Bool)

(declare-fun res!374819 () Bool)

(assert (=> b!587008 (=> (not res!374819) (not e!335417))))

(assert (=> b!587008 (= res!374819 (validKeyInArray!0 (select (arr!17620 a!2986) j!136)))))

(declare-fun b!587009 () Bool)

(declare-fun res!374816 () Bool)

(assert (=> b!587009 (=> (not res!374816) (not e!335418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36691 (_ BitVec 32)) Bool)

(assert (=> b!587009 (= res!374816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53790 res!374822) b!587006))

(assert (= (and b!587006 res!374817) b!587008))

(assert (= (and b!587008 res!374819) b!587001))

(assert (= (and b!587001 res!374821) b!587002))

(assert (= (and b!587002 res!374815) b!587007))

(assert (= (and b!587007 res!374824) b!587009))

(assert (= (and b!587009 res!374816) b!587000))

(assert (= (and b!587000 res!374823) b!587003))

(assert (= (and b!587003 res!374818) b!587004))

(assert (= (and b!587004 res!374825) b!586999))

(assert (= (and b!586999 res!374820) b!587005))

(declare-fun m!565443 () Bool)

(assert (=> b!586999 m!565443))

(declare-fun m!565445 () Bool)

(assert (=> b!586999 m!565445))

(assert (=> b!587004 m!565445))

(assert (=> b!587004 m!565445))

(declare-fun m!565447 () Bool)

(assert (=> b!587004 m!565447))

(declare-fun m!565449 () Bool)

(assert (=> b!587007 m!565449))

(declare-fun m!565451 () Bool)

(assert (=> b!587003 m!565451))

(declare-fun m!565453 () Bool)

(assert (=> b!587003 m!565453))

(declare-fun m!565455 () Bool)

(assert (=> b!587003 m!565455))

(declare-fun m!565457 () Bool)

(assert (=> b!587005 m!565457))

(declare-fun m!565459 () Bool)

(assert (=> b!587005 m!565459))

(assert (=> b!587005 m!565445))

(assert (=> b!587005 m!565453))

(assert (=> b!587005 m!565459))

(declare-fun m!565461 () Bool)

(assert (=> b!587005 m!565461))

(assert (=> b!587005 m!565445))

(declare-fun m!565463 () Bool)

(assert (=> b!587005 m!565463))

(declare-fun m!565465 () Bool)

(assert (=> b!587005 m!565465))

(declare-fun m!565467 () Bool)

(assert (=> b!587000 m!565467))

(declare-fun m!565469 () Bool)

(assert (=> b!587002 m!565469))

(declare-fun m!565471 () Bool)

(assert (=> b!587009 m!565471))

(declare-fun m!565473 () Bool)

(assert (=> start!53790 m!565473))

(declare-fun m!565475 () Bool)

(assert (=> start!53790 m!565475))

(declare-fun m!565477 () Bool)

(assert (=> b!587001 m!565477))

(assert (=> b!587008 m!565445))

(assert (=> b!587008 m!565445))

(declare-fun m!565479 () Bool)

(assert (=> b!587008 m!565479))

(check-sat (not b!587000) (not b!587004) (not b!587009) (not b!587008) (not b!587005) (not start!53790) (not b!587001) (not b!587007) (not b!587002))
