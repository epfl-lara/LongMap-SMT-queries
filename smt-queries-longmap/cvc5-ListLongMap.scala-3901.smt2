; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53416 () Bool)

(assert start!53416)

(declare-fun b!581139 () Bool)

(declare-fun e!333562 () Bool)

(assert (=> b!581139 (= e!333562 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5873 0))(
  ( (MissingZero!5873 (index!25719 (_ BitVec 32))) (Found!5873 (index!25720 (_ BitVec 32))) (Intermediate!5873 (undefined!6685 Bool) (index!25721 (_ BitVec 32)) (x!54590 (_ BitVec 32))) (Undefined!5873) (MissingVacant!5873 (index!25722 (_ BitVec 32))) )
))
(declare-fun lt!264850 () SeekEntryResult!5873)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36317 0))(
  ( (array!36318 (arr!17433 (Array (_ BitVec 32) (_ BitVec 64))) (size!17797 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36317)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36317 (_ BitVec 32)) SeekEntryResult!5873)

(assert (=> b!581139 (= lt!264850 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17433 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581140 () Bool)

(declare-fun res!368956 () Bool)

(declare-fun e!333563 () Bool)

(assert (=> b!581140 (=> (not res!368956) (not e!333563))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581140 (= res!368956 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581141 () Bool)

(declare-fun res!368962 () Bool)

(assert (=> b!581141 (=> (not res!368962) (not e!333563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581141 (= res!368962 (validKeyInArray!0 k!1786))))

(declare-fun b!581142 () Bool)

(declare-fun res!368958 () Bool)

(assert (=> b!581142 (=> (not res!368958) (not e!333562))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581142 (= res!368958 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17433 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17433 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581143 () Bool)

(declare-fun res!368961 () Bool)

(assert (=> b!581143 (=> (not res!368961) (not e!333562))))

(declare-datatypes ((List!11474 0))(
  ( (Nil!11471) (Cons!11470 (h!12515 (_ BitVec 64)) (t!17702 List!11474)) )
))
(declare-fun arrayNoDuplicates!0 (array!36317 (_ BitVec 32) List!11474) Bool)

(assert (=> b!581143 (= res!368961 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11471))))

(declare-fun b!581144 () Bool)

(declare-fun res!368959 () Bool)

(assert (=> b!581144 (=> (not res!368959) (not e!333563))))

(assert (=> b!581144 (= res!368959 (and (= (size!17797 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17797 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17797 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368955 () Bool)

(assert (=> start!53416 (=> (not res!368955) (not e!333563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53416 (= res!368955 (validMask!0 mask!3053))))

(assert (=> start!53416 e!333563))

(assert (=> start!53416 true))

(declare-fun array_inv!13229 (array!36317) Bool)

(assert (=> start!53416 (array_inv!13229 a!2986)))

(declare-fun b!581145 () Bool)

(declare-fun res!368957 () Bool)

(assert (=> b!581145 (=> (not res!368957) (not e!333563))))

(assert (=> b!581145 (= res!368957 (validKeyInArray!0 (select (arr!17433 a!2986) j!136)))))

(declare-fun b!581146 () Bool)

(assert (=> b!581146 (= e!333563 e!333562)))

(declare-fun res!368963 () Bool)

(assert (=> b!581146 (=> (not res!368963) (not e!333562))))

(declare-fun lt!264849 () SeekEntryResult!5873)

(assert (=> b!581146 (= res!368963 (or (= lt!264849 (MissingZero!5873 i!1108)) (= lt!264849 (MissingVacant!5873 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36317 (_ BitVec 32)) SeekEntryResult!5873)

(assert (=> b!581146 (= lt!264849 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581147 () Bool)

(declare-fun res!368960 () Bool)

(assert (=> b!581147 (=> (not res!368960) (not e!333562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36317 (_ BitVec 32)) Bool)

(assert (=> b!581147 (= res!368960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53416 res!368955) b!581144))

(assert (= (and b!581144 res!368959) b!581145))

(assert (= (and b!581145 res!368957) b!581141))

(assert (= (and b!581141 res!368962) b!581140))

(assert (= (and b!581140 res!368956) b!581146))

(assert (= (and b!581146 res!368963) b!581147))

(assert (= (and b!581147 res!368960) b!581143))

(assert (= (and b!581143 res!368961) b!581142))

(assert (= (and b!581142 res!368958) b!581139))

(declare-fun m!559693 () Bool)

(assert (=> b!581140 m!559693))

(declare-fun m!559695 () Bool)

(assert (=> b!581142 m!559695))

(declare-fun m!559697 () Bool)

(assert (=> b!581142 m!559697))

(declare-fun m!559699 () Bool)

(assert (=> b!581142 m!559699))

(declare-fun m!559701 () Bool)

(assert (=> b!581147 m!559701))

(declare-fun m!559703 () Bool)

(assert (=> b!581146 m!559703))

(declare-fun m!559705 () Bool)

(assert (=> b!581145 m!559705))

(assert (=> b!581145 m!559705))

(declare-fun m!559707 () Bool)

(assert (=> b!581145 m!559707))

(declare-fun m!559709 () Bool)

(assert (=> start!53416 m!559709))

(declare-fun m!559711 () Bool)

(assert (=> start!53416 m!559711))

(declare-fun m!559713 () Bool)

(assert (=> b!581141 m!559713))

(assert (=> b!581139 m!559705))

(assert (=> b!581139 m!559705))

(declare-fun m!559715 () Bool)

(assert (=> b!581139 m!559715))

(declare-fun m!559717 () Bool)

(assert (=> b!581143 m!559717))

(push 1)

