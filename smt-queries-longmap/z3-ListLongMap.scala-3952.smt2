; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53706 () Bool)

(assert start!53706)

(declare-fun b!585606 () Bool)

(declare-fun res!373569 () Bool)

(declare-fun e!334936 () Bool)

(assert (=> b!585606 (=> (not res!373569) (not e!334936))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585606 (= res!373569 (validKeyInArray!0 k0!1786))))

(declare-fun b!585607 () Bool)

(declare-fun e!334938 () Bool)

(assert (=> b!585607 (= e!334936 e!334938)))

(declare-fun res!373565 () Bool)

(assert (=> b!585607 (=> (not res!373565) (not e!334938))))

(declare-datatypes ((SeekEntryResult!6022 0))(
  ( (MissingZero!6022 (index!26315 (_ BitVec 32))) (Found!6022 (index!26316 (_ BitVec 32))) (Intermediate!6022 (undefined!6834 Bool) (index!26317 (_ BitVec 32)) (x!55142 (_ BitVec 32))) (Undefined!6022) (MissingVacant!6022 (index!26318 (_ BitVec 32))) )
))
(declare-fun lt!265708 () SeekEntryResult!6022)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585607 (= res!373565 (or (= lt!265708 (MissingZero!6022 i!1108)) (= lt!265708 (MissingVacant!6022 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36621 0))(
  ( (array!36622 (arr!17585 (Array (_ BitVec 32) (_ BitVec 64))) (size!17950 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36621)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36621 (_ BitVec 32)) SeekEntryResult!6022)

(assert (=> b!585607 (= lt!265708 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585608 () Bool)

(declare-fun res!373570 () Bool)

(assert (=> b!585608 (=> (not res!373570) (not e!334938))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585608 (= res!373570 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17585 a!2986) index!984) (select (arr!17585 a!2986) j!136))) (not (= (select (arr!17585 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585609 () Bool)

(declare-fun res!373566 () Bool)

(assert (=> b!585609 (=> (not res!373566) (not e!334938))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36621 (_ BitVec 32)) SeekEntryResult!6022)

(assert (=> b!585609 (= res!373566 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17585 a!2986) j!136) a!2986 mask!3053) (Found!6022 j!136)))))

(declare-fun b!585611 () Bool)

(declare-fun res!373571 () Bool)

(assert (=> b!585611 (=> (not res!373571) (not e!334936))))

(assert (=> b!585611 (= res!373571 (and (= (size!17950 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17950 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17950 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585612 () Bool)

(declare-fun res!373564 () Bool)

(assert (=> b!585612 (=> (not res!373564) (not e!334938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36621 (_ BitVec 32)) Bool)

(assert (=> b!585612 (= res!373564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585613 () Bool)

(declare-fun res!373568 () Bool)

(assert (=> b!585613 (=> (not res!373568) (not e!334938))))

(declare-datatypes ((List!11665 0))(
  ( (Nil!11662) (Cons!11661 (h!12706 (_ BitVec 64)) (t!17884 List!11665)) )
))
(declare-fun arrayNoDuplicates!0 (array!36621 (_ BitVec 32) List!11665) Bool)

(assert (=> b!585613 (= res!373568 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11662))))

(declare-fun b!585614 () Bool)

(declare-fun res!373573 () Bool)

(assert (=> b!585614 (=> (not res!373573) (not e!334936))))

(assert (=> b!585614 (= res!373573 (validKeyInArray!0 (select (arr!17585 a!2986) j!136)))))

(declare-fun b!585615 () Bool)

(declare-fun res!373574 () Bool)

(assert (=> b!585615 (=> (not res!373574) (not e!334938))))

(assert (=> b!585615 (= res!373574 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17585 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17585 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585616 () Bool)

(declare-fun res!373572 () Bool)

(assert (=> b!585616 (=> (not res!373572) (not e!334936))))

(declare-fun arrayContainsKey!0 (array!36621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585616 (= res!373572 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585610 () Bool)

(assert (=> b!585610 (= e!334938 (not true))))

(declare-fun lt!265707 () (_ BitVec 32))

(assert (=> b!585610 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265707 vacantSpotIndex!68 (select (arr!17585 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265707 vacantSpotIndex!68 (select (store (arr!17585 a!2986) i!1108 k0!1786) j!136) (array!36622 (store (arr!17585 a!2986) i!1108 k0!1786) (size!17950 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18150 0))(
  ( (Unit!18151) )
))
(declare-fun lt!265706 () Unit!18150)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36621 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18150)

(assert (=> b!585610 (= lt!265706 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265707 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585610 (= lt!265707 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!373567 () Bool)

(assert (=> start!53706 (=> (not res!373567) (not e!334936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53706 (= res!373567 (validMask!0 mask!3053))))

(assert (=> start!53706 e!334936))

(assert (=> start!53706 true))

(declare-fun array_inv!13468 (array!36621) Bool)

(assert (=> start!53706 (array_inv!13468 a!2986)))

(assert (= (and start!53706 res!373567) b!585611))

(assert (= (and b!585611 res!373571) b!585614))

(assert (= (and b!585614 res!373573) b!585606))

(assert (= (and b!585606 res!373569) b!585616))

(assert (= (and b!585616 res!373572) b!585607))

(assert (= (and b!585607 res!373565) b!585612))

(assert (= (and b!585612 res!373564) b!585613))

(assert (= (and b!585613 res!373568) b!585615))

(assert (= (and b!585615 res!373574) b!585609))

(assert (= (and b!585609 res!373566) b!585608))

(assert (= (and b!585608 res!373570) b!585610))

(declare-fun m!563365 () Bool)

(assert (=> b!585613 m!563365))

(declare-fun m!563367 () Bool)

(assert (=> b!585610 m!563367))

(declare-fun m!563369 () Bool)

(assert (=> b!585610 m!563369))

(assert (=> b!585610 m!563369))

(declare-fun m!563371 () Bool)

(assert (=> b!585610 m!563371))

(declare-fun m!563373 () Bool)

(assert (=> b!585610 m!563373))

(declare-fun m!563375 () Bool)

(assert (=> b!585610 m!563375))

(declare-fun m!563377 () Bool)

(assert (=> b!585610 m!563377))

(assert (=> b!585610 m!563373))

(declare-fun m!563379 () Bool)

(assert (=> b!585610 m!563379))

(declare-fun m!563381 () Bool)

(assert (=> b!585612 m!563381))

(declare-fun m!563383 () Bool)

(assert (=> b!585616 m!563383))

(declare-fun m!563385 () Bool)

(assert (=> b!585608 m!563385))

(assert (=> b!585608 m!563373))

(assert (=> b!585614 m!563373))

(assert (=> b!585614 m!563373))

(declare-fun m!563387 () Bool)

(assert (=> b!585614 m!563387))

(assert (=> b!585609 m!563373))

(assert (=> b!585609 m!563373))

(declare-fun m!563389 () Bool)

(assert (=> b!585609 m!563389))

(declare-fun m!563391 () Bool)

(assert (=> b!585607 m!563391))

(declare-fun m!563393 () Bool)

(assert (=> b!585615 m!563393))

(assert (=> b!585615 m!563375))

(declare-fun m!563395 () Bool)

(assert (=> b!585615 m!563395))

(declare-fun m!563397 () Bool)

(assert (=> b!585606 m!563397))

(declare-fun m!563399 () Bool)

(assert (=> start!53706 m!563399))

(declare-fun m!563401 () Bool)

(assert (=> start!53706 m!563401))

(check-sat (not b!585614) (not b!585610) (not b!585607) (not b!585613) (not b!585606) (not b!585612) (not b!585616) (not b!585609) (not start!53706))
(check-sat)
