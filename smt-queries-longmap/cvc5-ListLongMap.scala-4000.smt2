; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54256 () Bool)

(assert start!54256)

(declare-fun b!592829 () Bool)

(declare-fun res!379469 () Bool)

(declare-fun e!338579 () Bool)

(assert (=> b!592829 (=> (not res!379469) (not e!338579))))

(declare-datatypes ((array!36923 0))(
  ( (array!36924 (arr!17730 (Array (_ BitVec 32) (_ BitVec 64))) (size!18094 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36923)

(declare-datatypes ((List!11771 0))(
  ( (Nil!11768) (Cons!11767 (h!12812 (_ BitVec 64)) (t!17999 List!11771)) )
))
(declare-fun arrayNoDuplicates!0 (array!36923 (_ BitVec 32) List!11771) Bool)

(assert (=> b!592829 (= res!379469 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11768))))

(declare-fun b!592830 () Bool)

(declare-fun res!379459 () Bool)

(assert (=> b!592830 (=> (not res!379459) (not e!338579))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592830 (= res!379459 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17730 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592831 () Bool)

(declare-fun e!338576 () Bool)

(declare-fun e!338578 () Bool)

(assert (=> b!592831 (= e!338576 (not e!338578))))

(declare-fun res!379455 () Bool)

(assert (=> b!592831 (=> res!379455 e!338578)))

(declare-datatypes ((SeekEntryResult!6170 0))(
  ( (MissingZero!6170 (index!26919 (_ BitVec 32))) (Found!6170 (index!26920 (_ BitVec 32))) (Intermediate!6170 (undefined!6982 Bool) (index!26921 (_ BitVec 32)) (x!55715 (_ BitVec 32))) (Undefined!6170) (MissingVacant!6170 (index!26922 (_ BitVec 32))) )
))
(declare-fun lt!269114 () SeekEntryResult!6170)

(assert (=> b!592831 (= res!379455 (not (= lt!269114 (Found!6170 index!984))))))

(declare-datatypes ((Unit!18598 0))(
  ( (Unit!18599) )
))
(declare-fun lt!269111 () Unit!18598)

(declare-fun e!338581 () Unit!18598)

(assert (=> b!592831 (= lt!269111 e!338581)))

(declare-fun c!67055 () Bool)

(assert (=> b!592831 (= c!67055 (= lt!269114 Undefined!6170))))

(declare-fun lt!269117 () (_ BitVec 64))

(declare-fun lt!269113 () array!36923)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36923 (_ BitVec 32)) SeekEntryResult!6170)

(assert (=> b!592831 (= lt!269114 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269117 lt!269113 mask!3053))))

(declare-fun e!338574 () Bool)

(assert (=> b!592831 e!338574))

(declare-fun res!379468 () Bool)

(assert (=> b!592831 (=> (not res!379468) (not e!338574))))

(declare-fun lt!269116 () (_ BitVec 32))

(declare-fun lt!269109 () SeekEntryResult!6170)

(assert (=> b!592831 (= res!379468 (= lt!269109 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269116 vacantSpotIndex!68 lt!269117 lt!269113 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!592831 (= lt!269109 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269116 vacantSpotIndex!68 (select (arr!17730 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!592831 (= lt!269117 (select (store (arr!17730 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269119 () Unit!18598)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18598)

(assert (=> b!592831 (= lt!269119 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269116 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592831 (= lt!269116 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592832 () Bool)

(declare-fun res!379453 () Bool)

(assert (=> b!592832 (=> (not res!379453) (not e!338579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36923 (_ BitVec 32)) Bool)

(assert (=> b!592832 (= res!379453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592833 () Bool)

(declare-fun e!338583 () Bool)

(assert (=> b!592833 (= e!338578 e!338583)))

(declare-fun res!379461 () Bool)

(assert (=> b!592833 (=> res!379461 e!338583)))

(declare-fun lt!269118 () (_ BitVec 64))

(assert (=> b!592833 (= res!379461 (or (not (= (select (arr!17730 a!2986) j!136) lt!269117)) (not (= (select (arr!17730 a!2986) j!136) lt!269118)) (bvsge j!136 index!984)))))

(declare-fun e!338573 () Bool)

(assert (=> b!592833 e!338573))

(declare-fun res!379458 () Bool)

(assert (=> b!592833 (=> (not res!379458) (not e!338573))))

(assert (=> b!592833 (= res!379458 (= lt!269118 (select (arr!17730 a!2986) j!136)))))

(assert (=> b!592833 (= lt!269118 (select (store (arr!17730 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592834 () Bool)

(declare-fun e!338575 () Bool)

(declare-fun e!338572 () Bool)

(assert (=> b!592834 (= e!338575 e!338572)))

(declare-fun res!379460 () Bool)

(assert (=> b!592834 (=> (not res!379460) (not e!338572))))

(declare-fun arrayContainsKey!0 (array!36923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592834 (= res!379460 (arrayContainsKey!0 lt!269113 (select (arr!17730 a!2986) j!136) j!136))))

(declare-fun res!379456 () Bool)

(declare-fun e!338577 () Bool)

(assert (=> start!54256 (=> (not res!379456) (not e!338577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54256 (= res!379456 (validMask!0 mask!3053))))

(assert (=> start!54256 e!338577))

(assert (=> start!54256 true))

(declare-fun array_inv!13526 (array!36923) Bool)

(assert (=> start!54256 (array_inv!13526 a!2986)))

(declare-fun b!592835 () Bool)

(declare-fun e!338582 () Bool)

(assert (=> b!592835 (= e!338579 e!338582)))

(declare-fun res!379454 () Bool)

(assert (=> b!592835 (=> (not res!379454) (not e!338582))))

(assert (=> b!592835 (= res!379454 (= (select (store (arr!17730 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592835 (= lt!269113 (array!36924 (store (arr!17730 a!2986) i!1108 k!1786) (size!18094 a!2986)))))

(declare-fun b!592836 () Bool)

(declare-fun res!379462 () Bool)

(assert (=> b!592836 (=> (not res!379462) (not e!338577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592836 (= res!379462 (validKeyInArray!0 (select (arr!17730 a!2986) j!136)))))

(declare-fun b!592837 () Bool)

(declare-fun lt!269115 () SeekEntryResult!6170)

(assert (=> b!592837 (= e!338574 (= lt!269115 lt!269109))))

(declare-fun b!592838 () Bool)

(declare-fun Unit!18600 () Unit!18598)

(assert (=> b!592838 (= e!338581 Unit!18600)))

(assert (=> b!592838 false))

(declare-fun b!592839 () Bool)

(assert (=> b!592839 (= e!338583 (bvsle #b00000000000000000000000000000000 (size!18094 a!2986)))))

(assert (=> b!592839 (arrayContainsKey!0 lt!269113 (select (arr!17730 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269112 () Unit!18598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36923 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18598)

(assert (=> b!592839 (= lt!269112 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269113 (select (arr!17730 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592840 () Bool)

(declare-fun res!379466 () Bool)

(assert (=> b!592840 (=> (not res!379466) (not e!338577))))

(assert (=> b!592840 (= res!379466 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592841 () Bool)

(assert (=> b!592841 (= e!338577 e!338579)))

(declare-fun res!379467 () Bool)

(assert (=> b!592841 (=> (not res!379467) (not e!338579))))

(declare-fun lt!269110 () SeekEntryResult!6170)

(assert (=> b!592841 (= res!379467 (or (= lt!269110 (MissingZero!6170 i!1108)) (= lt!269110 (MissingVacant!6170 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36923 (_ BitVec 32)) SeekEntryResult!6170)

(assert (=> b!592841 (= lt!269110 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!592842 () Bool)

(assert (=> b!592842 (= e!338573 e!338575)))

(declare-fun res!379465 () Bool)

(assert (=> b!592842 (=> res!379465 e!338575)))

(assert (=> b!592842 (= res!379465 (or (not (= (select (arr!17730 a!2986) j!136) lt!269117)) (not (= (select (arr!17730 a!2986) j!136) lt!269118)) (bvsge j!136 index!984)))))

(declare-fun b!592843 () Bool)

(assert (=> b!592843 (= e!338572 (arrayContainsKey!0 lt!269113 (select (arr!17730 a!2986) j!136) index!984))))

(declare-fun b!592844 () Bool)

(declare-fun res!379457 () Bool)

(assert (=> b!592844 (=> (not res!379457) (not e!338577))))

(assert (=> b!592844 (= res!379457 (and (= (size!18094 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18094 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18094 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592845 () Bool)

(assert (=> b!592845 (= e!338582 e!338576)))

(declare-fun res!379463 () Bool)

(assert (=> b!592845 (=> (not res!379463) (not e!338576))))

(assert (=> b!592845 (= res!379463 (and (= lt!269115 (Found!6170 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17730 a!2986) index!984) (select (arr!17730 a!2986) j!136))) (not (= (select (arr!17730 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592845 (= lt!269115 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17730 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592846 () Bool)

(declare-fun Unit!18601 () Unit!18598)

(assert (=> b!592846 (= e!338581 Unit!18601)))

(declare-fun b!592847 () Bool)

(declare-fun res!379464 () Bool)

(assert (=> b!592847 (=> (not res!379464) (not e!338577))))

(assert (=> b!592847 (= res!379464 (validKeyInArray!0 k!1786))))

(assert (= (and start!54256 res!379456) b!592844))

(assert (= (and b!592844 res!379457) b!592836))

(assert (= (and b!592836 res!379462) b!592847))

(assert (= (and b!592847 res!379464) b!592840))

(assert (= (and b!592840 res!379466) b!592841))

(assert (= (and b!592841 res!379467) b!592832))

(assert (= (and b!592832 res!379453) b!592829))

(assert (= (and b!592829 res!379469) b!592830))

(assert (= (and b!592830 res!379459) b!592835))

(assert (= (and b!592835 res!379454) b!592845))

(assert (= (and b!592845 res!379463) b!592831))

(assert (= (and b!592831 res!379468) b!592837))

(assert (= (and b!592831 c!67055) b!592838))

(assert (= (and b!592831 (not c!67055)) b!592846))

(assert (= (and b!592831 (not res!379455)) b!592833))

(assert (= (and b!592833 res!379458) b!592842))

(assert (= (and b!592842 (not res!379465)) b!592834))

(assert (= (and b!592834 res!379460) b!592843))

(assert (= (and b!592833 (not res!379461)) b!592839))

(declare-fun m!570883 () Bool)

(assert (=> b!592834 m!570883))

(assert (=> b!592834 m!570883))

(declare-fun m!570885 () Bool)

(assert (=> b!592834 m!570885))

(declare-fun m!570887 () Bool)

(assert (=> b!592829 m!570887))

(assert (=> b!592833 m!570883))

(declare-fun m!570889 () Bool)

(assert (=> b!592833 m!570889))

(declare-fun m!570891 () Bool)

(assert (=> b!592833 m!570891))

(declare-fun m!570893 () Bool)

(assert (=> b!592845 m!570893))

(assert (=> b!592845 m!570883))

(assert (=> b!592845 m!570883))

(declare-fun m!570895 () Bool)

(assert (=> b!592845 m!570895))

(declare-fun m!570897 () Bool)

(assert (=> b!592841 m!570897))

(assert (=> b!592842 m!570883))

(assert (=> b!592843 m!570883))

(assert (=> b!592843 m!570883))

(declare-fun m!570899 () Bool)

(assert (=> b!592843 m!570899))

(declare-fun m!570901 () Bool)

(assert (=> b!592847 m!570901))

(assert (=> b!592836 m!570883))

(assert (=> b!592836 m!570883))

(declare-fun m!570903 () Bool)

(assert (=> b!592836 m!570903))

(declare-fun m!570905 () Bool)

(assert (=> b!592840 m!570905))

(assert (=> b!592831 m!570883))

(declare-fun m!570907 () Bool)

(assert (=> b!592831 m!570907))

(declare-fun m!570909 () Bool)

(assert (=> b!592831 m!570909))

(declare-fun m!570911 () Bool)

(assert (=> b!592831 m!570911))

(assert (=> b!592831 m!570883))

(assert (=> b!592831 m!570889))

(declare-fun m!570913 () Bool)

(assert (=> b!592831 m!570913))

(declare-fun m!570915 () Bool)

(assert (=> b!592831 m!570915))

(declare-fun m!570917 () Bool)

(assert (=> b!592831 m!570917))

(declare-fun m!570919 () Bool)

(assert (=> b!592830 m!570919))

(assert (=> b!592835 m!570889))

(declare-fun m!570921 () Bool)

(assert (=> b!592835 m!570921))

(declare-fun m!570923 () Bool)

(assert (=> start!54256 m!570923))

(declare-fun m!570925 () Bool)

(assert (=> start!54256 m!570925))

(declare-fun m!570927 () Bool)

(assert (=> b!592832 m!570927))

(assert (=> b!592839 m!570883))

(assert (=> b!592839 m!570883))

(declare-fun m!570929 () Bool)

(assert (=> b!592839 m!570929))

(assert (=> b!592839 m!570883))

(declare-fun m!570931 () Bool)

(assert (=> b!592839 m!570931))

(push 1)

