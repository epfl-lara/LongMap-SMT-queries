; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53882 () Bool)

(assert start!53882)

(declare-fun b!587779 () Bool)

(declare-fun res!375423 () Bool)

(declare-fun e!335723 () Bool)

(assert (=> b!587779 (=> (not res!375423) (not e!335723))))

(declare-datatypes ((array!36726 0))(
  ( (array!36727 (arr!17636 (Array (_ BitVec 32) (_ BitVec 64))) (size!18000 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36726)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587779 (= res!375423 (validKeyInArray!0 (select (arr!17636 a!2986) j!136)))))

(declare-fun b!587780 () Bool)

(declare-fun res!375422 () Bool)

(declare-fun e!335722 () Bool)

(assert (=> b!587780 (=> (not res!375422) (not e!335722))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587780 (= res!375422 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17636 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17636 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587781 () Bool)

(declare-fun res!375420 () Bool)

(assert (=> b!587781 (=> (not res!375420) (not e!335723))))

(declare-fun arrayContainsKey!0 (array!36726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587781 (= res!375420 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587782 () Bool)

(declare-fun res!375415 () Bool)

(assert (=> b!587782 (=> (not res!375415) (not e!335723))))

(assert (=> b!587782 (= res!375415 (validKeyInArray!0 k!1786))))

(declare-fun b!587783 () Bool)

(declare-fun res!375419 () Bool)

(assert (=> b!587783 (=> (not res!375419) (not e!335722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36726 (_ BitVec 32)) Bool)

(assert (=> b!587783 (= res!375419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!375424 () Bool)

(assert (=> start!53882 (=> (not res!375424) (not e!335723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53882 (= res!375424 (validMask!0 mask!3053))))

(assert (=> start!53882 e!335723))

(assert (=> start!53882 true))

(declare-fun array_inv!13432 (array!36726) Bool)

(assert (=> start!53882 (array_inv!13432 a!2986)))

(declare-fun b!587784 () Bool)

(assert (=> b!587784 (= e!335722 (not true))))

(declare-fun lt!266494 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6076 0))(
  ( (MissingZero!6076 (index!26534 (_ BitVec 32))) (Found!6076 (index!26535 (_ BitVec 32))) (Intermediate!6076 (undefined!6888 Bool) (index!26536 (_ BitVec 32)) (x!55338 (_ BitVec 32))) (Undefined!6076) (MissingVacant!6076 (index!26537 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36726 (_ BitVec 32)) SeekEntryResult!6076)

(assert (=> b!587784 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266494 vacantSpotIndex!68 (select (arr!17636 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266494 vacantSpotIndex!68 (select (store (arr!17636 a!2986) i!1108 k!1786) j!136) (array!36727 (store (arr!17636 a!2986) i!1108 k!1786) (size!18000 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18272 0))(
  ( (Unit!18273) )
))
(declare-fun lt!266492 () Unit!18272)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36726 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18272)

(assert (=> b!587784 (= lt!266492 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266494 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587784 (= lt!266494 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587785 () Bool)

(declare-fun res!375417 () Bool)

(assert (=> b!587785 (=> (not res!375417) (not e!335722))))

(assert (=> b!587785 (= res!375417 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17636 a!2986) j!136) a!2986 mask!3053) (Found!6076 j!136)))))

(declare-fun b!587786 () Bool)

(declare-fun res!375416 () Bool)

(assert (=> b!587786 (=> (not res!375416) (not e!335723))))

(assert (=> b!587786 (= res!375416 (and (= (size!18000 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18000 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18000 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587787 () Bool)

(assert (=> b!587787 (= e!335723 e!335722)))

(declare-fun res!375425 () Bool)

(assert (=> b!587787 (=> (not res!375425) (not e!335722))))

(declare-fun lt!266493 () SeekEntryResult!6076)

(assert (=> b!587787 (= res!375425 (or (= lt!266493 (MissingZero!6076 i!1108)) (= lt!266493 (MissingVacant!6076 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36726 (_ BitVec 32)) SeekEntryResult!6076)

(assert (=> b!587787 (= lt!266493 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587788 () Bool)

(declare-fun res!375418 () Bool)

(assert (=> b!587788 (=> (not res!375418) (not e!335722))))

(declare-datatypes ((List!11677 0))(
  ( (Nil!11674) (Cons!11673 (h!12718 (_ BitVec 64)) (t!17905 List!11677)) )
))
(declare-fun arrayNoDuplicates!0 (array!36726 (_ BitVec 32) List!11677) Bool)

(assert (=> b!587788 (= res!375418 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11674))))

(declare-fun b!587789 () Bool)

(declare-fun res!375421 () Bool)

(assert (=> b!587789 (=> (not res!375421) (not e!335722))))

(assert (=> b!587789 (= res!375421 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17636 a!2986) index!984) (select (arr!17636 a!2986) j!136))) (not (= (select (arr!17636 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53882 res!375424) b!587786))

(assert (= (and b!587786 res!375416) b!587779))

(assert (= (and b!587779 res!375423) b!587782))

(assert (= (and b!587782 res!375415) b!587781))

(assert (= (and b!587781 res!375420) b!587787))

(assert (= (and b!587787 res!375425) b!587783))

(assert (= (and b!587783 res!375419) b!587788))

(assert (= (and b!587788 res!375418) b!587780))

(assert (= (and b!587780 res!375422) b!587785))

(assert (= (and b!587785 res!375417) b!587789))

(assert (= (and b!587789 res!375421) b!587784))

(declare-fun m!566231 () Bool)

(assert (=> b!587785 m!566231))

(assert (=> b!587785 m!566231))

(declare-fun m!566233 () Bool)

(assert (=> b!587785 m!566233))

(declare-fun m!566235 () Bool)

(assert (=> start!53882 m!566235))

(declare-fun m!566237 () Bool)

(assert (=> start!53882 m!566237))

(declare-fun m!566239 () Bool)

(assert (=> b!587782 m!566239))

(declare-fun m!566241 () Bool)

(assert (=> b!587780 m!566241))

(declare-fun m!566243 () Bool)

(assert (=> b!587780 m!566243))

(declare-fun m!566245 () Bool)

(assert (=> b!587780 m!566245))

(declare-fun m!566247 () Bool)

(assert (=> b!587788 m!566247))

(declare-fun m!566249 () Bool)

(assert (=> b!587783 m!566249))

(declare-fun m!566251 () Bool)

(assert (=> b!587784 m!566251))

(declare-fun m!566253 () Bool)

(assert (=> b!587784 m!566253))

(declare-fun m!566255 () Bool)

(assert (=> b!587784 m!566255))

(assert (=> b!587784 m!566231))

(assert (=> b!587784 m!566243))

(assert (=> b!587784 m!566253))

(declare-fun m!566257 () Bool)

(assert (=> b!587784 m!566257))

(assert (=> b!587784 m!566231))

(declare-fun m!566259 () Bool)

(assert (=> b!587784 m!566259))

(declare-fun m!566261 () Bool)

(assert (=> b!587789 m!566261))

(assert (=> b!587789 m!566231))

(declare-fun m!566263 () Bool)

(assert (=> b!587787 m!566263))

(assert (=> b!587779 m!566231))

(assert (=> b!587779 m!566231))

(declare-fun m!566265 () Bool)

(assert (=> b!587779 m!566265))

(declare-fun m!566267 () Bool)

(assert (=> b!587781 m!566267))

(push 1)

(assert (not b!587783))

(assert (not b!587788))

(assert (not b!587787))

(assert (not b!587785))

(assert (not b!587782))

