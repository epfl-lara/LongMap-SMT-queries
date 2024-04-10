; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53900 () Bool)

(assert start!53900)

(declare-fun b!588076 () Bool)

(declare-fun e!335858 () Bool)

(declare-fun e!335857 () Bool)

(assert (=> b!588076 (= e!335858 e!335857)))

(declare-fun res!375714 () Bool)

(assert (=> b!588076 (=> (not res!375714) (not e!335857))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6085 0))(
  ( (MissingZero!6085 (index!26570 (_ BitVec 32))) (Found!6085 (index!26571 (_ BitVec 32))) (Intermediate!6085 (undefined!6897 Bool) (index!26572 (_ BitVec 32)) (x!55371 (_ BitVec 32))) (Undefined!6085) (MissingVacant!6085 (index!26573 (_ BitVec 32))) )
))
(declare-fun lt!266626 () SeekEntryResult!6085)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36744 0))(
  ( (array!36745 (arr!17645 (Array (_ BitVec 32) (_ BitVec 64))) (size!18009 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36744)

(assert (=> b!588076 (= res!375714 (and (= lt!266626 (Found!6085 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17645 a!2986) index!984) (select (arr!17645 a!2986) j!136))) (not (= (select (arr!17645 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36744 (_ BitVec 32)) SeekEntryResult!6085)

(assert (=> b!588076 (= lt!266626 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17645 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588077 () Bool)

(assert (=> b!588077 (= e!335857 (not true))))

(declare-fun e!335859 () Bool)

(assert (=> b!588077 e!335859))

(declare-fun res!375715 () Bool)

(assert (=> b!588077 (=> (not res!375715) (not e!335859))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!266629 () (_ BitVec 32))

(declare-fun lt!266628 () SeekEntryResult!6085)

(assert (=> b!588077 (= res!375715 (= lt!266628 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266629 vacantSpotIndex!68 (select (store (arr!17645 a!2986) i!1108 k!1786) j!136) (array!36745 (store (arr!17645 a!2986) i!1108 k!1786) (size!18009 a!2986)) mask!3053)))))

(assert (=> b!588077 (= lt!266628 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266629 vacantSpotIndex!68 (select (arr!17645 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18290 0))(
  ( (Unit!18291) )
))
(declare-fun lt!266627 () Unit!18290)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36744 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18290)

(assert (=> b!588077 (= lt!266627 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266629 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588077 (= lt!266629 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588078 () Bool)

(declare-fun res!375722 () Bool)

(assert (=> b!588078 (=> (not res!375722) (not e!335858))))

(declare-datatypes ((List!11686 0))(
  ( (Nil!11683) (Cons!11682 (h!12727 (_ BitVec 64)) (t!17914 List!11686)) )
))
(declare-fun arrayNoDuplicates!0 (array!36744 (_ BitVec 32) List!11686) Bool)

(assert (=> b!588078 (= res!375722 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11683))))

(declare-fun b!588079 () Bool)

(declare-fun e!335856 () Bool)

(assert (=> b!588079 (= e!335856 e!335858)))

(declare-fun res!375719 () Bool)

(assert (=> b!588079 (=> (not res!375719) (not e!335858))))

(declare-fun lt!266625 () SeekEntryResult!6085)

(assert (=> b!588079 (= res!375719 (or (= lt!266625 (MissingZero!6085 i!1108)) (= lt!266625 (MissingVacant!6085 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36744 (_ BitVec 32)) SeekEntryResult!6085)

(assert (=> b!588079 (= lt!266625 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588080 () Bool)

(assert (=> b!588080 (= e!335859 (= lt!266626 lt!266628))))

(declare-fun b!588081 () Bool)

(declare-fun res!375716 () Bool)

(assert (=> b!588081 (=> (not res!375716) (not e!335856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588081 (= res!375716 (validKeyInArray!0 (select (arr!17645 a!2986) j!136)))))

(declare-fun b!588082 () Bool)

(declare-fun res!375717 () Bool)

(assert (=> b!588082 (=> (not res!375717) (not e!335858))))

(assert (=> b!588082 (= res!375717 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17645 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17645 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!375721 () Bool)

(assert (=> start!53900 (=> (not res!375721) (not e!335856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53900 (= res!375721 (validMask!0 mask!3053))))

(assert (=> start!53900 e!335856))

(assert (=> start!53900 true))

(declare-fun array_inv!13441 (array!36744) Bool)

(assert (=> start!53900 (array_inv!13441 a!2986)))

(declare-fun b!588083 () Bool)

(declare-fun res!375718 () Bool)

(assert (=> b!588083 (=> (not res!375718) (not e!335856))))

(assert (=> b!588083 (= res!375718 (and (= (size!18009 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18009 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18009 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588084 () Bool)

(declare-fun res!375712 () Bool)

(assert (=> b!588084 (=> (not res!375712) (not e!335858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36744 (_ BitVec 32)) Bool)

(assert (=> b!588084 (= res!375712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588085 () Bool)

(declare-fun res!375720 () Bool)

(assert (=> b!588085 (=> (not res!375720) (not e!335856))))

(declare-fun arrayContainsKey!0 (array!36744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588085 (= res!375720 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588086 () Bool)

(declare-fun res!375713 () Bool)

(assert (=> b!588086 (=> (not res!375713) (not e!335856))))

(assert (=> b!588086 (= res!375713 (validKeyInArray!0 k!1786))))

(assert (= (and start!53900 res!375721) b!588083))

(assert (= (and b!588083 res!375718) b!588081))

(assert (= (and b!588081 res!375716) b!588086))

(assert (= (and b!588086 res!375713) b!588085))

(assert (= (and b!588085 res!375720) b!588079))

(assert (= (and b!588079 res!375719) b!588084))

(assert (= (and b!588084 res!375712) b!588078))

(assert (= (and b!588078 res!375722) b!588082))

(assert (= (and b!588082 res!375717) b!588076))

(assert (= (and b!588076 res!375714) b!588077))

(assert (= (and b!588077 res!375715) b!588080))

(declare-fun m!566573 () Bool)

(assert (=> b!588086 m!566573))

(declare-fun m!566575 () Bool)

(assert (=> b!588081 m!566575))

(assert (=> b!588081 m!566575))

(declare-fun m!566577 () Bool)

(assert (=> b!588081 m!566577))

(declare-fun m!566579 () Bool)

(assert (=> b!588082 m!566579))

(declare-fun m!566581 () Bool)

(assert (=> b!588082 m!566581))

(declare-fun m!566583 () Bool)

(assert (=> b!588082 m!566583))

(declare-fun m!566585 () Bool)

(assert (=> b!588076 m!566585))

(assert (=> b!588076 m!566575))

(assert (=> b!588076 m!566575))

(declare-fun m!566587 () Bool)

(assert (=> b!588076 m!566587))

(declare-fun m!566589 () Bool)

(assert (=> b!588078 m!566589))

(declare-fun m!566591 () Bool)

(assert (=> start!53900 m!566591))

(declare-fun m!566593 () Bool)

(assert (=> start!53900 m!566593))

(declare-fun m!566595 () Bool)

(assert (=> b!588084 m!566595))

(declare-fun m!566597 () Bool)

(assert (=> b!588079 m!566597))

(declare-fun m!566599 () Bool)

(assert (=> b!588077 m!566599))

(declare-fun m!566601 () Bool)

(assert (=> b!588077 m!566601))

(assert (=> b!588077 m!566575))

(declare-fun m!566603 () Bool)

(assert (=> b!588077 m!566603))

(assert (=> b!588077 m!566601))

(declare-fun m!566605 () Bool)

(assert (=> b!588077 m!566605))

(assert (=> b!588077 m!566575))

(declare-fun m!566607 () Bool)

(assert (=> b!588077 m!566607))

(assert (=> b!588077 m!566581))

(declare-fun m!566609 () Bool)

(assert (=> b!588085 m!566609))

(push 1)

(assert (not b!588084))

