; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53954 () Bool)

(assert start!53954)

(declare-fun b!589081 () Bool)

(declare-fun res!376654 () Bool)

(declare-fun e!336345 () Bool)

(assert (=> b!589081 (=> (not res!376654) (not e!336345))))

(declare-datatypes ((array!36798 0))(
  ( (array!36799 (arr!17672 (Array (_ BitVec 32) (_ BitVec 64))) (size!18036 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36798)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589081 (= res!376654 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589082 () Bool)

(declare-fun e!336339 () Bool)

(declare-datatypes ((SeekEntryResult!6112 0))(
  ( (MissingZero!6112 (index!26678 (_ BitVec 32))) (Found!6112 (index!26679 (_ BitVec 32))) (Intermediate!6112 (undefined!6924 Bool) (index!26680 (_ BitVec 32)) (x!55470 (_ BitVec 32))) (Undefined!6112) (MissingVacant!6112 (index!26681 (_ BitVec 32))) )
))
(declare-fun lt!267138 () SeekEntryResult!6112)

(declare-fun lt!267142 () SeekEntryResult!6112)

(assert (=> b!589082 (= e!336339 (= lt!267138 lt!267142))))

(declare-fun b!589083 () Bool)

(declare-fun e!336344 () Bool)

(declare-fun e!336341 () Bool)

(assert (=> b!589083 (= e!336344 e!336341)))

(declare-fun res!376649 () Bool)

(assert (=> b!589083 (=> (not res!376649) (not e!336341))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589083 (= res!376649 (and (= lt!267138 (Found!6112 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17672 a!2986) index!984) (select (arr!17672 a!2986) j!136))) (not (= (select (arr!17672 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36798 (_ BitVec 32)) SeekEntryResult!6112)

(assert (=> b!589083 (= lt!267138 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17672 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589084 () Bool)

(declare-datatypes ((Unit!18366 0))(
  ( (Unit!18367) )
))
(declare-fun e!336342 () Unit!18366)

(declare-fun Unit!18368 () Unit!18366)

(assert (=> b!589084 (= e!336342 Unit!18368)))

(declare-fun b!589085 () Bool)

(assert (=> b!589085 (= e!336341 (not true))))

(declare-fun lt!267141 () Unit!18366)

(assert (=> b!589085 (= lt!267141 e!336342)))

(declare-fun lt!267140 () array!36798)

(declare-fun c!66584 () Bool)

(declare-fun lt!267137 () (_ BitVec 64))

(assert (=> b!589085 (= c!66584 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267137 lt!267140 mask!3053) Undefined!6112))))

(assert (=> b!589085 e!336339))

(declare-fun res!376650 () Bool)

(assert (=> b!589085 (=> (not res!376650) (not e!336339))))

(declare-fun lt!267139 () (_ BitVec 32))

(assert (=> b!589085 (= res!376650 (= lt!267142 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267139 vacantSpotIndex!68 lt!267137 lt!267140 mask!3053)))))

(assert (=> b!589085 (= lt!267142 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267139 vacantSpotIndex!68 (select (arr!17672 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589085 (= lt!267137 (select (store (arr!17672 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267135 () Unit!18366)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36798 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18366)

(assert (=> b!589085 (= lt!267135 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267139 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589085 (= lt!267139 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589086 () Bool)

(declare-fun res!376651 () Bool)

(declare-fun e!336340 () Bool)

(assert (=> b!589086 (=> (not res!376651) (not e!336340))))

(assert (=> b!589086 (= res!376651 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17672 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589087 () Bool)

(declare-fun res!376653 () Bool)

(assert (=> b!589087 (=> (not res!376653) (not e!336340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36798 (_ BitVec 32)) Bool)

(assert (=> b!589087 (= res!376653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589088 () Bool)

(assert (=> b!589088 (= e!336345 e!336340)))

(declare-fun res!376656 () Bool)

(assert (=> b!589088 (=> (not res!376656) (not e!336340))))

(declare-fun lt!267136 () SeekEntryResult!6112)

(assert (=> b!589088 (= res!376656 (or (= lt!267136 (MissingZero!6112 i!1108)) (= lt!267136 (MissingVacant!6112 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36798 (_ BitVec 32)) SeekEntryResult!6112)

(assert (=> b!589088 (= lt!267136 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589090 () Bool)

(assert (=> b!589090 (= e!336340 e!336344)))

(declare-fun res!376655 () Bool)

(assert (=> b!589090 (=> (not res!376655) (not e!336344))))

(assert (=> b!589090 (= res!376655 (= (select (store (arr!17672 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589090 (= lt!267140 (array!36799 (store (arr!17672 a!2986) i!1108 k!1786) (size!18036 a!2986)))))

(declare-fun b!589091 () Bool)

(declare-fun res!376657 () Bool)

(assert (=> b!589091 (=> (not res!376657) (not e!336340))))

(declare-datatypes ((List!11713 0))(
  ( (Nil!11710) (Cons!11709 (h!12754 (_ BitVec 64)) (t!17941 List!11713)) )
))
(declare-fun arrayNoDuplicates!0 (array!36798 (_ BitVec 32) List!11713) Bool)

(assert (=> b!589091 (= res!376657 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11710))))

(declare-fun b!589092 () Bool)

(declare-fun Unit!18369 () Unit!18366)

(assert (=> b!589092 (= e!336342 Unit!18369)))

(assert (=> b!589092 false))

(declare-fun b!589093 () Bool)

(declare-fun res!376648 () Bool)

(assert (=> b!589093 (=> (not res!376648) (not e!336345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589093 (= res!376648 (validKeyInArray!0 k!1786))))

(declare-fun b!589094 () Bool)

(declare-fun res!376658 () Bool)

(assert (=> b!589094 (=> (not res!376658) (not e!336345))))

(assert (=> b!589094 (= res!376658 (and (= (size!18036 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18036 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18036 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589089 () Bool)

(declare-fun res!376652 () Bool)

(assert (=> b!589089 (=> (not res!376652) (not e!336345))))

(assert (=> b!589089 (= res!376652 (validKeyInArray!0 (select (arr!17672 a!2986) j!136)))))

(declare-fun res!376647 () Bool)

(assert (=> start!53954 (=> (not res!376647) (not e!336345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53954 (= res!376647 (validMask!0 mask!3053))))

(assert (=> start!53954 e!336345))

(assert (=> start!53954 true))

(declare-fun array_inv!13468 (array!36798) Bool)

(assert (=> start!53954 (array_inv!13468 a!2986)))

(assert (= (and start!53954 res!376647) b!589094))

(assert (= (and b!589094 res!376658) b!589089))

(assert (= (and b!589089 res!376652) b!589093))

(assert (= (and b!589093 res!376648) b!589081))

(assert (= (and b!589081 res!376654) b!589088))

(assert (= (and b!589088 res!376656) b!589087))

(assert (= (and b!589087 res!376653) b!589091))

(assert (= (and b!589091 res!376657) b!589086))

(assert (= (and b!589086 res!376651) b!589090))

(assert (= (and b!589090 res!376655) b!589083))

(assert (= (and b!589083 res!376649) b!589085))

(assert (= (and b!589085 res!376650) b!589082))

(assert (= (and b!589085 c!66584) b!589092))

(assert (= (and b!589085 (not c!66584)) b!589084))

(declare-fun m!567627 () Bool)

(assert (=> b!589090 m!567627))

(declare-fun m!567629 () Bool)

(assert (=> b!589090 m!567629))

(declare-fun m!567631 () Bool)

(assert (=> b!589091 m!567631))

(declare-fun m!567633 () Bool)

(assert (=> start!53954 m!567633))

(declare-fun m!567635 () Bool)

(assert (=> start!53954 m!567635))

(declare-fun m!567637 () Bool)

(assert (=> b!589085 m!567637))

(declare-fun m!567639 () Bool)

(assert (=> b!589085 m!567639))

(declare-fun m!567641 () Bool)

(assert (=> b!589085 m!567641))

(declare-fun m!567643 () Bool)

(assert (=> b!589085 m!567643))

(assert (=> b!589085 m!567627))

(declare-fun m!567645 () Bool)

(assert (=> b!589085 m!567645))

(declare-fun m!567647 () Bool)

(assert (=> b!589085 m!567647))

(assert (=> b!589085 m!567643))

(declare-fun m!567649 () Bool)

(assert (=> b!589085 m!567649))

(assert (=> b!589089 m!567643))

(assert (=> b!589089 m!567643))

(declare-fun m!567651 () Bool)

(assert (=> b!589089 m!567651))

(declare-fun m!567653 () Bool)

(assert (=> b!589083 m!567653))

(assert (=> b!589083 m!567643))

(assert (=> b!589083 m!567643))

(declare-fun m!567655 () Bool)

(assert (=> b!589083 m!567655))

(declare-fun m!567657 () Bool)

(assert (=> b!589088 m!567657))

(declare-fun m!567659 () Bool)

(assert (=> b!589093 m!567659))

(declare-fun m!567661 () Bool)

(assert (=> b!589087 m!567661))

(declare-fun m!567663 () Bool)

(assert (=> b!589086 m!567663))

(declare-fun m!567665 () Bool)

(assert (=> b!589081 m!567665))

(push 1)

