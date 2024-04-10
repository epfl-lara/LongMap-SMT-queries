; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53608 () Bool)

(assert start!53608)

(declare-fun b!583854 () Bool)

(declare-fun res!371678 () Bool)

(declare-fun e!334458 () Bool)

(assert (=> b!583854 (=> (not res!371678) (not e!334458))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36509 0))(
  ( (array!36510 (arr!17529 (Array (_ BitVec 32) (_ BitVec 64))) (size!17893 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36509)

(assert (=> b!583854 (= res!371678 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17529 a!2986) index!984) (select (arr!17529 a!2986) j!136))) (not (= (select (arr!17529 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583855 () Bool)

(declare-fun res!371675 () Bool)

(declare-fun e!334456 () Bool)

(assert (=> b!583855 (=> (not res!371675) (not e!334456))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583855 (= res!371675 (and (= (size!17893 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17893 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17893 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583856 () Bool)

(declare-fun res!371679 () Bool)

(assert (=> b!583856 (=> (not res!371679) (not e!334458))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5969 0))(
  ( (MissingZero!5969 (index!26103 (_ BitVec 32))) (Found!5969 (index!26104 (_ BitVec 32))) (Intermediate!5969 (undefined!6781 Bool) (index!26105 (_ BitVec 32)) (x!54942 (_ BitVec 32))) (Undefined!5969) (MissingVacant!5969 (index!26106 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36509 (_ BitVec 32)) SeekEntryResult!5969)

(assert (=> b!583856 (= res!371679 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17529 a!2986) j!136) a!2986 mask!3053) (Found!5969 j!136)))))

(declare-fun b!583857 () Bool)

(declare-fun e!334455 () Bool)

(assert (=> b!583857 (= e!334455 false)))

(declare-fun lt!265427 () (_ BitVec 32))

(declare-fun lt!265428 () SeekEntryResult!5969)

(assert (=> b!583857 (= lt!265428 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265427 vacantSpotIndex!68 (select (arr!17529 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583858 () Bool)

(declare-fun res!371676 () Bool)

(assert (=> b!583858 (=> (not res!371676) (not e!334458))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!583858 (= res!371676 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17529 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17529 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583859 () Bool)

(declare-fun res!371672 () Bool)

(assert (=> b!583859 (=> (not res!371672) (not e!334456))))

(declare-fun arrayContainsKey!0 (array!36509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583859 (= res!371672 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583860 () Bool)

(declare-fun res!371673 () Bool)

(assert (=> b!583860 (=> (not res!371673) (not e!334458))))

(declare-datatypes ((List!11570 0))(
  ( (Nil!11567) (Cons!11566 (h!12611 (_ BitVec 64)) (t!17798 List!11570)) )
))
(declare-fun arrayNoDuplicates!0 (array!36509 (_ BitVec 32) List!11570) Bool)

(assert (=> b!583860 (= res!371673 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11567))))

(declare-fun b!583861 () Bool)

(declare-fun res!371677 () Bool)

(assert (=> b!583861 (=> (not res!371677) (not e!334458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36509 (_ BitVec 32)) Bool)

(assert (=> b!583861 (= res!371677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583862 () Bool)

(declare-fun res!371681 () Bool)

(assert (=> b!583862 (=> (not res!371681) (not e!334456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583862 (= res!371681 (validKeyInArray!0 (select (arr!17529 a!2986) j!136)))))

(declare-fun res!371671 () Bool)

(assert (=> start!53608 (=> (not res!371671) (not e!334456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53608 (= res!371671 (validMask!0 mask!3053))))

(assert (=> start!53608 e!334456))

(assert (=> start!53608 true))

(declare-fun array_inv!13325 (array!36509) Bool)

(assert (=> start!53608 (array_inv!13325 a!2986)))

(declare-fun b!583863 () Bool)

(assert (=> b!583863 (= e!334456 e!334458)))

(declare-fun res!371674 () Bool)

(assert (=> b!583863 (=> (not res!371674) (not e!334458))))

(declare-fun lt!265429 () SeekEntryResult!5969)

(assert (=> b!583863 (= res!371674 (or (= lt!265429 (MissingZero!5969 i!1108)) (= lt!265429 (MissingVacant!5969 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36509 (_ BitVec 32)) SeekEntryResult!5969)

(assert (=> b!583863 (= lt!265429 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583864 () Bool)

(assert (=> b!583864 (= e!334458 e!334455)))

(declare-fun res!371670 () Bool)

(assert (=> b!583864 (=> (not res!371670) (not e!334455))))

(assert (=> b!583864 (= res!371670 (and (bvsge lt!265427 #b00000000000000000000000000000000) (bvslt lt!265427 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583864 (= lt!265427 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583865 () Bool)

(declare-fun res!371680 () Bool)

(assert (=> b!583865 (=> (not res!371680) (not e!334456))))

(assert (=> b!583865 (= res!371680 (validKeyInArray!0 k!1786))))

(assert (= (and start!53608 res!371671) b!583855))

(assert (= (and b!583855 res!371675) b!583862))

(assert (= (and b!583862 res!371681) b!583865))

(assert (= (and b!583865 res!371680) b!583859))

(assert (= (and b!583859 res!371672) b!583863))

(assert (= (and b!583863 res!371674) b!583861))

(assert (= (and b!583861 res!371677) b!583860))

(assert (= (and b!583860 res!371673) b!583858))

(assert (= (and b!583858 res!371676) b!583856))

(assert (= (and b!583856 res!371679) b!583854))

(assert (= (and b!583854 res!371678) b!583864))

(assert (= (and b!583864 res!371670) b!583857))

(declare-fun m!562273 () Bool)

(assert (=> b!583857 m!562273))

(assert (=> b!583857 m!562273))

(declare-fun m!562275 () Bool)

(assert (=> b!583857 m!562275))

(declare-fun m!562277 () Bool)

(assert (=> b!583861 m!562277))

(declare-fun m!562279 () Bool)

(assert (=> start!53608 m!562279))

(declare-fun m!562281 () Bool)

(assert (=> start!53608 m!562281))

(declare-fun m!562283 () Bool)

(assert (=> b!583854 m!562283))

(assert (=> b!583854 m!562273))

(declare-fun m!562285 () Bool)

(assert (=> b!583860 m!562285))

(assert (=> b!583862 m!562273))

(assert (=> b!583862 m!562273))

(declare-fun m!562287 () Bool)

(assert (=> b!583862 m!562287))

(declare-fun m!562289 () Bool)

(assert (=> b!583858 m!562289))

(declare-fun m!562291 () Bool)

(assert (=> b!583858 m!562291))

(declare-fun m!562293 () Bool)

(assert (=> b!583858 m!562293))

(declare-fun m!562295 () Bool)

(assert (=> b!583859 m!562295))

(assert (=> b!583856 m!562273))

(assert (=> b!583856 m!562273))

(declare-fun m!562297 () Bool)

(assert (=> b!583856 m!562297))

(declare-fun m!562299 () Bool)

(assert (=> b!583865 m!562299))

(declare-fun m!562301 () Bool)

(assert (=> b!583864 m!562301))

(declare-fun m!562303 () Bool)

(assert (=> b!583863 m!562303))

(push 1)

