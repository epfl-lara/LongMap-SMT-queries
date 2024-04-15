; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53364 () Bool)

(assert start!53364)

(declare-fun b!580376 () Bool)

(declare-fun res!368336 () Bool)

(declare-fun e!333227 () Bool)

(assert (=> b!580376 (=> (not res!368336) (not e!333227))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36279 0))(
  ( (array!36280 (arr!17414 (Array (_ BitVec 32) (_ BitVec 64))) (size!17779 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36279)

(assert (=> b!580376 (= res!368336 (and (= (size!17779 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17779 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17779 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580377 () Bool)

(declare-fun res!368334 () Bool)

(assert (=> b!580377 (=> (not res!368334) (not e!333227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580377 (= res!368334 (validKeyInArray!0 (select (arr!17414 a!2986) j!136)))))

(declare-fun b!580378 () Bool)

(declare-fun res!368337 () Bool)

(declare-fun e!333226 () Bool)

(assert (=> b!580378 (=> (not res!368337) (not e!333226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36279 (_ BitVec 32)) Bool)

(assert (=> b!580378 (= res!368337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580379 () Bool)

(declare-fun res!368341 () Bool)

(assert (=> b!580379 (=> (not res!368341) (not e!333227))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580379 (= res!368341 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580380 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580380 (= e!333226 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17414 a!2986) index!984) (select (arr!17414 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!580381 () Bool)

(declare-fun res!368339 () Bool)

(assert (=> b!580381 (=> (not res!368339) (not e!333226))))

(declare-datatypes ((List!11494 0))(
  ( (Nil!11491) (Cons!11490 (h!12535 (_ BitVec 64)) (t!17713 List!11494)) )
))
(declare-fun arrayNoDuplicates!0 (array!36279 (_ BitVec 32) List!11494) Bool)

(assert (=> b!580381 (= res!368339 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11491))))

(declare-fun b!580382 () Bool)

(assert (=> b!580382 (= e!333227 e!333226)))

(declare-fun res!368338 () Bool)

(assert (=> b!580382 (=> (not res!368338) (not e!333226))))

(declare-datatypes ((SeekEntryResult!5851 0))(
  ( (MissingZero!5851 (index!25631 (_ BitVec 32))) (Found!5851 (index!25632 (_ BitVec 32))) (Intermediate!5851 (undefined!6663 Bool) (index!25633 (_ BitVec 32)) (x!54515 (_ BitVec 32))) (Undefined!5851) (MissingVacant!5851 (index!25634 (_ BitVec 32))) )
))
(declare-fun lt!264514 () SeekEntryResult!5851)

(assert (=> b!580382 (= res!368338 (or (= lt!264514 (MissingZero!5851 i!1108)) (= lt!264514 (MissingVacant!5851 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36279 (_ BitVec 32)) SeekEntryResult!5851)

(assert (=> b!580382 (= lt!264514 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580383 () Bool)

(declare-fun res!368342 () Bool)

(assert (=> b!580383 (=> (not res!368342) (not e!333227))))

(assert (=> b!580383 (= res!368342 (validKeyInArray!0 k0!1786))))

(declare-fun b!580384 () Bool)

(declare-fun res!368335 () Bool)

(assert (=> b!580384 (=> (not res!368335) (not e!333226))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!580384 (= res!368335 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17414 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17414 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368340 () Bool)

(assert (=> start!53364 (=> (not res!368340) (not e!333227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53364 (= res!368340 (validMask!0 mask!3053))))

(assert (=> start!53364 e!333227))

(assert (=> start!53364 true))

(declare-fun array_inv!13297 (array!36279) Bool)

(assert (=> start!53364 (array_inv!13297 a!2986)))

(declare-fun b!580375 () Bool)

(declare-fun res!368333 () Bool)

(assert (=> b!580375 (=> (not res!368333) (not e!333226))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36279 (_ BitVec 32)) SeekEntryResult!5851)

(assert (=> b!580375 (= res!368333 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17414 a!2986) j!136) a!2986 mask!3053) (Found!5851 j!136)))))

(assert (= (and start!53364 res!368340) b!580376))

(assert (= (and b!580376 res!368336) b!580377))

(assert (= (and b!580377 res!368334) b!580383))

(assert (= (and b!580383 res!368342) b!580379))

(assert (= (and b!580379 res!368341) b!580382))

(assert (= (and b!580382 res!368338) b!580378))

(assert (= (and b!580378 res!368337) b!580381))

(assert (= (and b!580381 res!368339) b!580384))

(assert (= (and b!580384 res!368335) b!580375))

(assert (= (and b!580375 res!368333) b!580380))

(declare-fun m!558433 () Bool)

(assert (=> b!580380 m!558433))

(declare-fun m!558435 () Bool)

(assert (=> b!580380 m!558435))

(declare-fun m!558437 () Bool)

(assert (=> start!53364 m!558437))

(declare-fun m!558439 () Bool)

(assert (=> start!53364 m!558439))

(assert (=> b!580377 m!558435))

(assert (=> b!580377 m!558435))

(declare-fun m!558441 () Bool)

(assert (=> b!580377 m!558441))

(declare-fun m!558443 () Bool)

(assert (=> b!580383 m!558443))

(declare-fun m!558445 () Bool)

(assert (=> b!580379 m!558445))

(declare-fun m!558447 () Bool)

(assert (=> b!580384 m!558447))

(declare-fun m!558449 () Bool)

(assert (=> b!580384 m!558449))

(declare-fun m!558451 () Bool)

(assert (=> b!580384 m!558451))

(declare-fun m!558453 () Bool)

(assert (=> b!580382 m!558453))

(assert (=> b!580375 m!558435))

(assert (=> b!580375 m!558435))

(declare-fun m!558455 () Bool)

(assert (=> b!580375 m!558455))

(declare-fun m!558457 () Bool)

(assert (=> b!580378 m!558457))

(declare-fun m!558459 () Bool)

(assert (=> b!580381 m!558459))

(check-sat (not b!580379) (not b!580378) (not b!580375) (not b!580383) (not start!53364) (not b!580377) (not b!580382) (not b!580381))
(check-sat)
