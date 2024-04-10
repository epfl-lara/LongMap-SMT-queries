; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56900 () Bool)

(assert start!56900)

(declare-fun b!629932 () Bool)

(declare-fun res!407150 () Bool)

(declare-fun e!360235 () Bool)

(assert (=> b!629932 (=> (not res!407150) (not e!360235))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38033 0))(
  ( (array!38034 (arr!18252 (Array (_ BitVec 32) (_ BitVec 64))) (size!18616 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38033)

(assert (=> b!629932 (= res!407150 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18252 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18252 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629933 () Bool)

(declare-fun res!407148 () Bool)

(declare-fun e!360234 () Bool)

(assert (=> b!629933 (=> (not res!407148) (not e!360234))))

(declare-fun arrayContainsKey!0 (array!38033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629933 (= res!407148 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629934 () Bool)

(assert (=> b!629934 (= e!360234 e!360235)))

(declare-fun res!407155 () Bool)

(assert (=> b!629934 (=> (not res!407155) (not e!360235))))

(declare-datatypes ((SeekEntryResult!6692 0))(
  ( (MissingZero!6692 (index!29055 (_ BitVec 32))) (Found!6692 (index!29056 (_ BitVec 32))) (Intermediate!6692 (undefined!7504 Bool) (index!29057 (_ BitVec 32)) (x!57797 (_ BitVec 32))) (Undefined!6692) (MissingVacant!6692 (index!29058 (_ BitVec 32))) )
))
(declare-fun lt!290947 () SeekEntryResult!6692)

(assert (=> b!629934 (= res!407155 (or (= lt!290947 (MissingZero!6692 i!1108)) (= lt!290947 (MissingVacant!6692 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38033 (_ BitVec 32)) SeekEntryResult!6692)

(assert (=> b!629934 (= lt!290947 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629935 () Bool)

(declare-fun res!407154 () Bool)

(assert (=> b!629935 (=> (not res!407154) (not e!360235))))

(declare-datatypes ((List!12293 0))(
  ( (Nil!12290) (Cons!12289 (h!13334 (_ BitVec 64)) (t!18521 List!12293)) )
))
(declare-fun arrayNoDuplicates!0 (array!38033 (_ BitVec 32) List!12293) Bool)

(assert (=> b!629935 (= res!407154 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12290))))

(declare-fun b!629936 () Bool)

(declare-fun res!407156 () Bool)

(assert (=> b!629936 (=> (not res!407156) (not e!360235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38033 (_ BitVec 32)) Bool)

(assert (=> b!629936 (= res!407156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!407149 () Bool)

(assert (=> start!56900 (=> (not res!407149) (not e!360234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56900 (= res!407149 (validMask!0 mask!3053))))

(assert (=> start!56900 e!360234))

(assert (=> start!56900 true))

(declare-fun array_inv!14048 (array!38033) Bool)

(assert (=> start!56900 (array_inv!14048 a!2986)))

(declare-fun b!629937 () Bool)

(declare-fun res!407146 () Bool)

(assert (=> b!629937 (=> (not res!407146) (not e!360234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629937 (= res!407146 (validKeyInArray!0 k!1786))))

(declare-fun b!629938 () Bool)

(declare-fun res!407151 () Bool)

(assert (=> b!629938 (=> (not res!407151) (not e!360234))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!629938 (= res!407151 (and (= (size!18616 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18616 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18616 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629939 () Bool)

(declare-fun res!407153 () Bool)

(assert (=> b!629939 (=> (not res!407153) (not e!360234))))

(assert (=> b!629939 (= res!407153 (validKeyInArray!0 (select (arr!18252 a!2986) j!136)))))

(declare-fun b!629940 () Bool)

(declare-fun e!360237 () Bool)

(assert (=> b!629940 (= e!360235 e!360237)))

(declare-fun res!407152 () Bool)

(assert (=> b!629940 (=> (not res!407152) (not e!360237))))

(declare-fun lt!290945 () SeekEntryResult!6692)

(assert (=> b!629940 (= res!407152 (and (= lt!290945 (Found!6692 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18252 a!2986) index!984) (select (arr!18252 a!2986) j!136))) (not (= (select (arr!18252 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38033 (_ BitVec 32)) SeekEntryResult!6692)

(assert (=> b!629940 (= lt!290945 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18252 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629941 () Bool)

(declare-fun e!360236 () Bool)

(declare-fun lt!290943 () SeekEntryResult!6692)

(assert (=> b!629941 (= e!360236 (= lt!290945 lt!290943))))

(declare-fun b!629942 () Bool)

(assert (=> b!629942 (= e!360237 (not true))))

(assert (=> b!629942 e!360236))

(declare-fun res!407147 () Bool)

(assert (=> b!629942 (=> (not res!407147) (not e!360236))))

(declare-fun lt!290944 () (_ BitVec 32))

(assert (=> b!629942 (= res!407147 (= lt!290943 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290944 vacantSpotIndex!68 (select (store (arr!18252 a!2986) i!1108 k!1786) j!136) (array!38034 (store (arr!18252 a!2986) i!1108 k!1786) (size!18616 a!2986)) mask!3053)))))

(assert (=> b!629942 (= lt!290943 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290944 vacantSpotIndex!68 (select (arr!18252 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21126 0))(
  ( (Unit!21127) )
))
(declare-fun lt!290946 () Unit!21126)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21126)

(assert (=> b!629942 (= lt!290946 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290944 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629942 (= lt!290944 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56900 res!407149) b!629938))

(assert (= (and b!629938 res!407151) b!629939))

(assert (= (and b!629939 res!407153) b!629937))

(assert (= (and b!629937 res!407146) b!629933))

(assert (= (and b!629933 res!407148) b!629934))

(assert (= (and b!629934 res!407155) b!629936))

(assert (= (and b!629936 res!407156) b!629935))

(assert (= (and b!629935 res!407154) b!629932))

(assert (= (and b!629932 res!407150) b!629940))

(assert (= (and b!629940 res!407152) b!629942))

(assert (= (and b!629942 res!407147) b!629941))

(declare-fun m!604911 () Bool)

(assert (=> b!629932 m!604911))

(declare-fun m!604913 () Bool)

(assert (=> b!629932 m!604913))

(declare-fun m!604915 () Bool)

(assert (=> b!629932 m!604915))

(declare-fun m!604917 () Bool)

(assert (=> start!56900 m!604917))

(declare-fun m!604919 () Bool)

(assert (=> start!56900 m!604919))

(declare-fun m!604921 () Bool)

(assert (=> b!629933 m!604921))

(declare-fun m!604923 () Bool)

(assert (=> b!629934 m!604923))

(declare-fun m!604925 () Bool)

(assert (=> b!629940 m!604925))

(declare-fun m!604927 () Bool)

(assert (=> b!629940 m!604927))

(assert (=> b!629940 m!604927))

(declare-fun m!604929 () Bool)

(assert (=> b!629940 m!604929))

(assert (=> b!629939 m!604927))

(assert (=> b!629939 m!604927))

(declare-fun m!604931 () Bool)

(assert (=> b!629939 m!604931))

(declare-fun m!604933 () Bool)

(assert (=> b!629935 m!604933))

(declare-fun m!604935 () Bool)

(assert (=> b!629942 m!604935))

(declare-fun m!604937 () Bool)

(assert (=> b!629942 m!604937))

(declare-fun m!604939 () Bool)

(assert (=> b!629942 m!604939))

(assert (=> b!629942 m!604913))

(assert (=> b!629942 m!604927))

(declare-fun m!604941 () Bool)

(assert (=> b!629942 m!604941))

(assert (=> b!629942 m!604927))

(assert (=> b!629942 m!604937))

(declare-fun m!604943 () Bool)

(assert (=> b!629942 m!604943))

(declare-fun m!604945 () Bool)

(assert (=> b!629937 m!604945))

(declare-fun m!604947 () Bool)

(assert (=> b!629936 m!604947))

(push 1)

