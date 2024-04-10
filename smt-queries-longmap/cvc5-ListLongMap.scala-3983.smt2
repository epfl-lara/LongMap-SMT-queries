; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53968 () Bool)

(assert start!53968)

(declare-fun b!589375 () Bool)

(declare-fun res!376903 () Bool)

(declare-fun e!336492 () Bool)

(assert (=> b!589375 (=> (not res!376903) (not e!336492))))

(declare-datatypes ((array!36812 0))(
  ( (array!36813 (arr!17679 (Array (_ BitVec 32) (_ BitVec 64))) (size!18043 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36812)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589375 (= res!376903 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589376 () Bool)

(declare-datatypes ((Unit!18394 0))(
  ( (Unit!18395) )
))
(declare-fun e!336488 () Unit!18394)

(declare-fun Unit!18396 () Unit!18394)

(assert (=> b!589376 (= e!336488 Unit!18396)))

(assert (=> b!589376 false))

(declare-fun b!589377 () Bool)

(declare-fun e!336487 () Bool)

(assert (=> b!589377 (= e!336492 e!336487)))

(declare-fun res!376899 () Bool)

(assert (=> b!589377 (=> (not res!376899) (not e!336487))))

(declare-datatypes ((SeekEntryResult!6119 0))(
  ( (MissingZero!6119 (index!26706 (_ BitVec 32))) (Found!6119 (index!26707 (_ BitVec 32))) (Intermediate!6119 (undefined!6931 Bool) (index!26708 (_ BitVec 32)) (x!55501 (_ BitVec 32))) (Undefined!6119) (MissingVacant!6119 (index!26709 (_ BitVec 32))) )
))
(declare-fun lt!267310 () SeekEntryResult!6119)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589377 (= res!376899 (or (= lt!267310 (MissingZero!6119 i!1108)) (= lt!267310 (MissingVacant!6119 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36812 (_ BitVec 32)) SeekEntryResult!6119)

(assert (=> b!589377 (= lt!267310 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589378 () Bool)

(declare-fun e!336489 () Bool)

(declare-fun e!336491 () Bool)

(assert (=> b!589378 (= e!336489 e!336491)))

(declare-fun res!376905 () Bool)

(assert (=> b!589378 (=> (not res!376905) (not e!336491))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!267308 () SeekEntryResult!6119)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589378 (= res!376905 (and (= lt!267308 (Found!6119 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17679 a!2986) index!984) (select (arr!17679 a!2986) j!136))) (not (= (select (arr!17679 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36812 (_ BitVec 32)) SeekEntryResult!6119)

(assert (=> b!589378 (= lt!267308 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17679 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589379 () Bool)

(assert (=> b!589379 (= e!336491 (not true))))

(declare-fun lt!267307 () Unit!18394)

(assert (=> b!589379 (= lt!267307 e!336488)))

(declare-fun c!66605 () Bool)

(declare-fun lt!267304 () array!36812)

(declare-fun lt!267305 () (_ BitVec 64))

(assert (=> b!589379 (= c!66605 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267305 lt!267304 mask!3053) Undefined!6119))))

(declare-fun e!336490 () Bool)

(assert (=> b!589379 e!336490))

(declare-fun res!376906 () Bool)

(assert (=> b!589379 (=> (not res!376906) (not e!336490))))

(declare-fun lt!267309 () SeekEntryResult!6119)

(declare-fun lt!267306 () (_ BitVec 32))

(assert (=> b!589379 (= res!376906 (= lt!267309 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267306 vacantSpotIndex!68 lt!267305 lt!267304 mask!3053)))))

(assert (=> b!589379 (= lt!267309 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267306 vacantSpotIndex!68 (select (arr!17679 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589379 (= lt!267305 (select (store (arr!17679 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267303 () Unit!18394)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36812 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18394)

(assert (=> b!589379 (= lt!267303 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267306 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589379 (= lt!267306 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589380 () Bool)

(declare-fun Unit!18397 () Unit!18394)

(assert (=> b!589380 (= e!336488 Unit!18397)))

(declare-fun b!589381 () Bool)

(declare-fun res!376909 () Bool)

(assert (=> b!589381 (=> (not res!376909) (not e!336492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589381 (= res!376909 (validKeyInArray!0 (select (arr!17679 a!2986) j!136)))))

(declare-fun b!589382 () Bool)

(assert (=> b!589382 (= e!336487 e!336489)))

(declare-fun res!376904 () Bool)

(assert (=> b!589382 (=> (not res!376904) (not e!336489))))

(assert (=> b!589382 (= res!376904 (= (select (store (arr!17679 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589382 (= lt!267304 (array!36813 (store (arr!17679 a!2986) i!1108 k!1786) (size!18043 a!2986)))))

(declare-fun b!589383 () Bool)

(declare-fun res!376910 () Bool)

(assert (=> b!589383 (=> (not res!376910) (not e!336487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36812 (_ BitVec 32)) Bool)

(assert (=> b!589383 (= res!376910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589384 () Bool)

(assert (=> b!589384 (= e!336490 (= lt!267308 lt!267309))))

(declare-fun res!376902 () Bool)

(assert (=> start!53968 (=> (not res!376902) (not e!336492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53968 (= res!376902 (validMask!0 mask!3053))))

(assert (=> start!53968 e!336492))

(assert (=> start!53968 true))

(declare-fun array_inv!13475 (array!36812) Bool)

(assert (=> start!53968 (array_inv!13475 a!2986)))

(declare-fun b!589385 () Bool)

(declare-fun res!376900 () Bool)

(assert (=> b!589385 (=> (not res!376900) (not e!336487))))

(assert (=> b!589385 (= res!376900 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17679 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589386 () Bool)

(declare-fun res!376908 () Bool)

(assert (=> b!589386 (=> (not res!376908) (not e!336492))))

(assert (=> b!589386 (= res!376908 (and (= (size!18043 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18043 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18043 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589387 () Bool)

(declare-fun res!376907 () Bool)

(assert (=> b!589387 (=> (not res!376907) (not e!336492))))

(assert (=> b!589387 (= res!376907 (validKeyInArray!0 k!1786))))

(declare-fun b!589388 () Bool)

(declare-fun res!376901 () Bool)

(assert (=> b!589388 (=> (not res!376901) (not e!336487))))

(declare-datatypes ((List!11720 0))(
  ( (Nil!11717) (Cons!11716 (h!12761 (_ BitVec 64)) (t!17948 List!11720)) )
))
(declare-fun arrayNoDuplicates!0 (array!36812 (_ BitVec 32) List!11720) Bool)

(assert (=> b!589388 (= res!376901 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11717))))

(assert (= (and start!53968 res!376902) b!589386))

(assert (= (and b!589386 res!376908) b!589381))

(assert (= (and b!589381 res!376909) b!589387))

(assert (= (and b!589387 res!376907) b!589375))

(assert (= (and b!589375 res!376903) b!589377))

(assert (= (and b!589377 res!376899) b!589383))

(assert (= (and b!589383 res!376910) b!589388))

(assert (= (and b!589388 res!376901) b!589385))

(assert (= (and b!589385 res!376900) b!589382))

(assert (= (and b!589382 res!376904) b!589378))

(assert (= (and b!589378 res!376905) b!589379))

(assert (= (and b!589379 res!376906) b!589384))

(assert (= (and b!589379 c!66605) b!589376))

(assert (= (and b!589379 (not c!66605)) b!589380))

(declare-fun m!567907 () Bool)

(assert (=> b!589377 m!567907))

(declare-fun m!567909 () Bool)

(assert (=> b!589378 m!567909))

(declare-fun m!567911 () Bool)

(assert (=> b!589378 m!567911))

(assert (=> b!589378 m!567911))

(declare-fun m!567913 () Bool)

(assert (=> b!589378 m!567913))

(assert (=> b!589381 m!567911))

(assert (=> b!589381 m!567911))

(declare-fun m!567915 () Bool)

(assert (=> b!589381 m!567915))

(declare-fun m!567917 () Bool)

(assert (=> start!53968 m!567917))

(declare-fun m!567919 () Bool)

(assert (=> start!53968 m!567919))

(declare-fun m!567921 () Bool)

(assert (=> b!589387 m!567921))

(declare-fun m!567923 () Bool)

(assert (=> b!589382 m!567923))

(declare-fun m!567925 () Bool)

(assert (=> b!589382 m!567925))

(declare-fun m!567927 () Bool)

(assert (=> b!589379 m!567927))

(declare-fun m!567929 () Bool)

(assert (=> b!589379 m!567929))

(assert (=> b!589379 m!567911))

(assert (=> b!589379 m!567923))

(declare-fun m!567931 () Bool)

(assert (=> b!589379 m!567931))

(declare-fun m!567933 () Bool)

(assert (=> b!589379 m!567933))

(declare-fun m!567935 () Bool)

(assert (=> b!589379 m!567935))

(assert (=> b!589379 m!567911))

(declare-fun m!567937 () Bool)

(assert (=> b!589379 m!567937))

(declare-fun m!567939 () Bool)

(assert (=> b!589388 m!567939))

(declare-fun m!567941 () Bool)

(assert (=> b!589383 m!567941))

(declare-fun m!567943 () Bool)

(assert (=> b!589375 m!567943))

(declare-fun m!567945 () Bool)

(assert (=> b!589385 m!567945))

(push 1)

