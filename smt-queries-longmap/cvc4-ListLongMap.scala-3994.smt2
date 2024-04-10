; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54158 () Bool)

(assert start!54158)

(declare-fun b!591648 () Bool)

(declare-fun e!337829 () Bool)

(declare-fun e!337833 () Bool)

(assert (=> b!591648 (= e!337829 (not e!337833))))

(declare-fun res!378576 () Bool)

(assert (=> b!591648 (=> res!378576 e!337833)))

(declare-datatypes ((SeekEntryResult!6154 0))(
  ( (MissingZero!6154 (index!26852 (_ BitVec 32))) (Found!6154 (index!26853 (_ BitVec 32))) (Intermediate!6154 (undefined!6966 Bool) (index!26854 (_ BitVec 32)) (x!55642 (_ BitVec 32))) (Undefined!6154) (MissingVacant!6154 (index!26855 (_ BitVec 32))) )
))
(declare-fun lt!268490 () SeekEntryResult!6154)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591648 (= res!378576 (not (= lt!268490 (Found!6154 index!984))))))

(declare-datatypes ((Unit!18534 0))(
  ( (Unit!18535) )
))
(declare-fun lt!268483 () Unit!18534)

(declare-fun e!337834 () Unit!18534)

(assert (=> b!591648 (= lt!268483 e!337834)))

(declare-fun c!66908 () Bool)

(assert (=> b!591648 (= c!66908 (= lt!268490 Undefined!6154))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!268488 () (_ BitVec 64))

(declare-datatypes ((array!36888 0))(
  ( (array!36889 (arr!17714 (Array (_ BitVec 32) (_ BitVec 64))) (size!18078 (_ BitVec 32))) )
))
(declare-fun lt!268484 () array!36888)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36888 (_ BitVec 32)) SeekEntryResult!6154)

(assert (=> b!591648 (= lt!268490 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268488 lt!268484 mask!3053))))

(declare-fun e!337830 () Bool)

(assert (=> b!591648 e!337830))

(declare-fun res!378581 () Bool)

(assert (=> b!591648 (=> (not res!378581) (not e!337830))))

(declare-fun lt!268485 () SeekEntryResult!6154)

(declare-fun lt!268487 () (_ BitVec 32))

(assert (=> b!591648 (= res!378581 (= lt!268485 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268487 vacantSpotIndex!68 lt!268488 lt!268484 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36888)

(assert (=> b!591648 (= lt!268485 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268487 vacantSpotIndex!68 (select (arr!17714 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!591648 (= lt!268488 (select (store (arr!17714 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268491 () Unit!18534)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36888 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18534)

(assert (=> b!591648 (= lt!268491 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268487 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591648 (= lt!268487 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591649 () Bool)

(declare-fun e!337836 () Bool)

(declare-fun e!337826 () Bool)

(assert (=> b!591649 (= e!337836 e!337826)))

(declare-fun res!378572 () Bool)

(assert (=> b!591649 (=> (not res!378572) (not e!337826))))

(assert (=> b!591649 (= res!378572 (= (select (store (arr!17714 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591649 (= lt!268484 (array!36889 (store (arr!17714 a!2986) i!1108 k!1786) (size!18078 a!2986)))))

(declare-fun b!591650 () Bool)

(declare-fun res!378569 () Bool)

(declare-fun e!337831 () Bool)

(assert (=> b!591650 (=> (not res!378569) (not e!337831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591650 (= res!378569 (validKeyInArray!0 (select (arr!17714 a!2986) j!136)))))

(declare-fun b!591651 () Bool)

(declare-fun res!378579 () Bool)

(assert (=> b!591651 (=> (not res!378579) (not e!337836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36888 (_ BitVec 32)) Bool)

(assert (=> b!591651 (= res!378579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591652 () Bool)

(declare-fun res!378578 () Bool)

(assert (=> b!591652 (=> (not res!378578) (not e!337831))))

(assert (=> b!591652 (= res!378578 (and (= (size!18078 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18078 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18078 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591653 () Bool)

(assert (=> b!591653 (= e!337826 e!337829)))

(declare-fun res!378573 () Bool)

(assert (=> b!591653 (=> (not res!378573) (not e!337829))))

(declare-fun lt!268489 () SeekEntryResult!6154)

(assert (=> b!591653 (= res!378573 (and (= lt!268489 (Found!6154 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17714 a!2986) index!984) (select (arr!17714 a!2986) j!136))) (not (= (select (arr!17714 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591653 (= lt!268489 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17714 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591654 () Bool)

(declare-fun Unit!18536 () Unit!18534)

(assert (=> b!591654 (= e!337834 Unit!18536)))

(assert (=> b!591654 false))

(declare-fun b!591655 () Bool)

(assert (=> b!591655 (= e!337833 true)))

(declare-fun e!337835 () Bool)

(assert (=> b!591655 e!337835))

(declare-fun res!378574 () Bool)

(assert (=> b!591655 (=> (not res!378574) (not e!337835))))

(declare-fun lt!268492 () (_ BitVec 64))

(assert (=> b!591655 (= res!378574 (= lt!268492 (select (arr!17714 a!2986) j!136)))))

(assert (=> b!591655 (= lt!268492 (select (store (arr!17714 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591656 () Bool)

(declare-fun e!337832 () Bool)

(declare-fun arrayContainsKey!0 (array!36888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591656 (= e!337832 (arrayContainsKey!0 lt!268484 (select (arr!17714 a!2986) j!136) index!984))))

(declare-fun b!591657 () Bool)

(declare-fun res!378570 () Bool)

(assert (=> b!591657 (=> (not res!378570) (not e!337836))))

(assert (=> b!591657 (= res!378570 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17714 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591658 () Bool)

(declare-fun e!337828 () Bool)

(assert (=> b!591658 (= e!337828 e!337832)))

(declare-fun res!378567 () Bool)

(assert (=> b!591658 (=> (not res!378567) (not e!337832))))

(assert (=> b!591658 (= res!378567 (arrayContainsKey!0 lt!268484 (select (arr!17714 a!2986) j!136) j!136))))

(declare-fun res!378580 () Bool)

(assert (=> start!54158 (=> (not res!378580) (not e!337831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54158 (= res!378580 (validMask!0 mask!3053))))

(assert (=> start!54158 e!337831))

(assert (=> start!54158 true))

(declare-fun array_inv!13510 (array!36888) Bool)

(assert (=> start!54158 (array_inv!13510 a!2986)))

(declare-fun b!591659 () Bool)

(declare-fun res!378568 () Bool)

(assert (=> b!591659 (=> (not res!378568) (not e!337831))))

(assert (=> b!591659 (= res!378568 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591660 () Bool)

(assert (=> b!591660 (= e!337831 e!337836)))

(declare-fun res!378577 () Bool)

(assert (=> b!591660 (=> (not res!378577) (not e!337836))))

(declare-fun lt!268486 () SeekEntryResult!6154)

(assert (=> b!591660 (= res!378577 (or (= lt!268486 (MissingZero!6154 i!1108)) (= lt!268486 (MissingVacant!6154 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36888 (_ BitVec 32)) SeekEntryResult!6154)

(assert (=> b!591660 (= lt!268486 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591661 () Bool)

(declare-fun res!378575 () Bool)

(assert (=> b!591661 (=> (not res!378575) (not e!337831))))

(assert (=> b!591661 (= res!378575 (validKeyInArray!0 k!1786))))

(declare-fun b!591662 () Bool)

(declare-fun Unit!18537 () Unit!18534)

(assert (=> b!591662 (= e!337834 Unit!18537)))

(declare-fun b!591663 () Bool)

(assert (=> b!591663 (= e!337830 (= lt!268489 lt!268485))))

(declare-fun b!591664 () Bool)

(declare-fun res!378566 () Bool)

(assert (=> b!591664 (=> (not res!378566) (not e!337836))))

(declare-datatypes ((List!11755 0))(
  ( (Nil!11752) (Cons!11751 (h!12796 (_ BitVec 64)) (t!17983 List!11755)) )
))
(declare-fun arrayNoDuplicates!0 (array!36888 (_ BitVec 32) List!11755) Bool)

(assert (=> b!591664 (= res!378566 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11752))))

(declare-fun b!591665 () Bool)

(assert (=> b!591665 (= e!337835 e!337828)))

(declare-fun res!378571 () Bool)

(assert (=> b!591665 (=> res!378571 e!337828)))

(assert (=> b!591665 (= res!378571 (or (not (= (select (arr!17714 a!2986) j!136) lt!268488)) (not (= (select (arr!17714 a!2986) j!136) lt!268492)) (bvsge j!136 index!984)))))

(assert (= (and start!54158 res!378580) b!591652))

(assert (= (and b!591652 res!378578) b!591650))

(assert (= (and b!591650 res!378569) b!591661))

(assert (= (and b!591661 res!378575) b!591659))

(assert (= (and b!591659 res!378568) b!591660))

(assert (= (and b!591660 res!378577) b!591651))

(assert (= (and b!591651 res!378579) b!591664))

(assert (= (and b!591664 res!378566) b!591657))

(assert (= (and b!591657 res!378570) b!591649))

(assert (= (and b!591649 res!378572) b!591653))

(assert (= (and b!591653 res!378573) b!591648))

(assert (= (and b!591648 res!378581) b!591663))

(assert (= (and b!591648 c!66908) b!591654))

(assert (= (and b!591648 (not c!66908)) b!591662))

(assert (= (and b!591648 (not res!378576)) b!591655))

(assert (= (and b!591655 res!378574) b!591665))

(assert (= (and b!591665 (not res!378571)) b!591658))

(assert (= (and b!591658 res!378567) b!591656))

(declare-fun m!569865 () Bool)

(assert (=> b!591650 m!569865))

(assert (=> b!591650 m!569865))

(declare-fun m!569867 () Bool)

(assert (=> b!591650 m!569867))

(declare-fun m!569869 () Bool)

(assert (=> b!591649 m!569869))

(declare-fun m!569871 () Bool)

(assert (=> b!591649 m!569871))

(declare-fun m!569873 () Bool)

(assert (=> b!591659 m!569873))

(declare-fun m!569875 () Bool)

(assert (=> b!591648 m!569875))

(declare-fun m!569877 () Bool)

(assert (=> b!591648 m!569877))

(assert (=> b!591648 m!569865))

(assert (=> b!591648 m!569869))

(declare-fun m!569879 () Bool)

(assert (=> b!591648 m!569879))

(assert (=> b!591648 m!569865))

(declare-fun m!569881 () Bool)

(assert (=> b!591648 m!569881))

(declare-fun m!569883 () Bool)

(assert (=> b!591648 m!569883))

(declare-fun m!569885 () Bool)

(assert (=> b!591648 m!569885))

(assert (=> b!591656 m!569865))

(assert (=> b!591656 m!569865))

(declare-fun m!569887 () Bool)

(assert (=> b!591656 m!569887))

(assert (=> b!591658 m!569865))

(assert (=> b!591658 m!569865))

(declare-fun m!569889 () Bool)

(assert (=> b!591658 m!569889))

(assert (=> b!591665 m!569865))

(assert (=> b!591655 m!569865))

(assert (=> b!591655 m!569869))

(declare-fun m!569891 () Bool)

(assert (=> b!591655 m!569891))

(declare-fun m!569893 () Bool)

(assert (=> b!591664 m!569893))

(declare-fun m!569895 () Bool)

(assert (=> b!591651 m!569895))

(declare-fun m!569897 () Bool)

(assert (=> b!591657 m!569897))

(declare-fun m!569899 () Bool)

(assert (=> start!54158 m!569899))

(declare-fun m!569901 () Bool)

(assert (=> start!54158 m!569901))

(declare-fun m!569903 () Bool)

(assert (=> b!591661 m!569903))

(declare-fun m!569905 () Bool)

(assert (=> b!591660 m!569905))

(declare-fun m!569907 () Bool)

(assert (=> b!591653 m!569907))

(assert (=> b!591653 m!569865))

(assert (=> b!591653 m!569865))

(declare-fun m!569909 () Bool)

(assert (=> b!591653 m!569909))

(push 1)

