; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53980 () Bool)

(assert start!53980)

(declare-fun b!589638 () Bool)

(declare-fun e!336628 () Bool)

(declare-fun e!336624 () Bool)

(assert (=> b!589638 (= e!336628 e!336624)))

(declare-fun res!377137 () Bool)

(assert (=> b!589638 (=> (not res!377137) (not e!336624))))

(declare-datatypes ((SeekEntryResult!6125 0))(
  ( (MissingZero!6125 (index!26730 (_ BitVec 32))) (Found!6125 (index!26731 (_ BitVec 32))) (Intermediate!6125 (undefined!6937 Bool) (index!26732 (_ BitVec 32)) (x!55523 (_ BitVec 32))) (Undefined!6125) (MissingVacant!6125 (index!26733 (_ BitVec 32))) )
))
(declare-fun lt!267453 () SeekEntryResult!6125)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589638 (= res!377137 (or (= lt!267453 (MissingZero!6125 i!1108)) (= lt!267453 (MissingVacant!6125 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36824 0))(
  ( (array!36825 (arr!17685 (Array (_ BitVec 32) (_ BitVec 64))) (size!18049 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36824)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36824 (_ BitVec 32)) SeekEntryResult!6125)

(assert (=> b!589638 (= lt!267453 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589639 () Bool)

(declare-fun e!336630 () Bool)

(assert (=> b!589639 (= e!336630 true)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589639 (= (select (store (arr!17685 a!2986) i!1108 k!1786) index!984) (select (arr!17685 a!2986) j!136))))

(declare-fun b!589640 () Bool)

(declare-fun e!336623 () Bool)

(assert (=> b!589640 (= e!336623 (not e!336630))))

(declare-fun res!377128 () Bool)

(assert (=> b!589640 (=> res!377128 e!336630)))

(declare-fun lt!267455 () SeekEntryResult!6125)

(assert (=> b!589640 (= res!377128 (not (= lt!267455 (Found!6125 index!984))))))

(declare-datatypes ((Unit!18418 0))(
  ( (Unit!18419) )
))
(declare-fun lt!267449 () Unit!18418)

(declare-fun e!336629 () Unit!18418)

(assert (=> b!589640 (= lt!267449 e!336629)))

(declare-fun c!66623 () Bool)

(assert (=> b!589640 (= c!66623 (= lt!267455 Undefined!6125))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!267456 () array!36824)

(declare-fun lt!267451 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36824 (_ BitVec 32)) SeekEntryResult!6125)

(assert (=> b!589640 (= lt!267455 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267451 lt!267456 mask!3053))))

(declare-fun e!336627 () Bool)

(assert (=> b!589640 e!336627))

(declare-fun res!377135 () Bool)

(assert (=> b!589640 (=> (not res!377135) (not e!336627))))

(declare-fun lt!267450 () (_ BitVec 32))

(declare-fun lt!267452 () SeekEntryResult!6125)

(assert (=> b!589640 (= res!377135 (= lt!267452 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267450 vacantSpotIndex!68 lt!267451 lt!267456 mask!3053)))))

(assert (=> b!589640 (= lt!267452 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267450 vacantSpotIndex!68 (select (arr!17685 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589640 (= lt!267451 (select (store (arr!17685 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267454 () Unit!18418)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36824 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18418)

(assert (=> b!589640 (= lt!267454 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267450 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589640 (= lt!267450 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589641 () Bool)

(declare-fun res!377131 () Bool)

(assert (=> b!589641 (=> (not res!377131) (not e!336624))))

(assert (=> b!589641 (= res!377131 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17685 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589642 () Bool)

(declare-fun e!336625 () Bool)

(assert (=> b!589642 (= e!336625 e!336623)))

(declare-fun res!377136 () Bool)

(assert (=> b!589642 (=> (not res!377136) (not e!336623))))

(declare-fun lt!267457 () SeekEntryResult!6125)

(assert (=> b!589642 (= res!377136 (and (= lt!267457 (Found!6125 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17685 a!2986) index!984) (select (arr!17685 a!2986) j!136))) (not (= (select (arr!17685 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589642 (= lt!267457 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17685 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589643 () Bool)

(declare-fun res!377127 () Bool)

(assert (=> b!589643 (=> (not res!377127) (not e!336628))))

(declare-fun arrayContainsKey!0 (array!36824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589643 (= res!377127 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589644 () Bool)

(declare-fun Unit!18420 () Unit!18418)

(assert (=> b!589644 (= e!336629 Unit!18420)))

(assert (=> b!589644 false))

(declare-fun b!589645 () Bool)

(assert (=> b!589645 (= e!336624 e!336625)))

(declare-fun res!377133 () Bool)

(assert (=> b!589645 (=> (not res!377133) (not e!336625))))

(assert (=> b!589645 (= res!377133 (= (select (store (arr!17685 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589645 (= lt!267456 (array!36825 (store (arr!17685 a!2986) i!1108 k!1786) (size!18049 a!2986)))))

(declare-fun b!589646 () Bool)

(declare-fun res!377129 () Bool)

(assert (=> b!589646 (=> (not res!377129) (not e!336624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36824 (_ BitVec 32)) Bool)

(assert (=> b!589646 (= res!377129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589647 () Bool)

(declare-fun res!377138 () Bool)

(assert (=> b!589647 (=> (not res!377138) (not e!336628))))

(assert (=> b!589647 (= res!377138 (and (= (size!18049 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18049 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18049 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589648 () Bool)

(declare-fun Unit!18421 () Unit!18418)

(assert (=> b!589648 (= e!336629 Unit!18421)))

(declare-fun b!589649 () Bool)

(declare-fun res!377132 () Bool)

(assert (=> b!589649 (=> (not res!377132) (not e!336628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589649 (= res!377132 (validKeyInArray!0 (select (arr!17685 a!2986) j!136)))))

(declare-fun b!589650 () Bool)

(declare-fun res!377126 () Bool)

(assert (=> b!589650 (=> (not res!377126) (not e!336624))))

(declare-datatypes ((List!11726 0))(
  ( (Nil!11723) (Cons!11722 (h!12767 (_ BitVec 64)) (t!17954 List!11726)) )
))
(declare-fun arrayNoDuplicates!0 (array!36824 (_ BitVec 32) List!11726) Bool)

(assert (=> b!589650 (= res!377126 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11723))))

(declare-fun res!377130 () Bool)

(assert (=> start!53980 (=> (not res!377130) (not e!336628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53980 (= res!377130 (validMask!0 mask!3053))))

(assert (=> start!53980 e!336628))

(assert (=> start!53980 true))

(declare-fun array_inv!13481 (array!36824) Bool)

(assert (=> start!53980 (array_inv!13481 a!2986)))

(declare-fun b!589651 () Bool)

(assert (=> b!589651 (= e!336627 (= lt!267457 lt!267452))))

(declare-fun b!589652 () Bool)

(declare-fun res!377134 () Bool)

(assert (=> b!589652 (=> (not res!377134) (not e!336628))))

(assert (=> b!589652 (= res!377134 (validKeyInArray!0 k!1786))))

(assert (= (and start!53980 res!377130) b!589647))

(assert (= (and b!589647 res!377138) b!589649))

(assert (= (and b!589649 res!377132) b!589652))

(assert (= (and b!589652 res!377134) b!589643))

(assert (= (and b!589643 res!377127) b!589638))

(assert (= (and b!589638 res!377137) b!589646))

(assert (= (and b!589646 res!377129) b!589650))

(assert (= (and b!589650 res!377126) b!589641))

(assert (= (and b!589641 res!377131) b!589645))

(assert (= (and b!589645 res!377133) b!589642))

(assert (= (and b!589642 res!377136) b!589640))

(assert (= (and b!589640 res!377135) b!589651))

(assert (= (and b!589640 c!66623) b!589644))

(assert (= (and b!589640 (not c!66623)) b!589648))

(assert (= (and b!589640 (not res!377128)) b!589639))

(declare-fun m!568153 () Bool)

(assert (=> b!589652 m!568153))

(declare-fun m!568155 () Bool)

(assert (=> b!589650 m!568155))

(declare-fun m!568157 () Bool)

(assert (=> b!589646 m!568157))

(declare-fun m!568159 () Bool)

(assert (=> b!589641 m!568159))

(declare-fun m!568161 () Bool)

(assert (=> b!589642 m!568161))

(declare-fun m!568163 () Bool)

(assert (=> b!589642 m!568163))

(assert (=> b!589642 m!568163))

(declare-fun m!568165 () Bool)

(assert (=> b!589642 m!568165))

(declare-fun m!568167 () Bool)

(assert (=> b!589638 m!568167))

(declare-fun m!568169 () Bool)

(assert (=> b!589640 m!568169))

(declare-fun m!568171 () Bool)

(assert (=> b!589640 m!568171))

(assert (=> b!589640 m!568163))

(declare-fun m!568173 () Bool)

(assert (=> b!589640 m!568173))

(declare-fun m!568175 () Bool)

(assert (=> b!589640 m!568175))

(assert (=> b!589640 m!568163))

(declare-fun m!568177 () Bool)

(assert (=> b!589640 m!568177))

(declare-fun m!568179 () Bool)

(assert (=> b!589640 m!568179))

(declare-fun m!568181 () Bool)

(assert (=> b!589640 m!568181))

(declare-fun m!568183 () Bool)

(assert (=> b!589643 m!568183))

(assert (=> b!589639 m!568175))

(declare-fun m!568185 () Bool)

(assert (=> b!589639 m!568185))

(assert (=> b!589639 m!568163))

(assert (=> b!589645 m!568175))

(declare-fun m!568187 () Bool)

(assert (=> b!589645 m!568187))

(declare-fun m!568189 () Bool)

(assert (=> start!53980 m!568189))

(declare-fun m!568191 () Bool)

(assert (=> start!53980 m!568191))

(assert (=> b!589649 m!568163))

(assert (=> b!589649 m!568163))

(declare-fun m!568193 () Bool)

(assert (=> b!589649 m!568193))

(push 1)

