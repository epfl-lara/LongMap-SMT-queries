; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53820 () Bool)

(assert start!53820)

(declare-fun b!586878 () Bool)

(declare-fun res!374592 () Bool)

(declare-fun e!335455 () Bool)

(assert (=> b!586878 (=> (not res!374592) (not e!335455))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36666 0))(
  ( (array!36667 (arr!17605 (Array (_ BitVec 32) (_ BitVec 64))) (size!17969 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36666)

(assert (=> b!586878 (= res!374592 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17605 a!2986) index!984) (select (arr!17605 a!2986) j!136))) (not (= (select (arr!17605 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586879 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!586879 (= e!335455 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000))))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!266260 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6001 0))(
  ( (MissingZero!6001 (index!26231 (_ BitVec 32))) (Found!6001 (index!26232 (_ BitVec 32))) (Intermediate!6001 (undefined!6813 Bool) (index!26233 (_ BitVec 32)) (x!55193 (_ BitVec 32))) (Undefined!6001) (MissingVacant!6001 (index!26234 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36666 (_ BitVec 32)) SeekEntryResult!6001)

(assert (=> b!586879 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266260 vacantSpotIndex!68 (select (arr!17605 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266260 vacantSpotIndex!68 (select (store (arr!17605 a!2986) i!1108 k0!1786) j!136) (array!36667 (store (arr!17605 a!2986) i!1108 k0!1786) (size!17969 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18199 0))(
  ( (Unit!18200) )
))
(declare-fun lt!266259 () Unit!18199)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36666 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18199)

(assert (=> b!586879 (= lt!266259 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266260 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586879 (= lt!266260 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!586880 () Bool)

(declare-fun res!374590 () Bool)

(assert (=> b!586880 (=> (not res!374590) (not e!335455))))

(assert (=> b!586880 (= res!374590 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17605 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17605 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586881 () Bool)

(declare-fun res!374598 () Bool)

(declare-fun e!335457 () Bool)

(assert (=> b!586881 (=> (not res!374598) (not e!335457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586881 (= res!374598 (validKeyInArray!0 (select (arr!17605 a!2986) j!136)))))

(declare-fun b!586882 () Bool)

(declare-fun res!374597 () Bool)

(assert (=> b!586882 (=> (not res!374597) (not e!335455))))

(assert (=> b!586882 (= res!374597 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17605 a!2986) j!136) a!2986 mask!3053) (Found!6001 j!136)))))

(declare-fun res!374594 () Bool)

(assert (=> start!53820 (=> (not res!374594) (not e!335457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53820 (= res!374594 (validMask!0 mask!3053))))

(assert (=> start!53820 e!335457))

(assert (=> start!53820 true))

(declare-fun array_inv!13464 (array!36666) Bool)

(assert (=> start!53820 (array_inv!13464 a!2986)))

(declare-fun b!586883 () Bool)

(declare-fun res!374591 () Bool)

(assert (=> b!586883 (=> (not res!374591) (not e!335455))))

(declare-datatypes ((List!11553 0))(
  ( (Nil!11550) (Cons!11549 (h!12597 (_ BitVec 64)) (t!17773 List!11553)) )
))
(declare-fun arrayNoDuplicates!0 (array!36666 (_ BitVec 32) List!11553) Bool)

(assert (=> b!586883 (= res!374591 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11550))))

(declare-fun b!586884 () Bool)

(declare-fun res!374595 () Bool)

(assert (=> b!586884 (=> (not res!374595) (not e!335455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36666 (_ BitVec 32)) Bool)

(assert (=> b!586884 (= res!374595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586885 () Bool)

(declare-fun res!374596 () Bool)

(assert (=> b!586885 (=> (not res!374596) (not e!335457))))

(assert (=> b!586885 (= res!374596 (and (= (size!17969 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17969 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17969 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586886 () Bool)

(assert (=> b!586886 (= e!335457 e!335455)))

(declare-fun res!374599 () Bool)

(assert (=> b!586886 (=> (not res!374599) (not e!335455))))

(declare-fun lt!266258 () SeekEntryResult!6001)

(assert (=> b!586886 (= res!374599 (or (= lt!266258 (MissingZero!6001 i!1108)) (= lt!266258 (MissingVacant!6001 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36666 (_ BitVec 32)) SeekEntryResult!6001)

(assert (=> b!586886 (= lt!266258 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586887 () Bool)

(declare-fun res!374593 () Bool)

(assert (=> b!586887 (=> (not res!374593) (not e!335457))))

(assert (=> b!586887 (= res!374593 (validKeyInArray!0 k0!1786))))

(declare-fun b!586888 () Bool)

(declare-fun res!374589 () Bool)

(assert (=> b!586888 (=> (not res!374589) (not e!335457))))

(declare-fun arrayContainsKey!0 (array!36666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586888 (= res!374589 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53820 res!374594) b!586885))

(assert (= (and b!586885 res!374596) b!586881))

(assert (= (and b!586881 res!374598) b!586887))

(assert (= (and b!586887 res!374593) b!586888))

(assert (= (and b!586888 res!374589) b!586886))

(assert (= (and b!586886 res!374599) b!586884))

(assert (= (and b!586884 res!374595) b!586883))

(assert (= (and b!586883 res!374591) b!586880))

(assert (= (and b!586880 res!374590) b!586882))

(assert (= (and b!586882 res!374597) b!586878))

(assert (= (and b!586878 res!374592) b!586879))

(declare-fun m!565421 () Bool)

(assert (=> b!586881 m!565421))

(assert (=> b!586881 m!565421))

(declare-fun m!565423 () Bool)

(assert (=> b!586881 m!565423))

(declare-fun m!565425 () Bool)

(assert (=> b!586879 m!565425))

(declare-fun m!565427 () Bool)

(assert (=> b!586879 m!565427))

(assert (=> b!586879 m!565421))

(declare-fun m!565429 () Bool)

(assert (=> b!586879 m!565429))

(assert (=> b!586879 m!565427))

(declare-fun m!565431 () Bool)

(assert (=> b!586879 m!565431))

(declare-fun m!565433 () Bool)

(assert (=> b!586879 m!565433))

(assert (=> b!586879 m!565421))

(declare-fun m!565435 () Bool)

(assert (=> b!586879 m!565435))

(declare-fun m!565437 () Bool)

(assert (=> b!586887 m!565437))

(declare-fun m!565439 () Bool)

(assert (=> start!53820 m!565439))

(declare-fun m!565441 () Bool)

(assert (=> start!53820 m!565441))

(declare-fun m!565443 () Bool)

(assert (=> b!586880 m!565443))

(assert (=> b!586880 m!565429))

(declare-fun m!565445 () Bool)

(assert (=> b!586880 m!565445))

(declare-fun m!565447 () Bool)

(assert (=> b!586878 m!565447))

(assert (=> b!586878 m!565421))

(declare-fun m!565449 () Bool)

(assert (=> b!586883 m!565449))

(assert (=> b!586882 m!565421))

(assert (=> b!586882 m!565421))

(declare-fun m!565451 () Bool)

(assert (=> b!586882 m!565451))

(declare-fun m!565453 () Bool)

(assert (=> b!586886 m!565453))

(declare-fun m!565455 () Bool)

(assert (=> b!586884 m!565455))

(declare-fun m!565457 () Bool)

(assert (=> b!586888 m!565457))

(check-sat (not start!53820) (not b!586881) (not b!586884) (not b!586879) (not b!586886) (not b!586882) (not b!586883) (not b!586887) (not b!586888))
(check-sat)
