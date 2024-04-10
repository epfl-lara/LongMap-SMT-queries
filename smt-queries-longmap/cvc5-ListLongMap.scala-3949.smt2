; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53704 () Bool)

(assert start!53704)

(declare-fun b!585580 () Bool)

(declare-fun res!373397 () Bool)

(declare-fun e!335029 () Bool)

(assert (=> b!585580 (=> (not res!373397) (not e!335029))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36605 0))(
  ( (array!36606 (arr!17577 (Array (_ BitVec 32) (_ BitVec 64))) (size!17941 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36605)

(assert (=> b!585580 (= res!373397 (and (= (size!17941 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17941 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17941 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585581 () Bool)

(declare-fun res!373399 () Bool)

(declare-fun e!335030 () Bool)

(assert (=> b!585581 (=> (not res!373399) (not e!335030))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585581 (= res!373399 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17577 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17577 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585582 () Bool)

(declare-fun res!373398 () Bool)

(assert (=> b!585582 (=> (not res!373398) (not e!335030))))

(declare-datatypes ((List!11618 0))(
  ( (Nil!11615) (Cons!11614 (h!12659 (_ BitVec 64)) (t!17846 List!11618)) )
))
(declare-fun arrayNoDuplicates!0 (array!36605 (_ BitVec 32) List!11618) Bool)

(assert (=> b!585582 (= res!373398 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11615))))

(declare-fun b!585583 () Bool)

(declare-fun res!373400 () Bool)

(assert (=> b!585583 (=> (not res!373400) (not e!335029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585583 (= res!373400 (validKeyInArray!0 (select (arr!17577 a!2986) j!136)))))

(declare-fun b!585585 () Bool)

(declare-fun res!373404 () Bool)

(assert (=> b!585585 (=> (not res!373404) (not e!335030))))

(assert (=> b!585585 (= res!373404 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17577 a!2986) index!984) (select (arr!17577 a!2986) j!136))) (not (= (select (arr!17577 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585586 () Bool)

(declare-fun res!373402 () Bool)

(assert (=> b!585586 (=> (not res!373402) (not e!335029))))

(declare-fun arrayContainsKey!0 (array!36605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585586 (= res!373402 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585587 () Bool)

(assert (=> b!585587 (= e!335030 (not true))))

(declare-fun lt!265860 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6017 0))(
  ( (MissingZero!6017 (index!26295 (_ BitVec 32))) (Found!6017 (index!26296 (_ BitVec 32))) (Intermediate!6017 (undefined!6829 Bool) (index!26297 (_ BitVec 32)) (x!55118 (_ BitVec 32))) (Undefined!6017) (MissingVacant!6017 (index!26298 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36605 (_ BitVec 32)) SeekEntryResult!6017)

(assert (=> b!585587 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265860 vacantSpotIndex!68 (select (arr!17577 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265860 vacantSpotIndex!68 (select (store (arr!17577 a!2986) i!1108 k!1786) j!136) (array!36606 (store (arr!17577 a!2986) i!1108 k!1786) (size!17941 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18154 0))(
  ( (Unit!18155) )
))
(declare-fun lt!265859 () Unit!18154)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36605 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18154)

(assert (=> b!585587 (= lt!265859 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265860 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585587 (= lt!265860 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585588 () Bool)

(assert (=> b!585588 (= e!335029 e!335030)))

(declare-fun res!373403 () Bool)

(assert (=> b!585588 (=> (not res!373403) (not e!335030))))

(declare-fun lt!265861 () SeekEntryResult!6017)

(assert (=> b!585588 (= res!373403 (or (= lt!265861 (MissingZero!6017 i!1108)) (= lt!265861 (MissingVacant!6017 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36605 (_ BitVec 32)) SeekEntryResult!6017)

(assert (=> b!585588 (= lt!265861 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!373396 () Bool)

(assert (=> start!53704 (=> (not res!373396) (not e!335029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53704 (= res!373396 (validMask!0 mask!3053))))

(assert (=> start!53704 e!335029))

(assert (=> start!53704 true))

(declare-fun array_inv!13373 (array!36605) Bool)

(assert (=> start!53704 (array_inv!13373 a!2986)))

(declare-fun b!585584 () Bool)

(declare-fun res!373401 () Bool)

(assert (=> b!585584 (=> (not res!373401) (not e!335030))))

(assert (=> b!585584 (= res!373401 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17577 a!2986) j!136) a!2986 mask!3053) (Found!6017 j!136)))))

(declare-fun b!585589 () Bool)

(declare-fun res!373406 () Bool)

(assert (=> b!585589 (=> (not res!373406) (not e!335029))))

(assert (=> b!585589 (= res!373406 (validKeyInArray!0 k!1786))))

(declare-fun b!585590 () Bool)

(declare-fun res!373405 () Bool)

(assert (=> b!585590 (=> (not res!373405) (not e!335030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36605 (_ BitVec 32)) Bool)

(assert (=> b!585590 (= res!373405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53704 res!373396) b!585580))

(assert (= (and b!585580 res!373397) b!585583))

(assert (= (and b!585583 res!373400) b!585589))

(assert (= (and b!585589 res!373406) b!585586))

(assert (= (and b!585586 res!373402) b!585588))

(assert (= (and b!585588 res!373403) b!585590))

(assert (= (and b!585590 res!373405) b!585582))

(assert (= (and b!585582 res!373398) b!585581))

(assert (= (and b!585581 res!373399) b!585584))

(assert (= (and b!585584 res!373401) b!585585))

(assert (= (and b!585585 res!373404) b!585587))

(declare-fun m!563809 () Bool)

(assert (=> b!585588 m!563809))

(declare-fun m!563811 () Bool)

(assert (=> b!585581 m!563811))

(declare-fun m!563813 () Bool)

(assert (=> b!585581 m!563813))

(declare-fun m!563815 () Bool)

(assert (=> b!585581 m!563815))

(declare-fun m!563817 () Bool)

(assert (=> b!585589 m!563817))

(declare-fun m!563819 () Bool)

(assert (=> b!585585 m!563819))

(declare-fun m!563821 () Bool)

(assert (=> b!585585 m!563821))

(declare-fun m!563823 () Bool)

(assert (=> b!585586 m!563823))

(declare-fun m!563825 () Bool)

(assert (=> b!585582 m!563825))

(declare-fun m!563827 () Bool)

(assert (=> b!585587 m!563827))

(declare-fun m!563829 () Bool)

(assert (=> b!585587 m!563829))

(assert (=> b!585587 m!563821))

(assert (=> b!585587 m!563813))

(declare-fun m!563831 () Bool)

(assert (=> b!585587 m!563831))

(assert (=> b!585587 m!563829))

(declare-fun m!563833 () Bool)

(assert (=> b!585587 m!563833))

(assert (=> b!585587 m!563821))

(declare-fun m!563835 () Bool)

(assert (=> b!585587 m!563835))

(assert (=> b!585583 m!563821))

(assert (=> b!585583 m!563821))

(declare-fun m!563837 () Bool)

(assert (=> b!585583 m!563837))

(declare-fun m!563839 () Bool)

(assert (=> start!53704 m!563839))

(declare-fun m!563841 () Bool)

(assert (=> start!53704 m!563841))

(assert (=> b!585584 m!563821))

(assert (=> b!585584 m!563821))

(declare-fun m!563843 () Bool)

(assert (=> b!585584 m!563843))

(declare-fun m!563845 () Bool)

(assert (=> b!585590 m!563845))

(push 1)

