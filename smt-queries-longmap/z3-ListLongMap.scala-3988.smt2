; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54108 () Bool)

(assert start!54108)

(declare-fun b!590526 () Bool)

(declare-datatypes ((Unit!18433 0))(
  ( (Unit!18434) )
))
(declare-fun e!337143 () Unit!18433)

(declare-fun Unit!18435 () Unit!18433)

(assert (=> b!590526 (= e!337143 Unit!18435)))

(declare-fun res!377663 () Bool)

(declare-fun e!337152 () Bool)

(assert (=> start!54108 (=> (not res!377663) (not e!337152))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54108 (= res!377663 (validMask!0 mask!3053))))

(assert (=> start!54108 e!337152))

(assert (=> start!54108 true))

(declare-datatypes ((array!36840 0))(
  ( (array!36841 (arr!17689 (Array (_ BitVec 32) (_ BitVec 64))) (size!18053 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36840)

(declare-fun array_inv!13548 (array!36840) Bool)

(assert (=> start!54108 (array_inv!13548 a!2986)))

(declare-fun b!590527 () Bool)

(declare-fun e!337144 () Bool)

(declare-fun e!337150 () Bool)

(assert (=> b!590527 (= e!337144 (not e!337150))))

(declare-fun res!377657 () Bool)

(assert (=> b!590527 (=> res!377657 e!337150)))

(declare-datatypes ((SeekEntryResult!6085 0))(
  ( (MissingZero!6085 (index!26573 (_ BitVec 32))) (Found!6085 (index!26574 (_ BitVec 32))) (Intermediate!6085 (undefined!6897 Bool) (index!26575 (_ BitVec 32)) (x!55519 (_ BitVec 32))) (Undefined!6085) (MissingVacant!6085 (index!26576 (_ BitVec 32))) )
))
(declare-fun lt!267903 () SeekEntryResult!6085)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590527 (= res!377657 (not (= lt!267903 (Found!6085 index!984))))))

(declare-fun lt!267908 () Unit!18433)

(assert (=> b!590527 (= lt!267908 e!337143)))

(declare-fun c!66803 () Bool)

(assert (=> b!590527 (= c!66803 (= lt!267903 Undefined!6085))))

(declare-fun lt!267905 () array!36840)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!267910 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36840 (_ BitVec 32)) SeekEntryResult!6085)

(assert (=> b!590527 (= lt!267903 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267910 lt!267905 mask!3053))))

(declare-fun e!337145 () Bool)

(assert (=> b!590527 e!337145))

(declare-fun res!377662 () Bool)

(assert (=> b!590527 (=> (not res!377662) (not e!337145))))

(declare-fun lt!267907 () SeekEntryResult!6085)

(declare-fun lt!267902 () (_ BitVec 32))

(assert (=> b!590527 (= res!377662 (= lt!267907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267902 vacantSpotIndex!68 lt!267910 lt!267905 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!590527 (= lt!267907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267902 vacantSpotIndex!68 (select (arr!17689 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!590527 (= lt!267910 (select (store (arr!17689 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267904 () Unit!18433)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36840 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18433)

(assert (=> b!590527 (= lt!267904 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267902 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590527 (= lt!267902 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!590528 () Bool)

(declare-fun res!377668 () Bool)

(assert (=> b!590528 (=> (not res!377668) (not e!337152))))

(declare-fun arrayContainsKey!0 (array!36840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590528 (= res!377668 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590529 () Bool)

(declare-fun res!377659 () Bool)

(assert (=> b!590529 (=> (not res!377659) (not e!337152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590529 (= res!377659 (validKeyInArray!0 k0!1786))))

(declare-fun b!590530 () Bool)

(declare-fun res!377661 () Bool)

(declare-fun e!337147 () Bool)

(assert (=> b!590530 (=> (not res!377661) (not e!337147))))

(assert (=> b!590530 (= res!377661 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17689 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590531 () Bool)

(assert (=> b!590531 (= e!337152 e!337147)))

(declare-fun res!377670 () Bool)

(assert (=> b!590531 (=> (not res!377670) (not e!337147))))

(declare-fun lt!267909 () SeekEntryResult!6085)

(assert (=> b!590531 (= res!377670 (or (= lt!267909 (MissingZero!6085 i!1108)) (= lt!267909 (MissingVacant!6085 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36840 (_ BitVec 32)) SeekEntryResult!6085)

(assert (=> b!590531 (= lt!267909 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590532 () Bool)

(declare-fun res!377667 () Bool)

(assert (=> b!590532 (=> (not res!377667) (not e!337152))))

(assert (=> b!590532 (= res!377667 (validKeyInArray!0 (select (arr!17689 a!2986) j!136)))))

(declare-fun b!590533 () Bool)

(declare-fun res!377669 () Bool)

(assert (=> b!590533 (=> (not res!377669) (not e!337147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36840 (_ BitVec 32)) Bool)

(assert (=> b!590533 (= res!377669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590534 () Bool)

(declare-fun e!337148 () Bool)

(assert (=> b!590534 (= e!337148 e!337144)))

(declare-fun res!377660 () Bool)

(assert (=> b!590534 (=> (not res!377660) (not e!337144))))

(declare-fun lt!267906 () SeekEntryResult!6085)

(assert (=> b!590534 (= res!377660 (and (= lt!267906 (Found!6085 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17689 a!2986) index!984) (select (arr!17689 a!2986) j!136))) (not (= (select (arr!17689 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590534 (= lt!267906 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17689 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590535 () Bool)

(assert (=> b!590535 (= e!337145 (= lt!267906 lt!267907))))

(declare-fun b!590536 () Bool)

(declare-fun res!377665 () Bool)

(assert (=> b!590536 (=> (not res!377665) (not e!337147))))

(declare-datatypes ((List!11637 0))(
  ( (Nil!11634) (Cons!11633 (h!12681 (_ BitVec 64)) (t!17857 List!11637)) )
))
(declare-fun arrayNoDuplicates!0 (array!36840 (_ BitVec 32) List!11637) Bool)

(assert (=> b!590536 (= res!377665 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11634))))

(declare-fun b!590537 () Bool)

(declare-fun Unit!18436 () Unit!18433)

(assert (=> b!590537 (= e!337143 Unit!18436)))

(assert (=> b!590537 false))

(declare-fun b!590538 () Bool)

(declare-fun e!337146 () Bool)

(declare-fun e!337151 () Bool)

(assert (=> b!590538 (= e!337146 e!337151)))

(declare-fun res!377664 () Bool)

(assert (=> b!590538 (=> res!377664 e!337151)))

(assert (=> b!590538 (= res!377664 (or (not (= (select (arr!17689 a!2986) j!136) lt!267910)) (not (= (select (arr!17689 a!2986) j!136) (select (store (arr!17689 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590539 () Bool)

(assert (=> b!590539 (= e!337151 (arrayContainsKey!0 lt!267905 (select (arr!17689 a!2986) j!136) j!136))))

(declare-fun b!590540 () Bool)

(assert (=> b!590540 (= e!337147 e!337148)))

(declare-fun res!377666 () Bool)

(assert (=> b!590540 (=> (not res!377666) (not e!337148))))

(assert (=> b!590540 (= res!377666 (= (select (store (arr!17689 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590540 (= lt!267905 (array!36841 (store (arr!17689 a!2986) i!1108 k0!1786) (size!18053 a!2986)))))

(declare-fun b!590541 () Bool)

(assert (=> b!590541 (= e!337150 true)))

(assert (=> b!590541 e!337146))

(declare-fun res!377658 () Bool)

(assert (=> b!590541 (=> (not res!377658) (not e!337146))))

(assert (=> b!590541 (= res!377658 (= (select (store (arr!17689 a!2986) i!1108 k0!1786) index!984) (select (arr!17689 a!2986) j!136)))))

(declare-fun b!590542 () Bool)

(declare-fun res!377671 () Bool)

(assert (=> b!590542 (=> (not res!377671) (not e!337152))))

(assert (=> b!590542 (= res!377671 (and (= (size!18053 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18053 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18053 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54108 res!377663) b!590542))

(assert (= (and b!590542 res!377671) b!590532))

(assert (= (and b!590532 res!377667) b!590529))

(assert (= (and b!590529 res!377659) b!590528))

(assert (= (and b!590528 res!377668) b!590531))

(assert (= (and b!590531 res!377670) b!590533))

(assert (= (and b!590533 res!377669) b!590536))

(assert (= (and b!590536 res!377665) b!590530))

(assert (= (and b!590530 res!377661) b!590540))

(assert (= (and b!590540 res!377666) b!590534))

(assert (= (and b!590534 res!377660) b!590527))

(assert (= (and b!590527 res!377662) b!590535))

(assert (= (and b!590527 c!66803) b!590537))

(assert (= (and b!590527 (not c!66803)) b!590526))

(assert (= (and b!590527 (not res!377657)) b!590541))

(assert (= (and b!590541 res!377658) b!590538))

(assert (= (and b!590538 (not res!377664)) b!590539))

(declare-fun m!569111 () Bool)

(assert (=> b!590541 m!569111))

(declare-fun m!569113 () Bool)

(assert (=> b!590541 m!569113))

(declare-fun m!569115 () Bool)

(assert (=> b!590541 m!569115))

(assert (=> b!590532 m!569115))

(assert (=> b!590532 m!569115))

(declare-fun m!569117 () Bool)

(assert (=> b!590532 m!569117))

(declare-fun m!569119 () Bool)

(assert (=> b!590531 m!569119))

(declare-fun m!569121 () Bool)

(assert (=> b!590529 m!569121))

(declare-fun m!569123 () Bool)

(assert (=> b!590533 m!569123))

(assert (=> b!590540 m!569111))

(declare-fun m!569125 () Bool)

(assert (=> b!590540 m!569125))

(declare-fun m!569127 () Bool)

(assert (=> b!590536 m!569127))

(declare-fun m!569129 () Bool)

(assert (=> b!590527 m!569129))

(declare-fun m!569131 () Bool)

(assert (=> b!590527 m!569131))

(assert (=> b!590527 m!569115))

(assert (=> b!590527 m!569115))

(declare-fun m!569133 () Bool)

(assert (=> b!590527 m!569133))

(assert (=> b!590527 m!569111))

(declare-fun m!569135 () Bool)

(assert (=> b!590527 m!569135))

(declare-fun m!569137 () Bool)

(assert (=> b!590527 m!569137))

(declare-fun m!569139 () Bool)

(assert (=> b!590527 m!569139))

(declare-fun m!569141 () Bool)

(assert (=> b!590530 m!569141))

(assert (=> b!590539 m!569115))

(assert (=> b!590539 m!569115))

(declare-fun m!569143 () Bool)

(assert (=> b!590539 m!569143))

(assert (=> b!590538 m!569115))

(assert (=> b!590538 m!569111))

(assert (=> b!590538 m!569113))

(declare-fun m!569145 () Bool)

(assert (=> start!54108 m!569145))

(declare-fun m!569147 () Bool)

(assert (=> start!54108 m!569147))

(declare-fun m!569149 () Bool)

(assert (=> b!590528 m!569149))

(declare-fun m!569151 () Bool)

(assert (=> b!590534 m!569151))

(assert (=> b!590534 m!569115))

(assert (=> b!590534 m!569115))

(declare-fun m!569153 () Bool)

(assert (=> b!590534 m!569153))

(check-sat (not b!590532) (not b!590527) (not b!590528) (not b!590536) (not b!590539) (not b!590531) (not b!590534) (not b!590529) (not b!590533) (not start!54108))
(check-sat)
