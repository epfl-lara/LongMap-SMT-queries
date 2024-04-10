; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53706 () Bool)

(assert start!53706)

(declare-fun b!585613 () Bool)

(declare-fun res!373437 () Bool)

(declare-fun e!335040 () Bool)

(assert (=> b!585613 (=> (not res!373437) (not e!335040))))

(declare-datatypes ((array!36607 0))(
  ( (array!36608 (arr!17578 (Array (_ BitVec 32) (_ BitVec 64))) (size!17942 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36607)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585613 (= res!373437 (validKeyInArray!0 (select (arr!17578 a!2986) j!136)))))

(declare-fun b!585614 () Bool)

(declare-fun res!373435 () Bool)

(declare-fun e!335039 () Bool)

(assert (=> b!585614 (=> (not res!373435) (not e!335039))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36607 (_ BitVec 32)) Bool)

(assert (=> b!585614 (= res!373435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585615 () Bool)

(declare-fun res!373438 () Bool)

(assert (=> b!585615 (=> (not res!373438) (not e!335040))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585615 (= res!373438 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585616 () Bool)

(declare-fun res!373429 () Bool)

(assert (=> b!585616 (=> (not res!373429) (not e!335039))))

(declare-datatypes ((List!11619 0))(
  ( (Nil!11616) (Cons!11615 (h!12660 (_ BitVec 64)) (t!17847 List!11619)) )
))
(declare-fun arrayNoDuplicates!0 (array!36607 (_ BitVec 32) List!11619) Bool)

(assert (=> b!585616 (= res!373429 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11616))))

(declare-fun b!585617 () Bool)

(declare-fun res!373430 () Bool)

(assert (=> b!585617 (=> (not res!373430) (not e!335039))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585617 (= res!373430 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17578 a!2986) index!984) (select (arr!17578 a!2986) j!136))) (not (= (select (arr!17578 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585618 () Bool)

(declare-fun res!373433 () Bool)

(assert (=> b!585618 (=> (not res!373433) (not e!335039))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6018 0))(
  ( (MissingZero!6018 (index!26299 (_ BitVec 32))) (Found!6018 (index!26300 (_ BitVec 32))) (Intermediate!6018 (undefined!6830 Bool) (index!26301 (_ BitVec 32)) (x!55119 (_ BitVec 32))) (Undefined!6018) (MissingVacant!6018 (index!26302 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36607 (_ BitVec 32)) SeekEntryResult!6018)

(assert (=> b!585618 (= res!373433 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17578 a!2986) j!136) a!2986 mask!3053) (Found!6018 j!136)))))

(declare-fun b!585619 () Bool)

(declare-fun res!373434 () Bool)

(assert (=> b!585619 (=> (not res!373434) (not e!335040))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585619 (= res!373434 (and (= (size!17942 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17942 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17942 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!373436 () Bool)

(assert (=> start!53706 (=> (not res!373436) (not e!335040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53706 (= res!373436 (validMask!0 mask!3053))))

(assert (=> start!53706 e!335040))

(assert (=> start!53706 true))

(declare-fun array_inv!13374 (array!36607) Bool)

(assert (=> start!53706 (array_inv!13374 a!2986)))

(declare-fun b!585620 () Bool)

(assert (=> b!585620 (= e!335039 (not true))))

(declare-fun lt!265870 () (_ BitVec 32))

(assert (=> b!585620 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265870 vacantSpotIndex!68 (select (arr!17578 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265870 vacantSpotIndex!68 (select (store (arr!17578 a!2986) i!1108 k0!1786) j!136) (array!36608 (store (arr!17578 a!2986) i!1108 k0!1786) (size!17942 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18156 0))(
  ( (Unit!18157) )
))
(declare-fun lt!265869 () Unit!18156)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36607 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18156)

(assert (=> b!585620 (= lt!265869 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265870 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585620 (= lt!265870 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585621 () Bool)

(assert (=> b!585621 (= e!335040 e!335039)))

(declare-fun res!373439 () Bool)

(assert (=> b!585621 (=> (not res!373439) (not e!335039))))

(declare-fun lt!265868 () SeekEntryResult!6018)

(assert (=> b!585621 (= res!373439 (or (= lt!265868 (MissingZero!6018 i!1108)) (= lt!265868 (MissingVacant!6018 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36607 (_ BitVec 32)) SeekEntryResult!6018)

(assert (=> b!585621 (= lt!265868 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585622 () Bool)

(declare-fun res!373431 () Bool)

(assert (=> b!585622 (=> (not res!373431) (not e!335040))))

(assert (=> b!585622 (= res!373431 (validKeyInArray!0 k0!1786))))

(declare-fun b!585623 () Bool)

(declare-fun res!373432 () Bool)

(assert (=> b!585623 (=> (not res!373432) (not e!335039))))

(assert (=> b!585623 (= res!373432 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17578 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17578 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53706 res!373436) b!585619))

(assert (= (and b!585619 res!373434) b!585613))

(assert (= (and b!585613 res!373437) b!585622))

(assert (= (and b!585622 res!373431) b!585615))

(assert (= (and b!585615 res!373438) b!585621))

(assert (= (and b!585621 res!373439) b!585614))

(assert (= (and b!585614 res!373435) b!585616))

(assert (= (and b!585616 res!373429) b!585623))

(assert (= (and b!585623 res!373432) b!585618))

(assert (= (and b!585618 res!373433) b!585617))

(assert (= (and b!585617 res!373430) b!585620))

(declare-fun m!563847 () Bool)

(assert (=> b!585622 m!563847))

(declare-fun m!563849 () Bool)

(assert (=> b!585618 m!563849))

(assert (=> b!585618 m!563849))

(declare-fun m!563851 () Bool)

(assert (=> b!585618 m!563851))

(declare-fun m!563853 () Bool)

(assert (=> start!53706 m!563853))

(declare-fun m!563855 () Bool)

(assert (=> start!53706 m!563855))

(declare-fun m!563857 () Bool)

(assert (=> b!585615 m!563857))

(declare-fun m!563859 () Bool)

(assert (=> b!585620 m!563859))

(declare-fun m!563861 () Bool)

(assert (=> b!585620 m!563861))

(assert (=> b!585620 m!563849))

(declare-fun m!563863 () Bool)

(assert (=> b!585620 m!563863))

(assert (=> b!585620 m!563861))

(declare-fun m!563865 () Bool)

(assert (=> b!585620 m!563865))

(assert (=> b!585620 m!563849))

(declare-fun m!563867 () Bool)

(assert (=> b!585620 m!563867))

(declare-fun m!563869 () Bool)

(assert (=> b!585620 m!563869))

(declare-fun m!563871 () Bool)

(assert (=> b!585621 m!563871))

(declare-fun m!563873 () Bool)

(assert (=> b!585623 m!563873))

(assert (=> b!585623 m!563863))

(declare-fun m!563875 () Bool)

(assert (=> b!585623 m!563875))

(assert (=> b!585613 m!563849))

(assert (=> b!585613 m!563849))

(declare-fun m!563877 () Bool)

(assert (=> b!585613 m!563877))

(declare-fun m!563879 () Bool)

(assert (=> b!585616 m!563879))

(declare-fun m!563881 () Bool)

(assert (=> b!585617 m!563881))

(assert (=> b!585617 m!563849))

(declare-fun m!563883 () Bool)

(assert (=> b!585614 m!563883))

(check-sat (not b!585620) (not b!585613) (not start!53706) (not b!585614) (not b!585616) (not b!585615) (not b!585618) (not b!585621) (not b!585622))
(check-sat)
