; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57000 () Bool)

(assert start!57000)

(declare-fun b!630949 () Bool)

(declare-fun e!360765 () Bool)

(declare-fun e!360770 () Bool)

(assert (=> b!630949 (= e!360765 e!360770)))

(declare-fun res!407913 () Bool)

(assert (=> b!630949 (=> (not res!407913) (not e!360770))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38076 0))(
  ( (array!38077 (arr!18272 (Array (_ BitVec 32) (_ BitVec 64))) (size!18636 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38076)

(assert (=> b!630949 (= res!407913 (= (select (store (arr!18272 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291449 () array!38076)

(assert (=> b!630949 (= lt!291449 (array!38077 (store (arr!18272 a!2986) i!1108 k!1786) (size!18636 a!2986)))))

(declare-fun b!630950 () Bool)

(declare-fun res!407915 () Bool)

(assert (=> b!630950 (=> (not res!407915) (not e!360765))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630950 (= res!407915 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18272 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630951 () Bool)

(declare-fun res!407922 () Bool)

(declare-fun e!360767 () Bool)

(assert (=> b!630951 (=> (not res!407922) (not e!360767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630951 (= res!407922 (validKeyInArray!0 k!1786))))

(declare-fun b!630953 () Bool)

(declare-fun res!407923 () Bool)

(assert (=> b!630953 (=> (not res!407923) (not e!360765))))

(declare-datatypes ((List!12313 0))(
  ( (Nil!12310) (Cons!12309 (h!13354 (_ BitVec 64)) (t!18541 List!12313)) )
))
(declare-fun arrayNoDuplicates!0 (array!38076 (_ BitVec 32) List!12313) Bool)

(assert (=> b!630953 (= res!407923 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12310))))

(declare-fun b!630954 () Bool)

(assert (=> b!630954 (= e!360767 e!360765)))

(declare-fun res!407924 () Bool)

(assert (=> b!630954 (=> (not res!407924) (not e!360765))))

(declare-datatypes ((SeekEntryResult!6712 0))(
  ( (MissingZero!6712 (index!29138 (_ BitVec 32))) (Found!6712 (index!29139 (_ BitVec 32))) (Intermediate!6712 (undefined!7524 Bool) (index!29140 (_ BitVec 32)) (x!57874 (_ BitVec 32))) (Undefined!6712) (MissingVacant!6712 (index!29141 (_ BitVec 32))) )
))
(declare-fun lt!291452 () SeekEntryResult!6712)

(assert (=> b!630954 (= res!407924 (or (= lt!291452 (MissingZero!6712 i!1108)) (= lt!291452 (MissingVacant!6712 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38076 (_ BitVec 32)) SeekEntryResult!6712)

(assert (=> b!630954 (= lt!291452 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630955 () Bool)

(declare-fun res!407919 () Bool)

(assert (=> b!630955 (=> (not res!407919) (not e!360767))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!630955 (= res!407919 (and (= (size!18636 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18636 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18636 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630956 () Bool)

(declare-fun res!407917 () Bool)

(assert (=> b!630956 (=> (not res!407917) (not e!360767))))

(assert (=> b!630956 (= res!407917 (validKeyInArray!0 (select (arr!18272 a!2986) j!136)))))

(declare-fun b!630957 () Bool)

(declare-fun e!360771 () Bool)

(assert (=> b!630957 (= e!360770 e!360771)))

(declare-fun res!407920 () Bool)

(assert (=> b!630957 (=> (not res!407920) (not e!360771))))

(declare-fun lt!291454 () SeekEntryResult!6712)

(assert (=> b!630957 (= res!407920 (and (= lt!291454 (Found!6712 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18272 a!2986) index!984) (select (arr!18272 a!2986) j!136))) (not (= (select (arr!18272 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38076 (_ BitVec 32)) SeekEntryResult!6712)

(assert (=> b!630957 (= lt!291454 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18272 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630958 () Bool)

(assert (=> b!630958 (= e!360771 (not true))))

(declare-datatypes ((Unit!21182 0))(
  ( (Unit!21183) )
))
(declare-fun lt!291448 () Unit!21182)

(declare-fun e!360769 () Unit!21182)

(assert (=> b!630958 (= lt!291448 e!360769)))

(declare-fun lt!291451 () (_ BitVec 64))

(declare-fun c!71885 () Bool)

(assert (=> b!630958 (= c!71885 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291451 lt!291449 mask!3053) Undefined!6712))))

(declare-fun e!360766 () Bool)

(assert (=> b!630958 e!360766))

(declare-fun res!407914 () Bool)

(assert (=> b!630958 (=> (not res!407914) (not e!360766))))

(declare-fun lt!291453 () (_ BitVec 32))

(declare-fun lt!291447 () SeekEntryResult!6712)

(assert (=> b!630958 (= res!407914 (= lt!291447 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291453 vacantSpotIndex!68 lt!291451 lt!291449 mask!3053)))))

(assert (=> b!630958 (= lt!291447 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291453 vacantSpotIndex!68 (select (arr!18272 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630958 (= lt!291451 (select (store (arr!18272 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291450 () Unit!21182)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38076 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21182)

(assert (=> b!630958 (= lt!291450 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291453 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630958 (= lt!291453 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630959 () Bool)

(assert (=> b!630959 (= e!360766 (= lt!291454 lt!291447))))

(declare-fun b!630960 () Bool)

(declare-fun Unit!21184 () Unit!21182)

(assert (=> b!630960 (= e!360769 Unit!21184)))

(assert (=> b!630960 false))

(declare-fun b!630961 () Bool)

(declare-fun res!407921 () Bool)

(assert (=> b!630961 (=> (not res!407921) (not e!360767))))

(declare-fun arrayContainsKey!0 (array!38076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630961 (= res!407921 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630962 () Bool)

(declare-fun Unit!21185 () Unit!21182)

(assert (=> b!630962 (= e!360769 Unit!21185)))

(declare-fun b!630952 () Bool)

(declare-fun res!407916 () Bool)

(assert (=> b!630952 (=> (not res!407916) (not e!360765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38076 (_ BitVec 32)) Bool)

(assert (=> b!630952 (= res!407916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!407918 () Bool)

(assert (=> start!57000 (=> (not res!407918) (not e!360767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57000 (= res!407918 (validMask!0 mask!3053))))

(assert (=> start!57000 e!360767))

(assert (=> start!57000 true))

(declare-fun array_inv!14068 (array!38076) Bool)

(assert (=> start!57000 (array_inv!14068 a!2986)))

(assert (= (and start!57000 res!407918) b!630955))

(assert (= (and b!630955 res!407919) b!630956))

(assert (= (and b!630956 res!407917) b!630951))

(assert (= (and b!630951 res!407922) b!630961))

(assert (= (and b!630961 res!407921) b!630954))

(assert (= (and b!630954 res!407924) b!630952))

(assert (= (and b!630952 res!407916) b!630953))

(assert (= (and b!630953 res!407923) b!630950))

(assert (= (and b!630950 res!407915) b!630949))

(assert (= (and b!630949 res!407913) b!630957))

(assert (= (and b!630957 res!407920) b!630958))

(assert (= (and b!630958 res!407914) b!630959))

(assert (= (and b!630958 c!71885) b!630960))

(assert (= (and b!630958 (not c!71885)) b!630962))

(declare-fun m!605903 () Bool)

(assert (=> b!630954 m!605903))

(declare-fun m!605905 () Bool)

(assert (=> b!630950 m!605905))

(declare-fun m!605907 () Bool)

(assert (=> b!630951 m!605907))

(declare-fun m!605909 () Bool)

(assert (=> b!630957 m!605909))

(declare-fun m!605911 () Bool)

(assert (=> b!630957 m!605911))

(assert (=> b!630957 m!605911))

(declare-fun m!605913 () Bool)

(assert (=> b!630957 m!605913))

(declare-fun m!605915 () Bool)

(assert (=> b!630958 m!605915))

(declare-fun m!605917 () Bool)

(assert (=> b!630958 m!605917))

(assert (=> b!630958 m!605911))

(declare-fun m!605919 () Bool)

(assert (=> b!630958 m!605919))

(assert (=> b!630958 m!605911))

(declare-fun m!605921 () Bool)

(assert (=> b!630958 m!605921))

(declare-fun m!605923 () Bool)

(assert (=> b!630958 m!605923))

(declare-fun m!605925 () Bool)

(assert (=> b!630958 m!605925))

(declare-fun m!605927 () Bool)

(assert (=> b!630958 m!605927))

(declare-fun m!605929 () Bool)

(assert (=> b!630961 m!605929))

(declare-fun m!605931 () Bool)

(assert (=> b!630952 m!605931))

(assert (=> b!630956 m!605911))

(assert (=> b!630956 m!605911))

(declare-fun m!605933 () Bool)

(assert (=> b!630956 m!605933))

(declare-fun m!605935 () Bool)

(assert (=> start!57000 m!605935))

(declare-fun m!605937 () Bool)

(assert (=> start!57000 m!605937))

(declare-fun m!605939 () Bool)

(assert (=> b!630953 m!605939))

(assert (=> b!630949 m!605919))

(declare-fun m!605941 () Bool)

(assert (=> b!630949 m!605941))

(push 1)

