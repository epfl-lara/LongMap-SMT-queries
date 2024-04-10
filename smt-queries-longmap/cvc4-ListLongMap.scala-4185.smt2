; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57090 () Bool)

(assert start!57090)

(declare-fun b!631858 () Bool)

(declare-fun res!408536 () Bool)

(declare-fun e!361266 () Bool)

(assert (=> b!631858 (=> (not res!408536) (not e!361266))))

(declare-datatypes ((array!38109 0))(
  ( (array!38110 (arr!18287 (Array (_ BitVec 32) (_ BitVec 64))) (size!18651 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38109)

(declare-datatypes ((List!12328 0))(
  ( (Nil!12325) (Cons!12324 (h!13369 (_ BitVec 64)) (t!18556 List!12328)) )
))
(declare-fun arrayNoDuplicates!0 (array!38109 (_ BitVec 32) List!12328) Bool)

(assert (=> b!631858 (= res!408536 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12325))))

(declare-fun b!631859 () Bool)

(declare-fun e!361265 () Bool)

(declare-datatypes ((SeekEntryResult!6727 0))(
  ( (MissingZero!6727 (index!29201 (_ BitVec 32))) (Found!6727 (index!29202 (_ BitVec 32))) (Intermediate!6727 (undefined!7539 Bool) (index!29203 (_ BitVec 32)) (x!57938 (_ BitVec 32))) (Undefined!6727) (MissingVacant!6727 (index!29204 (_ BitVec 32))) )
))
(declare-fun lt!291942 () SeekEntryResult!6727)

(declare-fun lt!291946 () SeekEntryResult!6727)

(assert (=> b!631859 (= e!361265 (= lt!291942 lt!291946))))

(declare-fun b!631860 () Bool)

(declare-fun e!361263 () Bool)

(assert (=> b!631860 (= e!361263 true)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631860 (= (select (store (arr!18287 a!2986) i!1108 k!1786) index!984) (select (arr!18287 a!2986) j!136))))

(declare-fun b!631861 () Bool)

(declare-fun e!361260 () Bool)

(assert (=> b!631861 (= e!361266 e!361260)))

(declare-fun res!408540 () Bool)

(assert (=> b!631861 (=> (not res!408540) (not e!361260))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!631861 (= res!408540 (= (select (store (arr!18287 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291948 () array!38109)

(assert (=> b!631861 (= lt!291948 (array!38110 (store (arr!18287 a!2986) i!1108 k!1786) (size!18651 a!2986)))))

(declare-fun b!631862 () Bool)

(declare-fun res!408535 () Bool)

(assert (=> b!631862 (=> (not res!408535) (not e!361266))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38109 (_ BitVec 32)) Bool)

(assert (=> b!631862 (= res!408535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631863 () Bool)

(declare-fun e!361261 () Bool)

(assert (=> b!631863 (= e!361260 e!361261)))

(declare-fun res!408538 () Bool)

(assert (=> b!631863 (=> (not res!408538) (not e!361261))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!631863 (= res!408538 (and (= lt!291942 (Found!6727 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18287 a!2986) index!984) (select (arr!18287 a!2986) j!136))) (not (= (select (arr!18287 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38109 (_ BitVec 32)) SeekEntryResult!6727)

(assert (=> b!631863 (= lt!291942 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18287 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631864 () Bool)

(declare-datatypes ((Unit!21242 0))(
  ( (Unit!21243) )
))
(declare-fun e!361264 () Unit!21242)

(declare-fun Unit!21244 () Unit!21242)

(assert (=> b!631864 (= e!361264 Unit!21244)))

(assert (=> b!631864 false))

(declare-fun b!631865 () Bool)

(declare-fun res!408542 () Bool)

(declare-fun e!361259 () Bool)

(assert (=> b!631865 (=> (not res!408542) (not e!361259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631865 (= res!408542 (validKeyInArray!0 k!1786))))

(declare-fun b!631866 () Bool)

(declare-fun res!408537 () Bool)

(assert (=> b!631866 (=> (not res!408537) (not e!361259))))

(declare-fun arrayContainsKey!0 (array!38109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631866 (= res!408537 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631867 () Bool)

(assert (=> b!631867 (= e!361259 e!361266)))

(declare-fun res!408541 () Bool)

(assert (=> b!631867 (=> (not res!408541) (not e!361266))))

(declare-fun lt!291944 () SeekEntryResult!6727)

(assert (=> b!631867 (= res!408541 (or (= lt!291944 (MissingZero!6727 i!1108)) (= lt!291944 (MissingVacant!6727 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38109 (_ BitVec 32)) SeekEntryResult!6727)

(assert (=> b!631867 (= lt!291944 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631868 () Bool)

(declare-fun res!408534 () Bool)

(assert (=> b!631868 (=> (not res!408534) (not e!361266))))

(assert (=> b!631868 (= res!408534 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18287 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631869 () Bool)

(declare-fun res!408533 () Bool)

(assert (=> b!631869 (=> (not res!408533) (not e!361259))))

(assert (=> b!631869 (= res!408533 (validKeyInArray!0 (select (arr!18287 a!2986) j!136)))))

(declare-fun b!631870 () Bool)

(declare-fun res!408539 () Bool)

(assert (=> b!631870 (=> (not res!408539) (not e!361259))))

(assert (=> b!631870 (= res!408539 (and (= (size!18651 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18651 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18651 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631871 () Bool)

(declare-fun Unit!21245 () Unit!21242)

(assert (=> b!631871 (= e!361264 Unit!21245)))

(declare-fun res!408543 () Bool)

(assert (=> start!57090 (=> (not res!408543) (not e!361259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57090 (= res!408543 (validMask!0 mask!3053))))

(assert (=> start!57090 e!361259))

(assert (=> start!57090 true))

(declare-fun array_inv!14083 (array!38109) Bool)

(assert (=> start!57090 (array_inv!14083 a!2986)))

(declare-fun b!631857 () Bool)

(assert (=> b!631857 (= e!361261 (not e!361263))))

(declare-fun res!408545 () Bool)

(assert (=> b!631857 (=> res!408545 e!361263)))

(declare-fun lt!291941 () SeekEntryResult!6727)

(assert (=> b!631857 (= res!408545 (not (= lt!291941 (Found!6727 index!984))))))

(declare-fun lt!291947 () Unit!21242)

(assert (=> b!631857 (= lt!291947 e!361264)))

(declare-fun c!72029 () Bool)

(assert (=> b!631857 (= c!72029 (= lt!291941 Undefined!6727))))

(declare-fun lt!291945 () (_ BitVec 64))

(assert (=> b!631857 (= lt!291941 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291945 lt!291948 mask!3053))))

(assert (=> b!631857 e!361265))

(declare-fun res!408544 () Bool)

(assert (=> b!631857 (=> (not res!408544) (not e!361265))))

(declare-fun lt!291949 () (_ BitVec 32))

(assert (=> b!631857 (= res!408544 (= lt!291946 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291949 vacantSpotIndex!68 lt!291945 lt!291948 mask!3053)))))

(assert (=> b!631857 (= lt!291946 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291949 vacantSpotIndex!68 (select (arr!18287 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631857 (= lt!291945 (select (store (arr!18287 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291943 () Unit!21242)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38109 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21242)

(assert (=> b!631857 (= lt!291943 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291949 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631857 (= lt!291949 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57090 res!408543) b!631870))

(assert (= (and b!631870 res!408539) b!631869))

(assert (= (and b!631869 res!408533) b!631865))

(assert (= (and b!631865 res!408542) b!631866))

(assert (= (and b!631866 res!408537) b!631867))

(assert (= (and b!631867 res!408541) b!631862))

(assert (= (and b!631862 res!408535) b!631858))

(assert (= (and b!631858 res!408536) b!631868))

(assert (= (and b!631868 res!408534) b!631861))

(assert (= (and b!631861 res!408540) b!631863))

(assert (= (and b!631863 res!408538) b!631857))

(assert (= (and b!631857 res!408544) b!631859))

(assert (= (and b!631857 c!72029) b!631864))

(assert (= (and b!631857 (not c!72029)) b!631871))

(assert (= (and b!631857 (not res!408545)) b!631860))

(declare-fun m!606723 () Bool)

(assert (=> b!631865 m!606723))

(declare-fun m!606725 () Bool)

(assert (=> b!631868 m!606725))

(declare-fun m!606727 () Bool)

(assert (=> b!631869 m!606727))

(assert (=> b!631869 m!606727))

(declare-fun m!606729 () Bool)

(assert (=> b!631869 m!606729))

(declare-fun m!606731 () Bool)

(assert (=> b!631867 m!606731))

(declare-fun m!606733 () Bool)

(assert (=> b!631866 m!606733))

(declare-fun m!606735 () Bool)

(assert (=> b!631861 m!606735))

(declare-fun m!606737 () Bool)

(assert (=> b!631861 m!606737))

(assert (=> b!631860 m!606735))

(declare-fun m!606739 () Bool)

(assert (=> b!631860 m!606739))

(assert (=> b!631860 m!606727))

(declare-fun m!606741 () Bool)

(assert (=> b!631857 m!606741))

(declare-fun m!606743 () Bool)

(assert (=> b!631857 m!606743))

(assert (=> b!631857 m!606727))

(assert (=> b!631857 m!606735))

(declare-fun m!606745 () Bool)

(assert (=> b!631857 m!606745))

(assert (=> b!631857 m!606727))

(declare-fun m!606747 () Bool)

(assert (=> b!631857 m!606747))

(declare-fun m!606749 () Bool)

(assert (=> b!631857 m!606749))

(declare-fun m!606751 () Bool)

(assert (=> b!631857 m!606751))

(declare-fun m!606753 () Bool)

(assert (=> b!631858 m!606753))

(declare-fun m!606755 () Bool)

(assert (=> b!631862 m!606755))

(declare-fun m!606757 () Bool)

(assert (=> start!57090 m!606757))

(declare-fun m!606759 () Bool)

(assert (=> start!57090 m!606759))

(declare-fun m!606761 () Bool)

(assert (=> b!631863 m!606761))

(assert (=> b!631863 m!606727))

(assert (=> b!631863 m!606727))

(declare-fun m!606763 () Bool)

(assert (=> b!631863 m!606763))

(push 1)

