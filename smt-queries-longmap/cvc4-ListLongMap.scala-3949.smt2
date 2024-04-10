; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53708 () Bool)

(assert start!53708)

(declare-fun b!585646 () Bool)

(declare-fun res!373469 () Bool)

(declare-fun e!335049 () Bool)

(assert (=> b!585646 (=> (not res!373469) (not e!335049))))

(declare-datatypes ((array!36609 0))(
  ( (array!36610 (arr!17579 (Array (_ BitVec 32) (_ BitVec 64))) (size!17943 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36609)

(declare-datatypes ((List!11620 0))(
  ( (Nil!11617) (Cons!11616 (h!12661 (_ BitVec 64)) (t!17848 List!11620)) )
))
(declare-fun arrayNoDuplicates!0 (array!36609 (_ BitVec 32) List!11620) Bool)

(assert (=> b!585646 (= res!373469 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11617))))

(declare-fun b!585647 () Bool)

(declare-fun res!373472 () Bool)

(assert (=> b!585647 (=> (not res!373472) (not e!335049))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36609 (_ BitVec 32)) Bool)

(assert (=> b!585647 (= res!373472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585648 () Bool)

(declare-fun res!373468 () Bool)

(declare-fun e!335047 () Bool)

(assert (=> b!585648 (=> (not res!373468) (not e!335047))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585648 (= res!373468 (and (= (size!17943 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17943 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17943 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585649 () Bool)

(assert (=> b!585649 (= e!335049 (not true))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265879 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6019 0))(
  ( (MissingZero!6019 (index!26303 (_ BitVec 32))) (Found!6019 (index!26304 (_ BitVec 32))) (Intermediate!6019 (undefined!6831 Bool) (index!26305 (_ BitVec 32)) (x!55120 (_ BitVec 32))) (Undefined!6019) (MissingVacant!6019 (index!26306 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36609 (_ BitVec 32)) SeekEntryResult!6019)

(assert (=> b!585649 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265879 vacantSpotIndex!68 (select (arr!17579 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265879 vacantSpotIndex!68 (select (store (arr!17579 a!2986) i!1108 k!1786) j!136) (array!36610 (store (arr!17579 a!2986) i!1108 k!1786) (size!17943 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18158 0))(
  ( (Unit!18159) )
))
(declare-fun lt!265878 () Unit!18158)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18158)

(assert (=> b!585649 (= lt!265878 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265879 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585649 (= lt!265879 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585650 () Bool)

(declare-fun res!373465 () Bool)

(assert (=> b!585650 (=> (not res!373465) (not e!335047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585650 (= res!373465 (validKeyInArray!0 (select (arr!17579 a!2986) j!136)))))

(declare-fun b!585652 () Bool)

(declare-fun res!373462 () Bool)

(assert (=> b!585652 (=> (not res!373462) (not e!335047))))

(assert (=> b!585652 (= res!373462 (validKeyInArray!0 k!1786))))

(declare-fun b!585653 () Bool)

(assert (=> b!585653 (= e!335047 e!335049)))

(declare-fun res!373463 () Bool)

(assert (=> b!585653 (=> (not res!373463) (not e!335049))))

(declare-fun lt!265877 () SeekEntryResult!6019)

(assert (=> b!585653 (= res!373463 (or (= lt!265877 (MissingZero!6019 i!1108)) (= lt!265877 (MissingVacant!6019 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36609 (_ BitVec 32)) SeekEntryResult!6019)

(assert (=> b!585653 (= lt!265877 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585654 () Bool)

(declare-fun res!373471 () Bool)

(assert (=> b!585654 (=> (not res!373471) (not e!335049))))

(assert (=> b!585654 (= res!373471 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17579 a!2986) j!136) a!2986 mask!3053) (Found!6019 j!136)))))

(declare-fun b!585655 () Bool)

(declare-fun res!373464 () Bool)

(assert (=> b!585655 (=> (not res!373464) (not e!335047))))

(declare-fun arrayContainsKey!0 (array!36609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585655 (= res!373464 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585656 () Bool)

(declare-fun res!373466 () Bool)

(assert (=> b!585656 (=> (not res!373466) (not e!335049))))

(assert (=> b!585656 (= res!373466 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17579 a!2986) index!984) (select (arr!17579 a!2986) j!136))) (not (= (select (arr!17579 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585651 () Bool)

(declare-fun res!373470 () Bool)

(assert (=> b!585651 (=> (not res!373470) (not e!335049))))

(assert (=> b!585651 (= res!373470 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17579 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17579 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!373467 () Bool)

(assert (=> start!53708 (=> (not res!373467) (not e!335047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53708 (= res!373467 (validMask!0 mask!3053))))

(assert (=> start!53708 e!335047))

(assert (=> start!53708 true))

(declare-fun array_inv!13375 (array!36609) Bool)

(assert (=> start!53708 (array_inv!13375 a!2986)))

(assert (= (and start!53708 res!373467) b!585648))

(assert (= (and b!585648 res!373468) b!585650))

(assert (= (and b!585650 res!373465) b!585652))

(assert (= (and b!585652 res!373462) b!585655))

(assert (= (and b!585655 res!373464) b!585653))

(assert (= (and b!585653 res!373463) b!585647))

(assert (= (and b!585647 res!373472) b!585646))

(assert (= (and b!585646 res!373469) b!585651))

(assert (= (and b!585651 res!373470) b!585654))

(assert (= (and b!585654 res!373471) b!585656))

(assert (= (and b!585656 res!373466) b!585649))

(declare-fun m!563885 () Bool)

(assert (=> b!585651 m!563885))

(declare-fun m!563887 () Bool)

(assert (=> b!585651 m!563887))

(declare-fun m!563889 () Bool)

(assert (=> b!585651 m!563889))

(declare-fun m!563891 () Bool)

(assert (=> b!585650 m!563891))

(assert (=> b!585650 m!563891))

(declare-fun m!563893 () Bool)

(assert (=> b!585650 m!563893))

(declare-fun m!563895 () Bool)

(assert (=> b!585656 m!563895))

(assert (=> b!585656 m!563891))

(declare-fun m!563897 () Bool)

(assert (=> b!585655 m!563897))

(declare-fun m!563899 () Bool)

(assert (=> start!53708 m!563899))

(declare-fun m!563901 () Bool)

(assert (=> start!53708 m!563901))

(assert (=> b!585654 m!563891))

(assert (=> b!585654 m!563891))

(declare-fun m!563903 () Bool)

(assert (=> b!585654 m!563903))

(declare-fun m!563905 () Bool)

(assert (=> b!585649 m!563905))

(declare-fun m!563907 () Bool)

(assert (=> b!585649 m!563907))

(assert (=> b!585649 m!563891))

(declare-fun m!563909 () Bool)

(assert (=> b!585649 m!563909))

(assert (=> b!585649 m!563891))

(assert (=> b!585649 m!563887))

(assert (=> b!585649 m!563907))

(declare-fun m!563911 () Bool)

(assert (=> b!585649 m!563911))

(declare-fun m!563913 () Bool)

(assert (=> b!585649 m!563913))

(declare-fun m!563915 () Bool)

(assert (=> b!585653 m!563915))

(declare-fun m!563917 () Bool)

(assert (=> b!585646 m!563917))

(declare-fun m!563919 () Bool)

(assert (=> b!585652 m!563919))

(declare-fun m!563921 () Bool)

(assert (=> b!585647 m!563921))

(push 1)

(assert (not b!585646))

(assert (not start!53708))

(assert (not b!585649))

(assert (not b!585647))

(assert (not b!585654))

(assert (not b!585652))

(assert (not b!585655))

