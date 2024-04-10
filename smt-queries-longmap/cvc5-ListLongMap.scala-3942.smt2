; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53662 () Bool)

(assert start!53662)

(declare-fun b!584826 () Bool)

(declare-fun e!334780 () Bool)

(assert (=> b!584826 (= e!334780 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36563 0))(
  ( (array!36564 (arr!17556 (Array (_ BitVec 32) (_ BitVec 64))) (size!17920 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36563)

(declare-datatypes ((SeekEntryResult!5996 0))(
  ( (MissingZero!5996 (index!26211 (_ BitVec 32))) (Found!5996 (index!26212 (_ BitVec 32))) (Intermediate!5996 (undefined!6808 Bool) (index!26213 (_ BitVec 32)) (x!55041 (_ BitVec 32))) (Undefined!5996) (MissingVacant!5996 (index!26214 (_ BitVec 32))) )
))
(declare-fun lt!265672 () SeekEntryResult!5996)

(declare-fun lt!265671 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36563 (_ BitVec 32)) SeekEntryResult!5996)

(assert (=> b!584826 (= lt!265672 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265671 vacantSpotIndex!68 (select (arr!17556 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584827 () Bool)

(declare-fun res!372653 () Bool)

(declare-fun e!334781 () Bool)

(assert (=> b!584827 (=> (not res!372653) (not e!334781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36563 (_ BitVec 32)) Bool)

(assert (=> b!584827 (= res!372653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584828 () Bool)

(declare-fun res!372646 () Bool)

(assert (=> b!584828 (=> (not res!372646) (not e!334781))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584828 (= res!372646 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17556 a!2986) j!136) a!2986 mask!3053) (Found!5996 j!136)))))

(declare-fun b!584829 () Bool)

(declare-fun res!372643 () Bool)

(declare-fun e!334782 () Bool)

(assert (=> b!584829 (=> (not res!372643) (not e!334782))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584829 (= res!372643 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584830 () Bool)

(declare-fun res!372652 () Bool)

(assert (=> b!584830 (=> (not res!372652) (not e!334781))))

(assert (=> b!584830 (= res!372652 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17556 a!2986) index!984) (select (arr!17556 a!2986) j!136))) (not (= (select (arr!17556 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584831 () Bool)

(declare-fun res!372645 () Bool)

(assert (=> b!584831 (=> (not res!372645) (not e!334782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584831 (= res!372645 (validKeyInArray!0 (select (arr!17556 a!2986) j!136)))))

(declare-fun b!584832 () Bool)

(assert (=> b!584832 (= e!334781 e!334780)))

(declare-fun res!372651 () Bool)

(assert (=> b!584832 (=> (not res!372651) (not e!334780))))

(assert (=> b!584832 (= res!372651 (and (bvsge lt!265671 #b00000000000000000000000000000000) (bvslt lt!265671 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584832 (= lt!265671 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584833 () Bool)

(assert (=> b!584833 (= e!334782 e!334781)))

(declare-fun res!372650 () Bool)

(assert (=> b!584833 (=> (not res!372650) (not e!334781))))

(declare-fun lt!265670 () SeekEntryResult!5996)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584833 (= res!372650 (or (= lt!265670 (MissingZero!5996 i!1108)) (= lt!265670 (MissingVacant!5996 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36563 (_ BitVec 32)) SeekEntryResult!5996)

(assert (=> b!584833 (= lt!265670 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584835 () Bool)

(declare-fun res!372644 () Bool)

(assert (=> b!584835 (=> (not res!372644) (not e!334781))))

(declare-datatypes ((List!11597 0))(
  ( (Nil!11594) (Cons!11593 (h!12638 (_ BitVec 64)) (t!17825 List!11597)) )
))
(declare-fun arrayNoDuplicates!0 (array!36563 (_ BitVec 32) List!11597) Bool)

(assert (=> b!584835 (= res!372644 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11594))))

(declare-fun b!584836 () Bool)

(declare-fun res!372649 () Bool)

(assert (=> b!584836 (=> (not res!372649) (not e!334781))))

(assert (=> b!584836 (= res!372649 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17556 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17556 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584837 () Bool)

(declare-fun res!372647 () Bool)

(assert (=> b!584837 (=> (not res!372647) (not e!334782))))

(assert (=> b!584837 (= res!372647 (and (= (size!17920 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17920 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17920 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584834 () Bool)

(declare-fun res!372642 () Bool)

(assert (=> b!584834 (=> (not res!372642) (not e!334782))))

(assert (=> b!584834 (= res!372642 (validKeyInArray!0 k!1786))))

(declare-fun res!372648 () Bool)

(assert (=> start!53662 (=> (not res!372648) (not e!334782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53662 (= res!372648 (validMask!0 mask!3053))))

(assert (=> start!53662 e!334782))

(assert (=> start!53662 true))

(declare-fun array_inv!13352 (array!36563) Bool)

(assert (=> start!53662 (array_inv!13352 a!2986)))

(assert (= (and start!53662 res!372648) b!584837))

(assert (= (and b!584837 res!372647) b!584831))

(assert (= (and b!584831 res!372645) b!584834))

(assert (= (and b!584834 res!372642) b!584829))

(assert (= (and b!584829 res!372643) b!584833))

(assert (= (and b!584833 res!372650) b!584827))

(assert (= (and b!584827 res!372653) b!584835))

(assert (= (and b!584835 res!372644) b!584836))

(assert (= (and b!584836 res!372649) b!584828))

(assert (= (and b!584828 res!372646) b!584830))

(assert (= (and b!584830 res!372652) b!584832))

(assert (= (and b!584832 res!372651) b!584826))

(declare-fun m!563137 () Bool)

(assert (=> b!584827 m!563137))

(declare-fun m!563139 () Bool)

(assert (=> b!584831 m!563139))

(assert (=> b!584831 m!563139))

(declare-fun m!563141 () Bool)

(assert (=> b!584831 m!563141))

(assert (=> b!584826 m!563139))

(assert (=> b!584826 m!563139))

(declare-fun m!563143 () Bool)

(assert (=> b!584826 m!563143))

(declare-fun m!563145 () Bool)

(assert (=> b!584836 m!563145))

(declare-fun m!563147 () Bool)

(assert (=> b!584836 m!563147))

(declare-fun m!563149 () Bool)

(assert (=> b!584836 m!563149))

(declare-fun m!563151 () Bool)

(assert (=> b!584829 m!563151))

(declare-fun m!563153 () Bool)

(assert (=> b!584832 m!563153))

(declare-fun m!563155 () Bool)

(assert (=> b!584830 m!563155))

(assert (=> b!584830 m!563139))

(declare-fun m!563157 () Bool)

(assert (=> b!584833 m!563157))

(declare-fun m!563159 () Bool)

(assert (=> b!584834 m!563159))

(assert (=> b!584828 m!563139))

(assert (=> b!584828 m!563139))

(declare-fun m!563161 () Bool)

(assert (=> b!584828 m!563161))

(declare-fun m!563163 () Bool)

(assert (=> start!53662 m!563163))

(declare-fun m!563165 () Bool)

(assert (=> start!53662 m!563165))

(declare-fun m!563167 () Bool)

(assert (=> b!584835 m!563167))

(push 1)

