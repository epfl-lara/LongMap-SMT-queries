; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53760 () Bool)

(assert start!53760)

(declare-fun b!586497 () Bool)

(declare-fun res!374459 () Bool)

(declare-fun e!335180 () Bool)

(assert (=> b!586497 (=> (not res!374459) (not e!335180))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36675 0))(
  ( (array!36676 (arr!17612 (Array (_ BitVec 32) (_ BitVec 64))) (size!17977 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36675)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!586497 (= res!374459 (and (= (size!17977 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17977 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17977 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586499 () Bool)

(declare-fun e!335181 () Bool)

(assert (=> b!586499 (= e!335181 (not true))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!265950 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6049 0))(
  ( (MissingZero!6049 (index!26423 (_ BitVec 32))) (Found!6049 (index!26424 (_ BitVec 32))) (Intermediate!6049 (undefined!6861 Bool) (index!26425 (_ BitVec 32)) (x!55241 (_ BitVec 32))) (Undefined!6049) (MissingVacant!6049 (index!26426 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36675 (_ BitVec 32)) SeekEntryResult!6049)

(assert (=> b!586499 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265950 vacantSpotIndex!68 (select (arr!17612 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265950 vacantSpotIndex!68 (select (store (arr!17612 a!2986) i!1108 k0!1786) j!136) (array!36676 (store (arr!17612 a!2986) i!1108 k0!1786) (size!17977 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18204 0))(
  ( (Unit!18205) )
))
(declare-fun lt!265949 () Unit!18204)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18204)

(assert (=> b!586499 (= lt!265949 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265950 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586499 (= lt!265950 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586500 () Bool)

(declare-fun res!374456 () Bool)

(assert (=> b!586500 (=> (not res!374456) (not e!335180))))

(declare-fun arrayContainsKey!0 (array!36675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586500 (= res!374456 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586501 () Bool)

(declare-fun res!374465 () Bool)

(assert (=> b!586501 (=> (not res!374465) (not e!335181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36675 (_ BitVec 32)) Bool)

(assert (=> b!586501 (= res!374465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586502 () Bool)

(declare-fun res!374455 () Bool)

(assert (=> b!586502 (=> (not res!374455) (not e!335181))))

(assert (=> b!586502 (= res!374455 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17612 a!2986) index!984) (select (arr!17612 a!2986) j!136))) (not (= (select (arr!17612 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586503 () Bool)

(declare-fun res!374457 () Bool)

(assert (=> b!586503 (=> (not res!374457) (not e!335181))))

(declare-datatypes ((List!11692 0))(
  ( (Nil!11689) (Cons!11688 (h!12733 (_ BitVec 64)) (t!17911 List!11692)) )
))
(declare-fun arrayNoDuplicates!0 (array!36675 (_ BitVec 32) List!11692) Bool)

(assert (=> b!586503 (= res!374457 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11689))))

(declare-fun b!586498 () Bool)

(declare-fun res!374464 () Bool)

(assert (=> b!586498 (=> (not res!374464) (not e!335181))))

(assert (=> b!586498 (= res!374464 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17612 a!2986) j!136) a!2986 mask!3053) (Found!6049 j!136)))))

(declare-fun res!374463 () Bool)

(assert (=> start!53760 (=> (not res!374463) (not e!335180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53760 (= res!374463 (validMask!0 mask!3053))))

(assert (=> start!53760 e!335180))

(assert (=> start!53760 true))

(declare-fun array_inv!13495 (array!36675) Bool)

(assert (=> start!53760 (array_inv!13495 a!2986)))

(declare-fun b!586504 () Bool)

(declare-fun res!374462 () Bool)

(assert (=> b!586504 (=> (not res!374462) (not e!335180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586504 (= res!374462 (validKeyInArray!0 k0!1786))))

(declare-fun b!586505 () Bool)

(declare-fun res!374460 () Bool)

(assert (=> b!586505 (=> (not res!374460) (not e!335181))))

(assert (=> b!586505 (= res!374460 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17612 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17612 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586506 () Bool)

(declare-fun res!374458 () Bool)

(assert (=> b!586506 (=> (not res!374458) (not e!335180))))

(assert (=> b!586506 (= res!374458 (validKeyInArray!0 (select (arr!17612 a!2986) j!136)))))

(declare-fun b!586507 () Bool)

(assert (=> b!586507 (= e!335180 e!335181)))

(declare-fun res!374461 () Bool)

(assert (=> b!586507 (=> (not res!374461) (not e!335181))))

(declare-fun lt!265951 () SeekEntryResult!6049)

(assert (=> b!586507 (= res!374461 (or (= lt!265951 (MissingZero!6049 i!1108)) (= lt!265951 (MissingVacant!6049 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36675 (_ BitVec 32)) SeekEntryResult!6049)

(assert (=> b!586507 (= lt!265951 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53760 res!374463) b!586497))

(assert (= (and b!586497 res!374459) b!586506))

(assert (= (and b!586506 res!374458) b!586504))

(assert (= (and b!586504 res!374462) b!586500))

(assert (= (and b!586500 res!374456) b!586507))

(assert (= (and b!586507 res!374461) b!586501))

(assert (= (and b!586501 res!374465) b!586503))

(assert (= (and b!586503 res!374457) b!586505))

(assert (= (and b!586505 res!374460) b!586498))

(assert (= (and b!586498 res!374464) b!586502))

(assert (= (and b!586502 res!374455) b!586499))

(declare-fun m!564391 () Bool)

(assert (=> b!586502 m!564391))

(declare-fun m!564393 () Bool)

(assert (=> b!586502 m!564393))

(assert (=> b!586498 m!564393))

(assert (=> b!586498 m!564393))

(declare-fun m!564395 () Bool)

(assert (=> b!586498 m!564395))

(declare-fun m!564397 () Bool)

(assert (=> b!586503 m!564397))

(declare-fun m!564399 () Bool)

(assert (=> start!53760 m!564399))

(declare-fun m!564401 () Bool)

(assert (=> start!53760 m!564401))

(declare-fun m!564403 () Bool)

(assert (=> b!586500 m!564403))

(declare-fun m!564405 () Bool)

(assert (=> b!586505 m!564405))

(declare-fun m!564407 () Bool)

(assert (=> b!586505 m!564407))

(declare-fun m!564409 () Bool)

(assert (=> b!586505 m!564409))

(declare-fun m!564411 () Bool)

(assert (=> b!586501 m!564411))

(declare-fun m!564413 () Bool)

(assert (=> b!586504 m!564413))

(assert (=> b!586506 m!564393))

(assert (=> b!586506 m!564393))

(declare-fun m!564415 () Bool)

(assert (=> b!586506 m!564415))

(declare-fun m!564417 () Bool)

(assert (=> b!586507 m!564417))

(declare-fun m!564419 () Bool)

(assert (=> b!586499 m!564419))

(assert (=> b!586499 m!564393))

(assert (=> b!586499 m!564407))

(declare-fun m!564421 () Bool)

(assert (=> b!586499 m!564421))

(declare-fun m!564423 () Bool)

(assert (=> b!586499 m!564423))

(declare-fun m!564425 () Bool)

(assert (=> b!586499 m!564425))

(assert (=> b!586499 m!564423))

(assert (=> b!586499 m!564393))

(declare-fun m!564427 () Bool)

(assert (=> b!586499 m!564427))

(check-sat (not b!586507) (not b!586499) (not start!53760) (not b!586503) (not b!586501) (not b!586504) (not b!586498) (not b!586506) (not b!586500))
(check-sat)
