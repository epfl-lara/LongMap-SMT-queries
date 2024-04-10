; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57342 () Bool)

(assert start!57342)

(declare-fun b!634632 () Bool)

(declare-fun e!362927 () Bool)

(declare-fun e!362930 () Bool)

(assert (=> b!634632 (= e!362927 (not e!362930))))

(declare-fun res!410495 () Bool)

(assert (=> b!634632 (=> res!410495 e!362930)))

(declare-datatypes ((SeekEntryResult!6766 0))(
  ( (MissingZero!6766 (index!29366 (_ BitVec 32))) (Found!6766 (index!29367 (_ BitVec 32))) (Intermediate!6766 (undefined!7578 Bool) (index!29368 (_ BitVec 32)) (x!58108 (_ BitVec 32))) (Undefined!6766) (MissingVacant!6766 (index!29369 (_ BitVec 32))) )
))
(declare-fun lt!293381 () SeekEntryResult!6766)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634632 (= res!410495 (not (= lt!293381 (Found!6766 index!984))))))

(declare-datatypes ((Unit!21398 0))(
  ( (Unit!21399) )
))
(declare-fun lt!293386 () Unit!21398)

(declare-fun e!362928 () Unit!21398)

(assert (=> b!634632 (= lt!293386 e!362928)))

(declare-fun c!72440 () Bool)

(assert (=> b!634632 (= c!72440 (= lt!293381 Undefined!6766))))

(declare-datatypes ((array!38195 0))(
  ( (array!38196 (arr!18326 (Array (_ BitVec 32) (_ BitVec 64))) (size!18690 (_ BitVec 32))) )
))
(declare-fun lt!293383 () array!38195)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!293387 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38195 (_ BitVec 32)) SeekEntryResult!6766)

(assert (=> b!634632 (= lt!293381 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293387 lt!293383 mask!3053))))

(declare-fun e!362922 () Bool)

(assert (=> b!634632 e!362922))

(declare-fun res!410499 () Bool)

(assert (=> b!634632 (=> (not res!410499) (not e!362922))))

(declare-fun lt!293385 () SeekEntryResult!6766)

(declare-fun lt!293384 () (_ BitVec 32))

(assert (=> b!634632 (= res!410499 (= lt!293385 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293384 vacantSpotIndex!68 lt!293387 lt!293383 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38195)

(assert (=> b!634632 (= lt!293385 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293384 vacantSpotIndex!68 (select (arr!18326 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!634632 (= lt!293387 (select (store (arr!18326 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293388 () Unit!21398)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38195 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21398)

(assert (=> b!634632 (= lt!293388 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293384 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634632 (= lt!293384 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634633 () Bool)

(declare-fun lt!293382 () SeekEntryResult!6766)

(assert (=> b!634633 (= e!362922 (= lt!293382 lt!293385))))

(declare-fun b!634634 () Bool)

(declare-fun res!410498 () Bool)

(declare-fun e!362924 () Bool)

(assert (=> b!634634 (=> (not res!410498) (not e!362924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634634 (= res!410498 (validKeyInArray!0 (select (arr!18326 a!2986) j!136)))))

(declare-fun b!634635 () Bool)

(declare-fun res!410490 () Bool)

(assert (=> b!634635 (=> (not res!410490) (not e!362924))))

(assert (=> b!634635 (= res!410490 (validKeyInArray!0 k!1786))))

(declare-fun b!634636 () Bool)

(declare-fun Unit!21400 () Unit!21398)

(assert (=> b!634636 (= e!362928 Unit!21400)))

(declare-fun b!634637 () Bool)

(declare-fun res!410491 () Bool)

(declare-fun e!362925 () Bool)

(assert (=> b!634637 (=> (not res!410491) (not e!362925))))

(declare-datatypes ((List!12367 0))(
  ( (Nil!12364) (Cons!12363 (h!13408 (_ BitVec 64)) (t!18595 List!12367)) )
))
(declare-fun arrayNoDuplicates!0 (array!38195 (_ BitVec 32) List!12367) Bool)

(assert (=> b!634637 (= res!410491 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12364))))

(declare-fun b!634638 () Bool)

(declare-fun e!362921 () Bool)

(assert (=> b!634638 (= e!362921 e!362927)))

(declare-fun res!410494 () Bool)

(assert (=> b!634638 (=> (not res!410494) (not e!362927))))

(assert (=> b!634638 (= res!410494 (and (= lt!293382 (Found!6766 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18326 a!2986) index!984) (select (arr!18326 a!2986) j!136))) (not (= (select (arr!18326 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634638 (= lt!293382 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18326 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634639 () Bool)

(declare-fun Unit!21401 () Unit!21398)

(assert (=> b!634639 (= e!362928 Unit!21401)))

(assert (=> b!634639 false))

(declare-fun res!410493 () Bool)

(assert (=> start!57342 (=> (not res!410493) (not e!362924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57342 (= res!410493 (validMask!0 mask!3053))))

(assert (=> start!57342 e!362924))

(assert (=> start!57342 true))

(declare-fun array_inv!14122 (array!38195) Bool)

(assert (=> start!57342 (array_inv!14122 a!2986)))

(declare-fun b!634640 () Bool)

(declare-fun e!362929 () Bool)

(declare-fun arrayContainsKey!0 (array!38195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634640 (= e!362929 (arrayContainsKey!0 lt!293383 (select (arr!18326 a!2986) j!136) index!984))))

(declare-fun b!634641 () Bool)

(declare-fun res!410500 () Bool)

(assert (=> b!634641 (=> (not res!410500) (not e!362924))))

(assert (=> b!634641 (= res!410500 (and (= (size!18690 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18690 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18690 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634642 () Bool)

(assert (=> b!634642 (= e!362925 e!362921)))

(declare-fun res!410486 () Bool)

(assert (=> b!634642 (=> (not res!410486) (not e!362921))))

(assert (=> b!634642 (= res!410486 (= (select (store (arr!18326 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634642 (= lt!293383 (array!38196 (store (arr!18326 a!2986) i!1108 k!1786) (size!18690 a!2986)))))

(declare-fun b!634643 () Bool)

(declare-fun res!410496 () Bool)

(assert (=> b!634643 (=> (not res!410496) (not e!362925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38195 (_ BitVec 32)) Bool)

(assert (=> b!634643 (= res!410496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634644 () Bool)

(declare-fun e!362923 () Bool)

(declare-fun e!362931 () Bool)

(assert (=> b!634644 (= e!362923 e!362931)))

(declare-fun res!410497 () Bool)

(assert (=> b!634644 (=> res!410497 e!362931)))

(declare-fun lt!293380 () (_ BitVec 64))

(assert (=> b!634644 (= res!410497 (or (not (= (select (arr!18326 a!2986) j!136) lt!293387)) (not (= (select (arr!18326 a!2986) j!136) lt!293380)) (bvsge j!136 index!984)))))

(declare-fun b!634645 () Bool)

(declare-fun res!410487 () Bool)

(assert (=> b!634645 (=> (not res!410487) (not e!362925))))

(assert (=> b!634645 (= res!410487 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18326 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634646 () Bool)

(assert (=> b!634646 (= e!362924 e!362925)))

(declare-fun res!410492 () Bool)

(assert (=> b!634646 (=> (not res!410492) (not e!362925))))

(declare-fun lt!293389 () SeekEntryResult!6766)

(assert (=> b!634646 (= res!410492 (or (= lt!293389 (MissingZero!6766 i!1108)) (= lt!293389 (MissingVacant!6766 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38195 (_ BitVec 32)) SeekEntryResult!6766)

(assert (=> b!634646 (= lt!293389 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634647 () Bool)

(assert (=> b!634647 (= e!362930 true)))

(assert (=> b!634647 e!362923))

(declare-fun res!410488 () Bool)

(assert (=> b!634647 (=> (not res!410488) (not e!362923))))

(assert (=> b!634647 (= res!410488 (= lt!293380 (select (arr!18326 a!2986) j!136)))))

(assert (=> b!634647 (= lt!293380 (select (store (arr!18326 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!634648 () Bool)

(declare-fun res!410501 () Bool)

(assert (=> b!634648 (=> (not res!410501) (not e!362924))))

(assert (=> b!634648 (= res!410501 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634649 () Bool)

(assert (=> b!634649 (= e!362931 e!362929)))

(declare-fun res!410489 () Bool)

(assert (=> b!634649 (=> (not res!410489) (not e!362929))))

(assert (=> b!634649 (= res!410489 (arrayContainsKey!0 lt!293383 (select (arr!18326 a!2986) j!136) j!136))))

(assert (= (and start!57342 res!410493) b!634641))

(assert (= (and b!634641 res!410500) b!634634))

(assert (= (and b!634634 res!410498) b!634635))

(assert (= (and b!634635 res!410490) b!634648))

(assert (= (and b!634648 res!410501) b!634646))

(assert (= (and b!634646 res!410492) b!634643))

(assert (= (and b!634643 res!410496) b!634637))

(assert (= (and b!634637 res!410491) b!634645))

(assert (= (and b!634645 res!410487) b!634642))

(assert (= (and b!634642 res!410486) b!634638))

(assert (= (and b!634638 res!410494) b!634632))

(assert (= (and b!634632 res!410499) b!634633))

(assert (= (and b!634632 c!72440) b!634639))

(assert (= (and b!634632 (not c!72440)) b!634636))

(assert (= (and b!634632 (not res!410495)) b!634647))

(assert (= (and b!634647 res!410488) b!634644))

(assert (= (and b!634644 (not res!410497)) b!634649))

(assert (= (and b!634649 res!410489) b!634640))

(declare-fun m!609097 () Bool)

(assert (=> b!634637 m!609097))

(declare-fun m!609099 () Bool)

(assert (=> b!634640 m!609099))

(assert (=> b!634640 m!609099))

(declare-fun m!609101 () Bool)

(assert (=> b!634640 m!609101))

(declare-fun m!609103 () Bool)

(assert (=> b!634642 m!609103))

(declare-fun m!609105 () Bool)

(assert (=> b!634642 m!609105))

(declare-fun m!609107 () Bool)

(assert (=> b!634646 m!609107))

(declare-fun m!609109 () Bool)

(assert (=> b!634645 m!609109))

(declare-fun m!609111 () Bool)

(assert (=> b!634648 m!609111))

(assert (=> b!634634 m!609099))

(assert (=> b!634634 m!609099))

(declare-fun m!609113 () Bool)

(assert (=> b!634634 m!609113))

(declare-fun m!609115 () Bool)

(assert (=> start!57342 m!609115))

(declare-fun m!609117 () Bool)

(assert (=> start!57342 m!609117))

(declare-fun m!609119 () Bool)

(assert (=> b!634638 m!609119))

(assert (=> b!634638 m!609099))

(assert (=> b!634638 m!609099))

(declare-fun m!609121 () Bool)

(assert (=> b!634638 m!609121))

(assert (=> b!634647 m!609099))

(assert (=> b!634647 m!609103))

(declare-fun m!609123 () Bool)

(assert (=> b!634647 m!609123))

(declare-fun m!609125 () Bool)

(assert (=> b!634632 m!609125))

(declare-fun m!609127 () Bool)

(assert (=> b!634632 m!609127))

(assert (=> b!634632 m!609099))

(assert (=> b!634632 m!609103))

(assert (=> b!634632 m!609099))

(declare-fun m!609129 () Bool)

(assert (=> b!634632 m!609129))

(declare-fun m!609131 () Bool)

(assert (=> b!634632 m!609131))

(declare-fun m!609133 () Bool)

(assert (=> b!634632 m!609133))

(declare-fun m!609135 () Bool)

(assert (=> b!634632 m!609135))

(declare-fun m!609137 () Bool)

(assert (=> b!634643 m!609137))

(assert (=> b!634649 m!609099))

(assert (=> b!634649 m!609099))

(declare-fun m!609139 () Bool)

(assert (=> b!634649 m!609139))

(assert (=> b!634644 m!609099))

(declare-fun m!609141 () Bool)

(assert (=> b!634635 m!609141))

(push 1)

