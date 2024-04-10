; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53774 () Bool)

(assert start!53774)

(declare-fun b!586735 () Bool)

(declare-fun res!374551 () Bool)

(declare-fun e!335346 () Bool)

(assert (=> b!586735 (=> (not res!374551) (not e!335346))))

(declare-datatypes ((array!36675 0))(
  ( (array!36676 (arr!17612 (Array (_ BitVec 32) (_ BitVec 64))) (size!17976 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36675)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586735 (= res!374551 (validKeyInArray!0 (select (arr!17612 a!2986) j!136)))))

(declare-fun res!374561 () Bool)

(assert (=> start!53774 (=> (not res!374561) (not e!335346))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53774 (= res!374561 (validMask!0 mask!3053))))

(assert (=> start!53774 e!335346))

(assert (=> start!53774 true))

(declare-fun array_inv!13408 (array!36675) Bool)

(assert (=> start!53774 (array_inv!13408 a!2986)))

(declare-fun b!586736 () Bool)

(declare-fun res!374555 () Bool)

(declare-fun e!335345 () Bool)

(assert (=> b!586736 (=> (not res!374555) (not e!335345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36675 (_ BitVec 32)) Bool)

(assert (=> b!586736 (= res!374555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586737 () Bool)

(declare-fun res!374557 () Bool)

(assert (=> b!586737 (=> (not res!374557) (not e!335346))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586737 (= res!374557 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586738 () Bool)

(declare-fun res!374558 () Bool)

(assert (=> b!586738 (=> (not res!374558) (not e!335345))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6052 0))(
  ( (MissingZero!6052 (index!26435 (_ BitVec 32))) (Found!6052 (index!26436 (_ BitVec 32))) (Intermediate!6052 (undefined!6864 Bool) (index!26437 (_ BitVec 32)) (x!55241 (_ BitVec 32))) (Undefined!6052) (MissingVacant!6052 (index!26438 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36675 (_ BitVec 32)) SeekEntryResult!6052)

(assert (=> b!586738 (= res!374558 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17612 a!2986) j!136) a!2986 mask!3053) (Found!6052 j!136)))))

(declare-fun b!586739 () Bool)

(declare-fun res!374560 () Bool)

(assert (=> b!586739 (=> (not res!374560) (not e!335345))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586739 (= res!374560 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17612 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17612 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586740 () Bool)

(assert (=> b!586740 (= e!335345 (not true))))

(declare-fun lt!266174 () (_ BitVec 32))

(assert (=> b!586740 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266174 vacantSpotIndex!68 (select (arr!17612 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266174 vacantSpotIndex!68 (select (store (arr!17612 a!2986) i!1108 k!1786) j!136) (array!36676 (store (arr!17612 a!2986) i!1108 k!1786) (size!17976 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18224 0))(
  ( (Unit!18225) )
))
(declare-fun lt!266175 () Unit!18224)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18224)

(assert (=> b!586740 (= lt!266175 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266174 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586740 (= lt!266174 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586741 () Bool)

(declare-fun res!374559 () Bool)

(assert (=> b!586741 (=> (not res!374559) (not e!335345))))

(declare-datatypes ((List!11653 0))(
  ( (Nil!11650) (Cons!11649 (h!12694 (_ BitVec 64)) (t!17881 List!11653)) )
))
(declare-fun arrayNoDuplicates!0 (array!36675 (_ BitVec 32) List!11653) Bool)

(assert (=> b!586741 (= res!374559 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11650))))

(declare-fun b!586742 () Bool)

(assert (=> b!586742 (= e!335346 e!335345)))

(declare-fun res!374556 () Bool)

(assert (=> b!586742 (=> (not res!374556) (not e!335345))))

(declare-fun lt!266176 () SeekEntryResult!6052)

(assert (=> b!586742 (= res!374556 (or (= lt!266176 (MissingZero!6052 i!1108)) (= lt!266176 (MissingVacant!6052 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36675 (_ BitVec 32)) SeekEntryResult!6052)

(assert (=> b!586742 (= lt!266176 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586743 () Bool)

(declare-fun res!374554 () Bool)

(assert (=> b!586743 (=> (not res!374554) (not e!335346))))

(assert (=> b!586743 (= res!374554 (and (= (size!17976 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17976 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17976 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586744 () Bool)

(declare-fun res!374553 () Bool)

(assert (=> b!586744 (=> (not res!374553) (not e!335345))))

(assert (=> b!586744 (= res!374553 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17612 a!2986) index!984) (select (arr!17612 a!2986) j!136))) (not (= (select (arr!17612 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586745 () Bool)

(declare-fun res!374552 () Bool)

(assert (=> b!586745 (=> (not res!374552) (not e!335346))))

(assert (=> b!586745 (= res!374552 (validKeyInArray!0 k!1786))))

(assert (= (and start!53774 res!374561) b!586743))

(assert (= (and b!586743 res!374554) b!586735))

(assert (= (and b!586735 res!374551) b!586745))

(assert (= (and b!586745 res!374552) b!586737))

(assert (= (and b!586737 res!374557) b!586742))

(assert (= (and b!586742 res!374556) b!586736))

(assert (= (and b!586736 res!374555) b!586741))

(assert (= (and b!586741 res!374559) b!586739))

(assert (= (and b!586739 res!374560) b!586738))

(assert (= (and b!586738 res!374558) b!586744))

(assert (= (and b!586744 res!374553) b!586740))

(declare-fun m!565139 () Bool)

(assert (=> b!586742 m!565139))

(declare-fun m!565141 () Bool)

(assert (=> b!586744 m!565141))

(declare-fun m!565143 () Bool)

(assert (=> b!586744 m!565143))

(declare-fun m!565145 () Bool)

(assert (=> b!586741 m!565145))

(declare-fun m!565147 () Bool)

(assert (=> b!586739 m!565147))

(declare-fun m!565149 () Bool)

(assert (=> b!586739 m!565149))

(declare-fun m!565151 () Bool)

(assert (=> b!586739 m!565151))

(declare-fun m!565153 () Bool)

(assert (=> start!53774 m!565153))

(declare-fun m!565155 () Bool)

(assert (=> start!53774 m!565155))

(declare-fun m!565157 () Bool)

(assert (=> b!586736 m!565157))

(declare-fun m!565159 () Bool)

(assert (=> b!586740 m!565159))

(declare-fun m!565161 () Bool)

(assert (=> b!586740 m!565161))

(declare-fun m!565163 () Bool)

(assert (=> b!586740 m!565163))

(assert (=> b!586740 m!565143))

(assert (=> b!586740 m!565149))

(assert (=> b!586740 m!565161))

(declare-fun m!565165 () Bool)

(assert (=> b!586740 m!565165))

(assert (=> b!586740 m!565143))

(declare-fun m!565167 () Bool)

(assert (=> b!586740 m!565167))

(assert (=> b!586738 m!565143))

(assert (=> b!586738 m!565143))

(declare-fun m!565169 () Bool)

(assert (=> b!586738 m!565169))

(declare-fun m!565171 () Bool)

(assert (=> b!586745 m!565171))

(assert (=> b!586735 m!565143))

(assert (=> b!586735 m!565143))

(declare-fun m!565173 () Bool)

(assert (=> b!586735 m!565173))

(declare-fun m!565175 () Bool)

(assert (=> b!586737 m!565175))

(push 1)

(assert (not start!53774))

