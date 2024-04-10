; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53956 () Bool)

(assert start!53956)

(declare-fun res!376686 () Bool)

(declare-fun e!336363 () Bool)

(assert (=> start!53956 (=> (not res!376686) (not e!336363))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53956 (= res!376686 (validMask!0 mask!3053))))

(assert (=> start!53956 e!336363))

(assert (=> start!53956 true))

(declare-datatypes ((array!36800 0))(
  ( (array!36801 (arr!17673 (Array (_ BitVec 32) (_ BitVec 64))) (size!18037 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36800)

(declare-fun array_inv!13469 (array!36800) Bool)

(assert (=> start!53956 (array_inv!13469 a!2986)))

(declare-fun b!589123 () Bool)

(declare-fun res!376688 () Bool)

(assert (=> b!589123 (=> (not res!376688) (not e!336363))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589123 (= res!376688 (validKeyInArray!0 k!1786))))

(declare-fun b!589124 () Bool)

(declare-fun e!336364 () Bool)

(declare-datatypes ((SeekEntryResult!6113 0))(
  ( (MissingZero!6113 (index!26682 (_ BitVec 32))) (Found!6113 (index!26683 (_ BitVec 32))) (Intermediate!6113 (undefined!6925 Bool) (index!26684 (_ BitVec 32)) (x!55479 (_ BitVec 32))) (Undefined!6113) (MissingVacant!6113 (index!26685 (_ BitVec 32))) )
))
(declare-fun lt!267161 () SeekEntryResult!6113)

(declare-fun lt!267159 () SeekEntryResult!6113)

(assert (=> b!589124 (= e!336364 (= lt!267161 lt!267159))))

(declare-fun b!589125 () Bool)

(declare-fun res!376684 () Bool)

(declare-fun e!336360 () Bool)

(assert (=> b!589125 (=> (not res!376684) (not e!336360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36800 (_ BitVec 32)) Bool)

(assert (=> b!589125 (= res!376684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589126 () Bool)

(declare-fun res!376689 () Bool)

(assert (=> b!589126 (=> (not res!376689) (not e!336360))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589126 (= res!376689 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17673 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589127 () Bool)

(declare-datatypes ((Unit!18370 0))(
  ( (Unit!18371) )
))
(declare-fun e!336365 () Unit!18370)

(declare-fun Unit!18372 () Unit!18370)

(assert (=> b!589127 (= e!336365 Unit!18372)))

(assert (=> b!589127 false))

(declare-fun b!589128 () Bool)

(declare-fun e!336361 () Bool)

(declare-fun e!336366 () Bool)

(assert (=> b!589128 (= e!336361 e!336366)))

(declare-fun res!376683 () Bool)

(assert (=> b!589128 (=> (not res!376683) (not e!336366))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!589128 (= res!376683 (and (= lt!267161 (Found!6113 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17673 a!2986) index!984) (select (arr!17673 a!2986) j!136))) (not (= (select (arr!17673 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36800 (_ BitVec 32)) SeekEntryResult!6113)

(assert (=> b!589128 (= lt!267161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17673 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589129 () Bool)

(declare-fun res!376691 () Bool)

(assert (=> b!589129 (=> (not res!376691) (not e!336363))))

(declare-fun arrayContainsKey!0 (array!36800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589129 (= res!376691 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589130 () Bool)

(assert (=> b!589130 (= e!336366 (not true))))

(declare-fun lt!267165 () Unit!18370)

(assert (=> b!589130 (= lt!267165 e!336365)))

(declare-fun c!66587 () Bool)

(declare-fun lt!267162 () (_ BitVec 64))

(declare-fun lt!267166 () array!36800)

(assert (=> b!589130 (= c!66587 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267162 lt!267166 mask!3053) Undefined!6113))))

(assert (=> b!589130 e!336364))

(declare-fun res!376685 () Bool)

(assert (=> b!589130 (=> (not res!376685) (not e!336364))))

(declare-fun lt!267160 () (_ BitVec 32))

(assert (=> b!589130 (= res!376685 (= lt!267159 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267160 vacantSpotIndex!68 lt!267162 lt!267166 mask!3053)))))

(assert (=> b!589130 (= lt!267159 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267160 vacantSpotIndex!68 (select (arr!17673 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589130 (= lt!267162 (select (store (arr!17673 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267164 () Unit!18370)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36800 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18370)

(assert (=> b!589130 (= lt!267164 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267160 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589130 (= lt!267160 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589131 () Bool)

(declare-fun res!376692 () Bool)

(assert (=> b!589131 (=> (not res!376692) (not e!336360))))

(declare-datatypes ((List!11714 0))(
  ( (Nil!11711) (Cons!11710 (h!12755 (_ BitVec 64)) (t!17942 List!11714)) )
))
(declare-fun arrayNoDuplicates!0 (array!36800 (_ BitVec 32) List!11714) Bool)

(assert (=> b!589131 (= res!376692 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11711))))

(declare-fun b!589132 () Bool)

(declare-fun Unit!18373 () Unit!18370)

(assert (=> b!589132 (= e!336365 Unit!18373)))

(declare-fun b!589133 () Bool)

(declare-fun res!376693 () Bool)

(assert (=> b!589133 (=> (not res!376693) (not e!336363))))

(assert (=> b!589133 (= res!376693 (validKeyInArray!0 (select (arr!17673 a!2986) j!136)))))

(declare-fun b!589134 () Bool)

(assert (=> b!589134 (= e!336363 e!336360)))

(declare-fun res!376694 () Bool)

(assert (=> b!589134 (=> (not res!376694) (not e!336360))))

(declare-fun lt!267163 () SeekEntryResult!6113)

(assert (=> b!589134 (= res!376694 (or (= lt!267163 (MissingZero!6113 i!1108)) (= lt!267163 (MissingVacant!6113 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36800 (_ BitVec 32)) SeekEntryResult!6113)

(assert (=> b!589134 (= lt!267163 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589135 () Bool)

(declare-fun res!376690 () Bool)

(assert (=> b!589135 (=> (not res!376690) (not e!336363))))

(assert (=> b!589135 (= res!376690 (and (= (size!18037 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18037 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18037 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589136 () Bool)

(assert (=> b!589136 (= e!336360 e!336361)))

(declare-fun res!376687 () Bool)

(assert (=> b!589136 (=> (not res!376687) (not e!336361))))

(assert (=> b!589136 (= res!376687 (= (select (store (arr!17673 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589136 (= lt!267166 (array!36801 (store (arr!17673 a!2986) i!1108 k!1786) (size!18037 a!2986)))))

(assert (= (and start!53956 res!376686) b!589135))

(assert (= (and b!589135 res!376690) b!589133))

(assert (= (and b!589133 res!376693) b!589123))

(assert (= (and b!589123 res!376688) b!589129))

(assert (= (and b!589129 res!376691) b!589134))

(assert (= (and b!589134 res!376694) b!589125))

(assert (= (and b!589125 res!376684) b!589131))

(assert (= (and b!589131 res!376692) b!589126))

(assert (= (and b!589126 res!376689) b!589136))

(assert (= (and b!589136 res!376687) b!589128))

(assert (= (and b!589128 res!376683) b!589130))

(assert (= (and b!589130 res!376685) b!589124))

(assert (= (and b!589130 c!66587) b!589127))

(assert (= (and b!589130 (not c!66587)) b!589132))

(declare-fun m!567667 () Bool)

(assert (=> b!589125 m!567667))

(declare-fun m!567669 () Bool)

(assert (=> b!589136 m!567669))

(declare-fun m!567671 () Bool)

(assert (=> b!589136 m!567671))

(declare-fun m!567673 () Bool)

(assert (=> b!589129 m!567673))

(declare-fun m!567675 () Bool)

(assert (=> b!589130 m!567675))

(declare-fun m!567677 () Bool)

(assert (=> b!589130 m!567677))

(declare-fun m!567679 () Bool)

(assert (=> b!589130 m!567679))

(assert (=> b!589130 m!567669))

(assert (=> b!589130 m!567679))

(declare-fun m!567681 () Bool)

(assert (=> b!589130 m!567681))

(declare-fun m!567683 () Bool)

(assert (=> b!589130 m!567683))

(declare-fun m!567685 () Bool)

(assert (=> b!589130 m!567685))

(declare-fun m!567687 () Bool)

(assert (=> b!589130 m!567687))

(declare-fun m!567689 () Bool)

(assert (=> b!589131 m!567689))

(declare-fun m!567691 () Bool)

(assert (=> b!589134 m!567691))

(assert (=> b!589133 m!567679))

(assert (=> b!589133 m!567679))

(declare-fun m!567693 () Bool)

(assert (=> b!589133 m!567693))

(declare-fun m!567695 () Bool)

(assert (=> start!53956 m!567695))

(declare-fun m!567697 () Bool)

(assert (=> start!53956 m!567697))

(declare-fun m!567699 () Bool)

(assert (=> b!589126 m!567699))

(declare-fun m!567701 () Bool)

(assert (=> b!589128 m!567701))

(assert (=> b!589128 m!567679))

(assert (=> b!589128 m!567679))

(declare-fun m!567703 () Bool)

(assert (=> b!589128 m!567703))

(declare-fun m!567705 () Bool)

(assert (=> b!589123 m!567705))

(push 1)

