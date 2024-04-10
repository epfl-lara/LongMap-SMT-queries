; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53780 () Bool)

(assert start!53780)

(declare-fun b!586834 () Bool)

(declare-fun e!335371 () Bool)

(assert (=> b!586834 (= e!335371 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!266201 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36681 0))(
  ( (array!36682 (arr!17615 (Array (_ BitVec 32) (_ BitVec 64))) (size!17979 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36681)

(declare-datatypes ((SeekEntryResult!6055 0))(
  ( (MissingZero!6055 (index!26447 (_ BitVec 32))) (Found!6055 (index!26448 (_ BitVec 32))) (Intermediate!6055 (undefined!6867 Bool) (index!26449 (_ BitVec 32)) (x!55252 (_ BitVec 32))) (Undefined!6055) (MissingVacant!6055 (index!26450 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36681 (_ BitVec 32)) SeekEntryResult!6055)

(assert (=> b!586834 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266201 vacantSpotIndex!68 (select (arr!17615 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266201 vacantSpotIndex!68 (select (store (arr!17615 a!2986) i!1108 k!1786) j!136) (array!36682 (store (arr!17615 a!2986) i!1108 k!1786) (size!17979 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18230 0))(
  ( (Unit!18231) )
))
(declare-fun lt!266203 () Unit!18230)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18230)

(assert (=> b!586834 (= lt!266203 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266201 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586834 (= lt!266201 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586835 () Bool)

(declare-fun res!374659 () Bool)

(declare-fun e!335373 () Bool)

(assert (=> b!586835 (=> (not res!374659) (not e!335373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586835 (= res!374659 (validKeyInArray!0 k!1786))))

(declare-fun b!586836 () Bool)

(declare-fun res!374657 () Bool)

(assert (=> b!586836 (=> (not res!374657) (not e!335373))))

(assert (=> b!586836 (= res!374657 (validKeyInArray!0 (select (arr!17615 a!2986) j!136)))))

(declare-fun b!586837 () Bool)

(declare-fun res!374654 () Bool)

(assert (=> b!586837 (=> (not res!374654) (not e!335373))))

(assert (=> b!586837 (= res!374654 (and (= (size!17979 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17979 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17979 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586838 () Bool)

(declare-fun res!374656 () Bool)

(assert (=> b!586838 (=> (not res!374656) (not e!335371))))

(assert (=> b!586838 (= res!374656 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17615 a!2986) j!136) a!2986 mask!3053) (Found!6055 j!136)))))

(declare-fun b!586839 () Bool)

(declare-fun res!374652 () Bool)

(assert (=> b!586839 (=> (not res!374652) (not e!335373))))

(declare-fun arrayContainsKey!0 (array!36681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586839 (= res!374652 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586840 () Bool)

(declare-fun res!374653 () Bool)

(assert (=> b!586840 (=> (not res!374653) (not e!335371))))

(assert (=> b!586840 (= res!374653 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17615 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17615 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586841 () Bool)

(declare-fun res!374655 () Bool)

(assert (=> b!586841 (=> (not res!374655) (not e!335371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36681 (_ BitVec 32)) Bool)

(assert (=> b!586841 (= res!374655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!374660 () Bool)

(assert (=> start!53780 (=> (not res!374660) (not e!335373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53780 (= res!374660 (validMask!0 mask!3053))))

(assert (=> start!53780 e!335373))

(assert (=> start!53780 true))

(declare-fun array_inv!13411 (array!36681) Bool)

(assert (=> start!53780 (array_inv!13411 a!2986)))

(declare-fun b!586842 () Bool)

(declare-fun res!374658 () Bool)

(assert (=> b!586842 (=> (not res!374658) (not e!335371))))

(declare-datatypes ((List!11656 0))(
  ( (Nil!11653) (Cons!11652 (h!12697 (_ BitVec 64)) (t!17884 List!11656)) )
))
(declare-fun arrayNoDuplicates!0 (array!36681 (_ BitVec 32) List!11656) Bool)

(assert (=> b!586842 (= res!374658 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11653))))

(declare-fun b!586843 () Bool)

(assert (=> b!586843 (= e!335373 e!335371)))

(declare-fun res!374650 () Bool)

(assert (=> b!586843 (=> (not res!374650) (not e!335371))))

(declare-fun lt!266202 () SeekEntryResult!6055)

(assert (=> b!586843 (= res!374650 (or (= lt!266202 (MissingZero!6055 i!1108)) (= lt!266202 (MissingVacant!6055 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36681 (_ BitVec 32)) SeekEntryResult!6055)

(assert (=> b!586843 (= lt!266202 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586844 () Bool)

(declare-fun res!374651 () Bool)

(assert (=> b!586844 (=> (not res!374651) (not e!335371))))

(assert (=> b!586844 (= res!374651 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17615 a!2986) index!984) (select (arr!17615 a!2986) j!136))) (not (= (select (arr!17615 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53780 res!374660) b!586837))

(assert (= (and b!586837 res!374654) b!586836))

(assert (= (and b!586836 res!374657) b!586835))

(assert (= (and b!586835 res!374659) b!586839))

(assert (= (and b!586839 res!374652) b!586843))

(assert (= (and b!586843 res!374650) b!586841))

(assert (= (and b!586841 res!374655) b!586842))

(assert (= (and b!586842 res!374658) b!586840))

(assert (= (and b!586840 res!374653) b!586838))

(assert (= (and b!586838 res!374656) b!586844))

(assert (= (and b!586844 res!374651) b!586834))

(declare-fun m!565253 () Bool)

(assert (=> b!586839 m!565253))

(declare-fun m!565255 () Bool)

(assert (=> start!53780 m!565255))

(declare-fun m!565257 () Bool)

(assert (=> start!53780 m!565257))

(declare-fun m!565259 () Bool)

(assert (=> b!586844 m!565259))

(declare-fun m!565261 () Bool)

(assert (=> b!586844 m!565261))

(declare-fun m!565263 () Bool)

(assert (=> b!586843 m!565263))

(declare-fun m!565265 () Bool)

(assert (=> b!586840 m!565265))

(declare-fun m!565267 () Bool)

(assert (=> b!586840 m!565267))

(declare-fun m!565269 () Bool)

(assert (=> b!586840 m!565269))

(declare-fun m!565271 () Bool)

(assert (=> b!586842 m!565271))

(assert (=> b!586838 m!565261))

(assert (=> b!586838 m!565261))

(declare-fun m!565273 () Bool)

(assert (=> b!586838 m!565273))

(declare-fun m!565275 () Bool)

(assert (=> b!586835 m!565275))

(assert (=> b!586836 m!565261))

(assert (=> b!586836 m!565261))

(declare-fun m!565277 () Bool)

(assert (=> b!586836 m!565277))

(declare-fun m!565279 () Bool)

(assert (=> b!586834 m!565279))

(declare-fun m!565281 () Bool)

(assert (=> b!586834 m!565281))

(assert (=> b!586834 m!565261))

(assert (=> b!586834 m!565281))

(declare-fun m!565283 () Bool)

(assert (=> b!586834 m!565283))

(assert (=> b!586834 m!565261))

(declare-fun m!565285 () Bool)

(assert (=> b!586834 m!565285))

(declare-fun m!565287 () Bool)

(assert (=> b!586834 m!565287))

(assert (=> b!586834 m!565267))

(declare-fun m!565289 () Bool)

(assert (=> b!586841 m!565289))

(push 1)

