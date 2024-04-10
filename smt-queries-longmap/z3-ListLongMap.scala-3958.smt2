; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53760 () Bool)

(assert start!53760)

(declare-fun b!586504 () Bool)

(declare-fun res!374322 () Bool)

(declare-fun e!335281 () Bool)

(assert (=> b!586504 (=> (not res!374322) (not e!335281))))

(declare-datatypes ((array!36661 0))(
  ( (array!36662 (arr!17605 (Array (_ BitVec 32) (_ BitVec 64))) (size!17969 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36661)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36661 (_ BitVec 32)) Bool)

(assert (=> b!586504 (= res!374322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586505 () Bool)

(declare-fun res!374320 () Bool)

(declare-fun e!335282 () Bool)

(assert (=> b!586505 (=> (not res!374320) (not e!335282))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586505 (= res!374320 (and (= (size!17969 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17969 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17969 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586506 () Bool)

(declare-fun res!374325 () Bool)

(assert (=> b!586506 (=> (not res!374325) (not e!335281))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6045 0))(
  ( (MissingZero!6045 (index!26407 (_ BitVec 32))) (Found!6045 (index!26408 (_ BitVec 32))) (Intermediate!6045 (undefined!6857 Bool) (index!26409 (_ BitVec 32)) (x!55218 (_ BitVec 32))) (Undefined!6045) (MissingVacant!6045 (index!26410 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36661 (_ BitVec 32)) SeekEntryResult!6045)

(assert (=> b!586506 (= res!374325 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17605 a!2986) j!136) a!2986 mask!3053) (Found!6045 j!136)))))

(declare-fun b!586507 () Bool)

(assert (=> b!586507 (= e!335281 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!266113 () (_ BitVec 32))

(assert (=> b!586507 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266113 vacantSpotIndex!68 (select (arr!17605 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266113 vacantSpotIndex!68 (select (store (arr!17605 a!2986) i!1108 k0!1786) j!136) (array!36662 (store (arr!17605 a!2986) i!1108 k0!1786) (size!17969 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18210 0))(
  ( (Unit!18211) )
))
(declare-fun lt!266112 () Unit!18210)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36661 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18210)

(assert (=> b!586507 (= lt!266112 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266113 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586507 (= lt!266113 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586508 () Bool)

(declare-fun res!374324 () Bool)

(assert (=> b!586508 (=> (not res!374324) (not e!335281))))

(assert (=> b!586508 (= res!374324 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17605 a!2986) index!984) (select (arr!17605 a!2986) j!136))) (not (= (select (arr!17605 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!374323 () Bool)

(assert (=> start!53760 (=> (not res!374323) (not e!335282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53760 (= res!374323 (validMask!0 mask!3053))))

(assert (=> start!53760 e!335282))

(assert (=> start!53760 true))

(declare-fun array_inv!13401 (array!36661) Bool)

(assert (=> start!53760 (array_inv!13401 a!2986)))

(declare-fun b!586509 () Bool)

(declare-fun res!374321 () Bool)

(assert (=> b!586509 (=> (not res!374321) (not e!335281))))

(declare-datatypes ((List!11646 0))(
  ( (Nil!11643) (Cons!11642 (h!12687 (_ BitVec 64)) (t!17874 List!11646)) )
))
(declare-fun arrayNoDuplicates!0 (array!36661 (_ BitVec 32) List!11646) Bool)

(assert (=> b!586509 (= res!374321 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11643))))

(declare-fun b!586510 () Bool)

(assert (=> b!586510 (= e!335282 e!335281)))

(declare-fun res!374327 () Bool)

(assert (=> b!586510 (=> (not res!374327) (not e!335281))))

(declare-fun lt!266111 () SeekEntryResult!6045)

(assert (=> b!586510 (= res!374327 (or (= lt!266111 (MissingZero!6045 i!1108)) (= lt!266111 (MissingVacant!6045 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36661 (_ BitVec 32)) SeekEntryResult!6045)

(assert (=> b!586510 (= lt!266111 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586511 () Bool)

(declare-fun res!374328 () Bool)

(assert (=> b!586511 (=> (not res!374328) (not e!335282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586511 (= res!374328 (validKeyInArray!0 (select (arr!17605 a!2986) j!136)))))

(declare-fun b!586512 () Bool)

(declare-fun res!374326 () Bool)

(assert (=> b!586512 (=> (not res!374326) (not e!335282))))

(assert (=> b!586512 (= res!374326 (validKeyInArray!0 k0!1786))))

(declare-fun b!586513 () Bool)

(declare-fun res!374330 () Bool)

(assert (=> b!586513 (=> (not res!374330) (not e!335281))))

(assert (=> b!586513 (= res!374330 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17605 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17605 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586514 () Bool)

(declare-fun res!374329 () Bool)

(assert (=> b!586514 (=> (not res!374329) (not e!335282))))

(declare-fun arrayContainsKey!0 (array!36661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586514 (= res!374329 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53760 res!374323) b!586505))

(assert (= (and b!586505 res!374320) b!586511))

(assert (= (and b!586511 res!374328) b!586512))

(assert (= (and b!586512 res!374326) b!586514))

(assert (= (and b!586514 res!374329) b!586510))

(assert (= (and b!586510 res!374327) b!586504))

(assert (= (and b!586504 res!374322) b!586509))

(assert (= (and b!586509 res!374321) b!586513))

(assert (= (and b!586513 res!374330) b!586506))

(assert (= (and b!586506 res!374325) b!586508))

(assert (= (and b!586508 res!374324) b!586507))

(declare-fun m!564873 () Bool)

(assert (=> b!586512 m!564873))

(declare-fun m!564875 () Bool)

(assert (=> b!586508 m!564875))

(declare-fun m!564877 () Bool)

(assert (=> b!586508 m!564877))

(declare-fun m!564879 () Bool)

(assert (=> b!586507 m!564879))

(declare-fun m!564881 () Bool)

(assert (=> b!586507 m!564881))

(assert (=> b!586507 m!564877))

(declare-fun m!564883 () Bool)

(assert (=> b!586507 m!564883))

(declare-fun m!564885 () Bool)

(assert (=> b!586507 m!564885))

(assert (=> b!586507 m!564877))

(declare-fun m!564887 () Bool)

(assert (=> b!586507 m!564887))

(assert (=> b!586507 m!564881))

(declare-fun m!564889 () Bool)

(assert (=> b!586507 m!564889))

(declare-fun m!564891 () Bool)

(assert (=> b!586504 m!564891))

(declare-fun m!564893 () Bool)

(assert (=> b!586510 m!564893))

(declare-fun m!564895 () Bool)

(assert (=> b!586514 m!564895))

(declare-fun m!564897 () Bool)

(assert (=> b!586513 m!564897))

(assert (=> b!586513 m!564883))

(declare-fun m!564899 () Bool)

(assert (=> b!586513 m!564899))

(assert (=> b!586511 m!564877))

(assert (=> b!586511 m!564877))

(declare-fun m!564901 () Bool)

(assert (=> b!586511 m!564901))

(declare-fun m!564903 () Bool)

(assert (=> b!586509 m!564903))

(assert (=> b!586506 m!564877))

(assert (=> b!586506 m!564877))

(declare-fun m!564905 () Bool)

(assert (=> b!586506 m!564905))

(declare-fun m!564907 () Bool)

(assert (=> start!53760 m!564907))

(declare-fun m!564909 () Bool)

(assert (=> start!53760 m!564909))

(check-sat (not b!586511) (not b!586506) (not b!586510) (not b!586504) (not b!586509) (not b!586512) (not start!53760) (not b!586514) (not b!586507))
(check-sat)
