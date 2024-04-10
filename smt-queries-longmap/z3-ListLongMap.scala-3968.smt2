; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53880 () Bool)

(assert start!53880)

(declare-fun b!587746 () Bool)

(declare-fun e!335715 () Bool)

(assert (=> b!587746 (= e!335715 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!266485 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36724 0))(
  ( (array!36725 (arr!17635 (Array (_ BitVec 32) (_ BitVec 64))) (size!17999 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36724)

(declare-datatypes ((SeekEntryResult!6075 0))(
  ( (MissingZero!6075 (index!26530 (_ BitVec 32))) (Found!6075 (index!26531 (_ BitVec 32))) (Intermediate!6075 (undefined!6887 Bool) (index!26532 (_ BitVec 32)) (x!55337 (_ BitVec 32))) (Undefined!6075) (MissingVacant!6075 (index!26533 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36724 (_ BitVec 32)) SeekEntryResult!6075)

(assert (=> b!587746 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266485 vacantSpotIndex!68 (select (arr!17635 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266485 vacantSpotIndex!68 (select (store (arr!17635 a!2986) i!1108 k0!1786) j!136) (array!36725 (store (arr!17635 a!2986) i!1108 k0!1786) (size!17999 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18270 0))(
  ( (Unit!18271) )
))
(declare-fun lt!266484 () Unit!18270)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36724 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18270)

(assert (=> b!587746 (= lt!266484 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266485 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587746 (= lt!266485 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587747 () Bool)

(declare-fun res!375387 () Bool)

(assert (=> b!587747 (=> (not res!375387) (not e!335715))))

(assert (=> b!587747 (= res!375387 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17635 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17635 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587748 () Bool)

(declare-fun res!375392 () Bool)

(assert (=> b!587748 (=> (not res!375392) (not e!335715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36724 (_ BitVec 32)) Bool)

(assert (=> b!587748 (= res!375392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587749 () Bool)

(declare-fun res!375384 () Bool)

(assert (=> b!587749 (=> (not res!375384) (not e!335715))))

(assert (=> b!587749 (= res!375384 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17635 a!2986) index!984) (select (arr!17635 a!2986) j!136))) (not (= (select (arr!17635 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587750 () Bool)

(declare-fun res!375390 () Bool)

(declare-fun e!335714 () Bool)

(assert (=> b!587750 (=> (not res!375390) (not e!335714))))

(declare-fun arrayContainsKey!0 (array!36724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587750 (= res!375390 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587751 () Bool)

(declare-fun res!375389 () Bool)

(assert (=> b!587751 (=> (not res!375389) (not e!335715))))

(declare-datatypes ((List!11676 0))(
  ( (Nil!11673) (Cons!11672 (h!12717 (_ BitVec 64)) (t!17904 List!11676)) )
))
(declare-fun arrayNoDuplicates!0 (array!36724 (_ BitVec 32) List!11676) Bool)

(assert (=> b!587751 (= res!375389 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11673))))

(declare-fun b!587752 () Bool)

(declare-fun res!375386 () Bool)

(assert (=> b!587752 (=> (not res!375386) (not e!335714))))

(assert (=> b!587752 (= res!375386 (and (= (size!17999 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17999 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17999 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587753 () Bool)

(assert (=> b!587753 (= e!335714 e!335715)))

(declare-fun res!375388 () Bool)

(assert (=> b!587753 (=> (not res!375388) (not e!335715))))

(declare-fun lt!266483 () SeekEntryResult!6075)

(assert (=> b!587753 (= res!375388 (or (= lt!266483 (MissingZero!6075 i!1108)) (= lt!266483 (MissingVacant!6075 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36724 (_ BitVec 32)) SeekEntryResult!6075)

(assert (=> b!587753 (= lt!266483 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!375382 () Bool)

(assert (=> start!53880 (=> (not res!375382) (not e!335714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53880 (= res!375382 (validMask!0 mask!3053))))

(assert (=> start!53880 e!335714))

(assert (=> start!53880 true))

(declare-fun array_inv!13431 (array!36724) Bool)

(assert (=> start!53880 (array_inv!13431 a!2986)))

(declare-fun b!587754 () Bool)

(declare-fun res!375391 () Bool)

(assert (=> b!587754 (=> (not res!375391) (not e!335714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587754 (= res!375391 (validKeyInArray!0 k0!1786))))

(declare-fun b!587755 () Bool)

(declare-fun res!375385 () Bool)

(assert (=> b!587755 (=> (not res!375385) (not e!335714))))

(assert (=> b!587755 (= res!375385 (validKeyInArray!0 (select (arr!17635 a!2986) j!136)))))

(declare-fun b!587756 () Bool)

(declare-fun res!375383 () Bool)

(assert (=> b!587756 (=> (not res!375383) (not e!335715))))

(assert (=> b!587756 (= res!375383 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17635 a!2986) j!136) a!2986 mask!3053) (Found!6075 j!136)))))

(assert (= (and start!53880 res!375382) b!587752))

(assert (= (and b!587752 res!375386) b!587755))

(assert (= (and b!587755 res!375385) b!587754))

(assert (= (and b!587754 res!375391) b!587750))

(assert (= (and b!587750 res!375390) b!587753))

(assert (= (and b!587753 res!375388) b!587748))

(assert (= (and b!587748 res!375392) b!587751))

(assert (= (and b!587751 res!375389) b!587747))

(assert (= (and b!587747 res!375387) b!587756))

(assert (= (and b!587756 res!375383) b!587749))

(assert (= (and b!587749 res!375384) b!587746))

(declare-fun m!566193 () Bool)

(assert (=> b!587755 m!566193))

(assert (=> b!587755 m!566193))

(declare-fun m!566195 () Bool)

(assert (=> b!587755 m!566195))

(declare-fun m!566197 () Bool)

(assert (=> start!53880 m!566197))

(declare-fun m!566199 () Bool)

(assert (=> start!53880 m!566199))

(assert (=> b!587756 m!566193))

(assert (=> b!587756 m!566193))

(declare-fun m!566201 () Bool)

(assert (=> b!587756 m!566201))

(declare-fun m!566203 () Bool)

(assert (=> b!587747 m!566203))

(declare-fun m!566205 () Bool)

(assert (=> b!587747 m!566205))

(declare-fun m!566207 () Bool)

(assert (=> b!587747 m!566207))

(declare-fun m!566209 () Bool)

(assert (=> b!587749 m!566209))

(assert (=> b!587749 m!566193))

(declare-fun m!566211 () Bool)

(assert (=> b!587748 m!566211))

(declare-fun m!566213 () Bool)

(assert (=> b!587746 m!566213))

(declare-fun m!566215 () Bool)

(assert (=> b!587746 m!566215))

(assert (=> b!587746 m!566193))

(assert (=> b!587746 m!566205))

(assert (=> b!587746 m!566193))

(declare-fun m!566217 () Bool)

(assert (=> b!587746 m!566217))

(declare-fun m!566219 () Bool)

(assert (=> b!587746 m!566219))

(assert (=> b!587746 m!566219))

(declare-fun m!566221 () Bool)

(assert (=> b!587746 m!566221))

(declare-fun m!566223 () Bool)

(assert (=> b!587753 m!566223))

(declare-fun m!566225 () Bool)

(assert (=> b!587750 m!566225))

(declare-fun m!566227 () Bool)

(assert (=> b!587754 m!566227))

(declare-fun m!566229 () Bool)

(assert (=> b!587751 m!566229))

(check-sat (not start!53880) (not b!587754) (not b!587753) (not b!587751) (not b!587756) (not b!587746) (not b!587748) (not b!587750) (not b!587755))
(check-sat)
