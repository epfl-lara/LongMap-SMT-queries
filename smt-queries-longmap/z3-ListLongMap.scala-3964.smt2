; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53778 () Bool)

(assert start!53778)

(declare-fun b!586794 () Bool)

(declare-fun res!374752 () Bool)

(declare-fun e!335260 () Bool)

(assert (=> b!586794 (=> (not res!374752) (not e!335260))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36693 0))(
  ( (array!36694 (arr!17621 (Array (_ BitVec 32) (_ BitVec 64))) (size!17986 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36693)

(assert (=> b!586794 (= res!374752 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17621 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17621 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!374759 () Bool)

(declare-fun e!335262 () Bool)

(assert (=> start!53778 (=> (not res!374759) (not e!335262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53778 (= res!374759 (validMask!0 mask!3053))))

(assert (=> start!53778 e!335262))

(assert (=> start!53778 true))

(declare-fun array_inv!13504 (array!36693) Bool)

(assert (=> start!53778 (array_inv!13504 a!2986)))

(declare-fun b!586795 () Bool)

(declare-fun res!374760 () Bool)

(assert (=> b!586795 (=> (not res!374760) (not e!335260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36693 (_ BitVec 32)) Bool)

(assert (=> b!586795 (= res!374760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586796 () Bool)

(declare-fun res!374762 () Bool)

(assert (=> b!586796 (=> (not res!374762) (not e!335260))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6058 0))(
  ( (MissingZero!6058 (index!26459 (_ BitVec 32))) (Found!6058 (index!26460 (_ BitVec 32))) (Intermediate!6058 (undefined!6870 Bool) (index!26461 (_ BitVec 32)) (x!55274 (_ BitVec 32))) (Undefined!6058) (MissingVacant!6058 (index!26462 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36693 (_ BitVec 32)) SeekEntryResult!6058)

(assert (=> b!586796 (= res!374762 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053) (Found!6058 j!136)))))

(declare-fun b!586797 () Bool)

(declare-fun res!374753 () Bool)

(assert (=> b!586797 (=> (not res!374753) (not e!335260))))

(assert (=> b!586797 (= res!374753 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17621 a!2986) index!984) (select (arr!17621 a!2986) j!136))) (not (= (select (arr!17621 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586798 () Bool)

(declare-fun res!374755 () Bool)

(assert (=> b!586798 (=> (not res!374755) (not e!335262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586798 (= res!374755 (validKeyInArray!0 k0!1786))))

(declare-fun b!586799 () Bool)

(declare-fun res!374761 () Bool)

(assert (=> b!586799 (=> (not res!374761) (not e!335260))))

(declare-datatypes ((List!11701 0))(
  ( (Nil!11698) (Cons!11697 (h!12742 (_ BitVec 64)) (t!17920 List!11701)) )
))
(declare-fun arrayNoDuplicates!0 (array!36693 (_ BitVec 32) List!11701) Bool)

(assert (=> b!586799 (= res!374761 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11698))))

(declare-fun b!586800 () Bool)

(declare-fun res!374758 () Bool)

(assert (=> b!586800 (=> (not res!374758) (not e!335262))))

(assert (=> b!586800 (= res!374758 (and (= (size!17986 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17986 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17986 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586801 () Bool)

(assert (=> b!586801 (= e!335262 e!335260)))

(declare-fun res!374754 () Bool)

(assert (=> b!586801 (=> (not res!374754) (not e!335260))))

(declare-fun lt!266031 () SeekEntryResult!6058)

(assert (=> b!586801 (= res!374754 (or (= lt!266031 (MissingZero!6058 i!1108)) (= lt!266031 (MissingVacant!6058 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36693 (_ BitVec 32)) SeekEntryResult!6058)

(assert (=> b!586801 (= lt!266031 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586802 () Bool)

(declare-fun res!374756 () Bool)

(assert (=> b!586802 (=> (not res!374756) (not e!335262))))

(assert (=> b!586802 (= res!374756 (validKeyInArray!0 (select (arr!17621 a!2986) j!136)))))

(declare-fun b!586803 () Bool)

(declare-fun res!374757 () Bool)

(assert (=> b!586803 (=> (not res!374757) (not e!335262))))

(declare-fun arrayContainsKey!0 (array!36693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586803 (= res!374757 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586804 () Bool)

(declare-fun lt!266032 () (_ BitVec 32))

(assert (=> b!586804 (= e!335260 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (and (bvsge lt!266032 #b00000000000000000000000000000000) (bvslt lt!266032 (bvadd #b00000000000000000000000000000001 mask!3053))))))))

(assert (=> b!586804 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 (select (store (arr!17621 a!2986) i!1108 k0!1786) j!136) (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18222 0))(
  ( (Unit!18223) )
))
(declare-fun lt!266030 () Unit!18222)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36693 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18222)

(assert (=> b!586804 (= lt!266030 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586804 (= lt!266032 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53778 res!374759) b!586800))

(assert (= (and b!586800 res!374758) b!586802))

(assert (= (and b!586802 res!374756) b!586798))

(assert (= (and b!586798 res!374755) b!586803))

(assert (= (and b!586803 res!374757) b!586801))

(assert (= (and b!586801 res!374754) b!586795))

(assert (= (and b!586795 res!374760) b!586799))

(assert (= (and b!586799 res!374761) b!586794))

(assert (= (and b!586794 res!374752) b!586796))

(assert (= (and b!586796 res!374762) b!586797))

(assert (= (and b!586797 res!374753) b!586804))

(declare-fun m!564733 () Bool)

(assert (=> b!586798 m!564733))

(declare-fun m!564735 () Bool)

(assert (=> b!586802 m!564735))

(assert (=> b!586802 m!564735))

(declare-fun m!564737 () Bool)

(assert (=> b!586802 m!564737))

(declare-fun m!564739 () Bool)

(assert (=> b!586797 m!564739))

(assert (=> b!586797 m!564735))

(declare-fun m!564741 () Bool)

(assert (=> b!586804 m!564741))

(declare-fun m!564743 () Bool)

(assert (=> b!586804 m!564743))

(assert (=> b!586804 m!564735))

(declare-fun m!564745 () Bool)

(assert (=> b!586804 m!564745))

(assert (=> b!586804 m!564743))

(declare-fun m!564747 () Bool)

(assert (=> b!586804 m!564747))

(declare-fun m!564749 () Bool)

(assert (=> b!586804 m!564749))

(assert (=> b!586804 m!564735))

(declare-fun m!564751 () Bool)

(assert (=> b!586804 m!564751))

(declare-fun m!564753 () Bool)

(assert (=> b!586803 m!564753))

(declare-fun m!564755 () Bool)

(assert (=> start!53778 m!564755))

(declare-fun m!564757 () Bool)

(assert (=> start!53778 m!564757))

(declare-fun m!564759 () Bool)

(assert (=> b!586794 m!564759))

(assert (=> b!586794 m!564745))

(declare-fun m!564761 () Bool)

(assert (=> b!586794 m!564761))

(declare-fun m!564763 () Bool)

(assert (=> b!586799 m!564763))

(declare-fun m!564765 () Bool)

(assert (=> b!586795 m!564765))

(declare-fun m!564767 () Bool)

(assert (=> b!586801 m!564767))

(assert (=> b!586796 m!564735))

(assert (=> b!586796 m!564735))

(declare-fun m!564769 () Bool)

(assert (=> b!586796 m!564769))

(check-sat (not b!586798) (not b!586801) (not b!586804) (not b!586796) (not b!586799) (not b!586802) (not b!586803) (not b!586795) (not start!53778))
(check-sat)
(get-model)

(declare-fun d!85689 () Bool)

(assert (=> d!85689 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!586798 d!85689))

(declare-fun d!85691 () Bool)

(declare-fun res!374833 () Bool)

(declare-fun e!335285 () Bool)

(assert (=> d!85691 (=> res!374833 e!335285)))

(assert (=> d!85691 (= res!374833 (= (select (arr!17621 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85691 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!335285)))

(declare-fun b!586875 () Bool)

(declare-fun e!335286 () Bool)

(assert (=> b!586875 (= e!335285 e!335286)))

(declare-fun res!374834 () Bool)

(assert (=> b!586875 (=> (not res!374834) (not e!335286))))

(assert (=> b!586875 (= res!374834 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17986 a!2986)))))

(declare-fun b!586876 () Bool)

(assert (=> b!586876 (= e!335286 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85691 (not res!374833)) b!586875))

(assert (= (and b!586875 res!374834) b!586876))

(declare-fun m!564847 () Bool)

(assert (=> d!85691 m!564847))

(declare-fun m!564849 () Bool)

(assert (=> b!586876 m!564849))

(assert (=> b!586803 d!85691))

(declare-fun b!586889 () Bool)

(declare-fun e!335294 () SeekEntryResult!6058)

(assert (=> b!586889 (= e!335294 (MissingVacant!6058 vacantSpotIndex!68))))

(declare-fun b!586890 () Bool)

(declare-fun e!335295 () SeekEntryResult!6058)

(declare-fun e!335293 () SeekEntryResult!6058)

(assert (=> b!586890 (= e!335295 e!335293)))

(declare-fun c!66394 () Bool)

(declare-fun lt!266055 () (_ BitVec 64))

(assert (=> b!586890 (= c!66394 (= lt!266055 (select (arr!17621 a!2986) j!136)))))

(declare-fun b!586891 () Bool)

(assert (=> b!586891 (= e!335294 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266032 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!586892 () Bool)

(assert (=> b!586892 (= e!335295 Undefined!6058)))

(declare-fun b!586893 () Bool)

(declare-fun c!66395 () Bool)

(assert (=> b!586893 (= c!66395 (= lt!266055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!586893 (= e!335293 e!335294)))

(declare-fun b!586894 () Bool)

(assert (=> b!586894 (= e!335293 (Found!6058 lt!266032))))

(declare-fun d!85693 () Bool)

(declare-fun lt!266056 () SeekEntryResult!6058)

(get-info :version)

(assert (=> d!85693 (and (or ((_ is Undefined!6058) lt!266056) (not ((_ is Found!6058) lt!266056)) (and (bvsge (index!26460 lt!266056) #b00000000000000000000000000000000) (bvslt (index!26460 lt!266056) (size!17986 a!2986)))) (or ((_ is Undefined!6058) lt!266056) ((_ is Found!6058) lt!266056) (not ((_ is MissingVacant!6058) lt!266056)) (not (= (index!26462 lt!266056) vacantSpotIndex!68)) (and (bvsge (index!26462 lt!266056) #b00000000000000000000000000000000) (bvslt (index!26462 lt!266056) (size!17986 a!2986)))) (or ((_ is Undefined!6058) lt!266056) (ite ((_ is Found!6058) lt!266056) (= (select (arr!17621 a!2986) (index!26460 lt!266056)) (select (arr!17621 a!2986) j!136)) (and ((_ is MissingVacant!6058) lt!266056) (= (index!26462 lt!266056) vacantSpotIndex!68) (= (select (arr!17621 a!2986) (index!26462 lt!266056)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85693 (= lt!266056 e!335295)))

(declare-fun c!66396 () Bool)

(assert (=> d!85693 (= c!66396 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85693 (= lt!266055 (select (arr!17621 a!2986) lt!266032))))

(assert (=> d!85693 (validMask!0 mask!3053)))

(assert (=> d!85693 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053) lt!266056)))

(assert (= (and d!85693 c!66396) b!586892))

(assert (= (and d!85693 (not c!66396)) b!586890))

(assert (= (and b!586890 c!66394) b!586894))

(assert (= (and b!586890 (not c!66394)) b!586893))

(assert (= (and b!586893 c!66395) b!586889))

(assert (= (and b!586893 (not c!66395)) b!586891))

(declare-fun m!564851 () Bool)

(assert (=> b!586891 m!564851))

(assert (=> b!586891 m!564851))

(assert (=> b!586891 m!564735))

(declare-fun m!564853 () Bool)

(assert (=> b!586891 m!564853))

(declare-fun m!564855 () Bool)

(assert (=> d!85693 m!564855))

(declare-fun m!564857 () Bool)

(assert (=> d!85693 m!564857))

(declare-fun m!564859 () Bool)

(assert (=> d!85693 m!564859))

(assert (=> d!85693 m!564755))

(assert (=> b!586804 d!85693))

(declare-fun b!586895 () Bool)

(declare-fun e!335297 () SeekEntryResult!6058)

(assert (=> b!586895 (= e!335297 (MissingVacant!6058 vacantSpotIndex!68))))

(declare-fun b!586896 () Bool)

(declare-fun e!335298 () SeekEntryResult!6058)

(declare-fun e!335296 () SeekEntryResult!6058)

(assert (=> b!586896 (= e!335298 e!335296)))

(declare-fun lt!266057 () (_ BitVec 64))

(declare-fun c!66397 () Bool)

(assert (=> b!586896 (= c!66397 (= lt!266057 (select (store (arr!17621 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun b!586897 () Bool)

(assert (=> b!586897 (= e!335297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266032 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (store (arr!17621 a!2986) i!1108 k0!1786) j!136) (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986)) mask!3053))))

(declare-fun b!586898 () Bool)

(assert (=> b!586898 (= e!335298 Undefined!6058)))

(declare-fun b!586899 () Bool)

(declare-fun c!66398 () Bool)

(assert (=> b!586899 (= c!66398 (= lt!266057 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!586899 (= e!335296 e!335297)))

(declare-fun b!586900 () Bool)

(assert (=> b!586900 (= e!335296 (Found!6058 lt!266032))))

(declare-fun d!85697 () Bool)

(declare-fun lt!266058 () SeekEntryResult!6058)

(assert (=> d!85697 (and (or ((_ is Undefined!6058) lt!266058) (not ((_ is Found!6058) lt!266058)) (and (bvsge (index!26460 lt!266058) #b00000000000000000000000000000000) (bvslt (index!26460 lt!266058) (size!17986 (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986)))))) (or ((_ is Undefined!6058) lt!266058) ((_ is Found!6058) lt!266058) (not ((_ is MissingVacant!6058) lt!266058)) (not (= (index!26462 lt!266058) vacantSpotIndex!68)) (and (bvsge (index!26462 lt!266058) #b00000000000000000000000000000000) (bvslt (index!26462 lt!266058) (size!17986 (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986)))))) (or ((_ is Undefined!6058) lt!266058) (ite ((_ is Found!6058) lt!266058) (= (select (arr!17621 (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986))) (index!26460 lt!266058)) (select (store (arr!17621 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6058) lt!266058) (= (index!26462 lt!266058) vacantSpotIndex!68) (= (select (arr!17621 (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986))) (index!26462 lt!266058)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85697 (= lt!266058 e!335298)))

(declare-fun c!66399 () Bool)

(assert (=> d!85697 (= c!66399 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85697 (= lt!266057 (select (arr!17621 (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986))) lt!266032))))

(assert (=> d!85697 (validMask!0 mask!3053)))

(assert (=> d!85697 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 (select (store (arr!17621 a!2986) i!1108 k0!1786) j!136) (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986)) mask!3053) lt!266058)))

(assert (= (and d!85697 c!66399) b!586898))

(assert (= (and d!85697 (not c!66399)) b!586896))

(assert (= (and b!586896 c!66397) b!586900))

(assert (= (and b!586896 (not c!66397)) b!586899))

(assert (= (and b!586899 c!66398) b!586895))

(assert (= (and b!586899 (not c!66398)) b!586897))

(assert (=> b!586897 m!564851))

(assert (=> b!586897 m!564851))

(assert (=> b!586897 m!564743))

(declare-fun m!564861 () Bool)

(assert (=> b!586897 m!564861))

(declare-fun m!564863 () Bool)

(assert (=> d!85697 m!564863))

(declare-fun m!564865 () Bool)

(assert (=> d!85697 m!564865))

(declare-fun m!564867 () Bool)

(assert (=> d!85697 m!564867))

(assert (=> d!85697 m!564755))

(assert (=> b!586804 d!85697))

(declare-fun d!85703 () Bool)

(declare-fun e!335325 () Bool)

(assert (=> d!85703 e!335325))

(declare-fun res!374852 () Bool)

(assert (=> d!85703 (=> (not res!374852) (not e!335325))))

(assert (=> d!85703 (= res!374852 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17986 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17986 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17986 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17986 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17986 a!2986))))))

(declare-fun lt!266065 () Unit!18222)

(declare-fun choose!9 (array!36693 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18222)

(assert (=> d!85703 (= lt!266065 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 mask!3053))))

(assert (=> d!85703 (validMask!0 mask!3053)))

(assert (=> d!85703 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 mask!3053) lt!266065)))

(declare-fun b!586936 () Bool)

(assert (=> b!586936 (= e!335325 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266032 vacantSpotIndex!68 (select (store (arr!17621 a!2986) i!1108 k0!1786) j!136) (array!36694 (store (arr!17621 a!2986) i!1108 k0!1786) (size!17986 a!2986)) mask!3053)))))

(assert (= (and d!85703 res!374852) b!586936))

(declare-fun m!564879 () Bool)

(assert (=> d!85703 m!564879))

(assert (=> d!85703 m!564755))

(assert (=> b!586936 m!564735))

(assert (=> b!586936 m!564751))

(assert (=> b!586936 m!564743))

(assert (=> b!586936 m!564747))

(assert (=> b!586936 m!564743))

(assert (=> b!586936 m!564745))

(assert (=> b!586936 m!564735))

(assert (=> b!586804 d!85703))

(declare-fun d!85715 () Bool)

(declare-fun lt!266072 () (_ BitVec 32))

(assert (=> d!85715 (and (bvsge lt!266072 #b00000000000000000000000000000000) (bvslt lt!266072 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85715 (= lt!266072 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!85715 (validMask!0 mask!3053)))

(assert (=> d!85715 (= (nextIndex!0 index!984 x!910 mask!3053) lt!266072)))

(declare-fun bs!18145 () Bool)

(assert (= bs!18145 d!85715))

(declare-fun m!564899 () Bool)

(assert (=> bs!18145 m!564899))

(assert (=> bs!18145 m!564755))

(assert (=> b!586804 d!85715))

(declare-fun b!586959 () Bool)

(declare-fun e!335341 () Bool)

(declare-fun contains!2887 (List!11701 (_ BitVec 64)) Bool)

(assert (=> b!586959 (= e!335341 (contains!2887 Nil!11698 (select (arr!17621 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!586960 () Bool)

(declare-fun e!335340 () Bool)

(declare-fun call!32758 () Bool)

(assert (=> b!586960 (= e!335340 call!32758)))

(declare-fun d!85721 () Bool)

(declare-fun res!374859 () Bool)

(declare-fun e!335342 () Bool)

(assert (=> d!85721 (=> res!374859 e!335342)))

(assert (=> d!85721 (= res!374859 (bvsge #b00000000000000000000000000000000 (size!17986 a!2986)))))

(assert (=> d!85721 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11698) e!335342)))

(declare-fun b!586961 () Bool)

(assert (=> b!586961 (= e!335340 call!32758)))

(declare-fun b!586962 () Bool)

(declare-fun e!335343 () Bool)

(assert (=> b!586962 (= e!335342 e!335343)))

(declare-fun res!374860 () Bool)

(assert (=> b!586962 (=> (not res!374860) (not e!335343))))

(assert (=> b!586962 (= res!374860 (not e!335341))))

(declare-fun res!374861 () Bool)

(assert (=> b!586962 (=> (not res!374861) (not e!335341))))

(assert (=> b!586962 (= res!374861 (validKeyInArray!0 (select (arr!17621 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!586963 () Bool)

(assert (=> b!586963 (= e!335343 e!335340)))

(declare-fun c!66417 () Bool)

(assert (=> b!586963 (= c!66417 (validKeyInArray!0 (select (arr!17621 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32755 () Bool)

(assert (=> bm!32755 (= call!32758 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66417 (Cons!11697 (select (arr!17621 a!2986) #b00000000000000000000000000000000) Nil!11698) Nil!11698)))))

(assert (= (and d!85721 (not res!374859)) b!586962))

(assert (= (and b!586962 res!374861) b!586959))

(assert (= (and b!586962 res!374860) b!586963))

(assert (= (and b!586963 c!66417) b!586961))

(assert (= (and b!586963 (not c!66417)) b!586960))

(assert (= (or b!586961 b!586960) bm!32755))

(assert (=> b!586959 m!564847))

(assert (=> b!586959 m!564847))

(declare-fun m!564901 () Bool)

(assert (=> b!586959 m!564901))

(assert (=> b!586962 m!564847))

(assert (=> b!586962 m!564847))

(declare-fun m!564903 () Bool)

(assert (=> b!586962 m!564903))

(assert (=> b!586963 m!564847))

(assert (=> b!586963 m!564847))

(assert (=> b!586963 m!564903))

(assert (=> bm!32755 m!564847))

(declare-fun m!564905 () Bool)

(assert (=> bm!32755 m!564905))

(assert (=> b!586799 d!85721))

(declare-fun d!85727 () Bool)

(declare-fun lt!266102 () SeekEntryResult!6058)

(assert (=> d!85727 (and (or ((_ is Undefined!6058) lt!266102) (not ((_ is Found!6058) lt!266102)) (and (bvsge (index!26460 lt!266102) #b00000000000000000000000000000000) (bvslt (index!26460 lt!266102) (size!17986 a!2986)))) (or ((_ is Undefined!6058) lt!266102) ((_ is Found!6058) lt!266102) (not ((_ is MissingZero!6058) lt!266102)) (and (bvsge (index!26459 lt!266102) #b00000000000000000000000000000000) (bvslt (index!26459 lt!266102) (size!17986 a!2986)))) (or ((_ is Undefined!6058) lt!266102) ((_ is Found!6058) lt!266102) ((_ is MissingZero!6058) lt!266102) (not ((_ is MissingVacant!6058) lt!266102)) (and (bvsge (index!26462 lt!266102) #b00000000000000000000000000000000) (bvslt (index!26462 lt!266102) (size!17986 a!2986)))) (or ((_ is Undefined!6058) lt!266102) (ite ((_ is Found!6058) lt!266102) (= (select (arr!17621 a!2986) (index!26460 lt!266102)) k0!1786) (ite ((_ is MissingZero!6058) lt!266102) (= (select (arr!17621 a!2986) (index!26459 lt!266102)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6058) lt!266102) (= (select (arr!17621 a!2986) (index!26462 lt!266102)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!335391 () SeekEntryResult!6058)

(assert (=> d!85727 (= lt!266102 e!335391)))

(declare-fun c!66442 () Bool)

(declare-fun lt!266103 () SeekEntryResult!6058)

(assert (=> d!85727 (= c!66442 (and ((_ is Intermediate!6058) lt!266103) (undefined!6870 lt!266103)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36693 (_ BitVec 32)) SeekEntryResult!6058)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85727 (= lt!266103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85727 (validMask!0 mask!3053)))

(assert (=> d!85727 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!266102)))

(declare-fun b!587034 () Bool)

(declare-fun e!335393 () SeekEntryResult!6058)

(assert (=> b!587034 (= e!335393 (Found!6058 (index!26461 lt!266103)))))

(declare-fun b!587035 () Bool)

(assert (=> b!587035 (= e!335391 e!335393)))

(declare-fun lt!266101 () (_ BitVec 64))

(assert (=> b!587035 (= lt!266101 (select (arr!17621 a!2986) (index!26461 lt!266103)))))

(declare-fun c!66441 () Bool)

(assert (=> b!587035 (= c!66441 (= lt!266101 k0!1786))))

(declare-fun b!587036 () Bool)

(declare-fun e!335392 () SeekEntryResult!6058)

(assert (=> b!587036 (= e!335392 (seekKeyOrZeroReturnVacant!0 (x!55274 lt!266103) (index!26461 lt!266103) (index!26461 lt!266103) k0!1786 a!2986 mask!3053))))

(declare-fun b!587037 () Bool)

(declare-fun c!66443 () Bool)

(assert (=> b!587037 (= c!66443 (= lt!266101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587037 (= e!335393 e!335392)))

(declare-fun b!587038 () Bool)

(assert (=> b!587038 (= e!335391 Undefined!6058)))

(declare-fun b!587039 () Bool)

(assert (=> b!587039 (= e!335392 (MissingZero!6058 (index!26461 lt!266103)))))

(assert (= (and d!85727 c!66442) b!587038))

(assert (= (and d!85727 (not c!66442)) b!587035))

(assert (= (and b!587035 c!66441) b!587034))

(assert (= (and b!587035 (not c!66441)) b!587037))

(assert (= (and b!587037 c!66443) b!587039))

(assert (= (and b!587037 (not c!66443)) b!587036))

(declare-fun m!564939 () Bool)

(assert (=> d!85727 m!564939))

(assert (=> d!85727 m!564755))

(declare-fun m!564941 () Bool)

(assert (=> d!85727 m!564941))

(declare-fun m!564943 () Bool)

(assert (=> d!85727 m!564943))

(declare-fun m!564947 () Bool)

(assert (=> d!85727 m!564947))

(assert (=> d!85727 m!564939))

(declare-fun m!564949 () Bool)

(assert (=> d!85727 m!564949))

(declare-fun m!564953 () Bool)

(assert (=> b!587035 m!564953))

(declare-fun m!564959 () Bool)

(assert (=> b!587036 m!564959))

(assert (=> b!586801 d!85727))

(declare-fun d!85743 () Bool)

(assert (=> d!85743 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53778 d!85743))

(declare-fun d!85757 () Bool)

(assert (=> d!85757 (= (array_inv!13504 a!2986) (bvsge (size!17986 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53778 d!85757))

(declare-fun d!85759 () Bool)

(declare-fun res!374900 () Bool)

(declare-fun e!335429 () Bool)

(assert (=> d!85759 (=> res!374900 e!335429)))

(assert (=> d!85759 (= res!374900 (bvsge #b00000000000000000000000000000000 (size!17986 a!2986)))))

(assert (=> d!85759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!335429)))

(declare-fun b!587095 () Bool)

(declare-fun e!335428 () Bool)

(assert (=> b!587095 (= e!335429 e!335428)))

(declare-fun c!66465 () Bool)

(assert (=> b!587095 (= c!66465 (validKeyInArray!0 (select (arr!17621 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!587096 () Bool)

(declare-fun call!32770 () Bool)

(assert (=> b!587096 (= e!335428 call!32770)))

(declare-fun bm!32767 () Bool)

(assert (=> bm!32767 (= call!32770 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!587097 () Bool)

(declare-fun e!335430 () Bool)

(assert (=> b!587097 (= e!335430 call!32770)))

(declare-fun b!587098 () Bool)

(assert (=> b!587098 (= e!335428 e!335430)))

(declare-fun lt!266141 () (_ BitVec 64))

(assert (=> b!587098 (= lt!266141 (select (arr!17621 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!266140 () Unit!18222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36693 (_ BitVec 64) (_ BitVec 32)) Unit!18222)

(assert (=> b!587098 (= lt!266140 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!266141 #b00000000000000000000000000000000))))

(assert (=> b!587098 (arrayContainsKey!0 a!2986 lt!266141 #b00000000000000000000000000000000)))

(declare-fun lt!266139 () Unit!18222)

(assert (=> b!587098 (= lt!266139 lt!266140)))

(declare-fun res!374899 () Bool)

(assert (=> b!587098 (= res!374899 (= (seekEntryOrOpen!0 (select (arr!17621 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6058 #b00000000000000000000000000000000)))))

(assert (=> b!587098 (=> (not res!374899) (not e!335430))))

(assert (= (and d!85759 (not res!374900)) b!587095))

(assert (= (and b!587095 c!66465) b!587098))

(assert (= (and b!587095 (not c!66465)) b!587096))

(assert (= (and b!587098 res!374899) b!587097))

(assert (= (or b!587097 b!587096) bm!32767))

(assert (=> b!587095 m!564847))

(assert (=> b!587095 m!564847))

(assert (=> b!587095 m!564903))

(declare-fun m!564999 () Bool)

(assert (=> bm!32767 m!564999))

(assert (=> b!587098 m!564847))

(declare-fun m!565001 () Bool)

(assert (=> b!587098 m!565001))

(declare-fun m!565003 () Bool)

(assert (=> b!587098 m!565003))

(assert (=> b!587098 m!564847))

(declare-fun m!565005 () Bool)

(assert (=> b!587098 m!565005))

(assert (=> b!586795 d!85759))

(declare-fun d!85763 () Bool)

(assert (=> d!85763 (= (validKeyInArray!0 (select (arr!17621 a!2986) j!136)) (and (not (= (select (arr!17621 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17621 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!586802 d!85763))

(declare-fun b!587099 () Bool)

(declare-fun e!335432 () SeekEntryResult!6058)

(assert (=> b!587099 (= e!335432 (MissingVacant!6058 vacantSpotIndex!68))))

(declare-fun b!587100 () Bool)

(declare-fun e!335433 () SeekEntryResult!6058)

(declare-fun e!335431 () SeekEntryResult!6058)

(assert (=> b!587100 (= e!335433 e!335431)))

(declare-fun c!66466 () Bool)

(declare-fun lt!266142 () (_ BitVec 64))

(assert (=> b!587100 (= c!66466 (= lt!266142 (select (arr!17621 a!2986) j!136)))))

(declare-fun b!587101 () Bool)

(assert (=> b!587101 (= e!335432 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587102 () Bool)

(assert (=> b!587102 (= e!335433 Undefined!6058)))

(declare-fun b!587103 () Bool)

(declare-fun c!66467 () Bool)

(assert (=> b!587103 (= c!66467 (= lt!266142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587103 (= e!335431 e!335432)))

(declare-fun b!587104 () Bool)

(assert (=> b!587104 (= e!335431 (Found!6058 index!984))))

(declare-fun lt!266143 () SeekEntryResult!6058)

(declare-fun d!85765 () Bool)

(assert (=> d!85765 (and (or ((_ is Undefined!6058) lt!266143) (not ((_ is Found!6058) lt!266143)) (and (bvsge (index!26460 lt!266143) #b00000000000000000000000000000000) (bvslt (index!26460 lt!266143) (size!17986 a!2986)))) (or ((_ is Undefined!6058) lt!266143) ((_ is Found!6058) lt!266143) (not ((_ is MissingVacant!6058) lt!266143)) (not (= (index!26462 lt!266143) vacantSpotIndex!68)) (and (bvsge (index!26462 lt!266143) #b00000000000000000000000000000000) (bvslt (index!26462 lt!266143) (size!17986 a!2986)))) (or ((_ is Undefined!6058) lt!266143) (ite ((_ is Found!6058) lt!266143) (= (select (arr!17621 a!2986) (index!26460 lt!266143)) (select (arr!17621 a!2986) j!136)) (and ((_ is MissingVacant!6058) lt!266143) (= (index!26462 lt!266143) vacantSpotIndex!68) (= (select (arr!17621 a!2986) (index!26462 lt!266143)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85765 (= lt!266143 e!335433)))

(declare-fun c!66468 () Bool)

(assert (=> d!85765 (= c!66468 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!85765 (= lt!266142 (select (arr!17621 a!2986) index!984))))

(assert (=> d!85765 (validMask!0 mask!3053)))

(assert (=> d!85765 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053) lt!266143)))

(assert (= (and d!85765 c!66468) b!587102))

(assert (= (and d!85765 (not c!66468)) b!587100))

(assert (= (and b!587100 c!66466) b!587104))

(assert (= (and b!587100 (not c!66466)) b!587103))

(assert (= (and b!587103 c!66467) b!587099))

(assert (= (and b!587103 (not c!66467)) b!587101))

(assert (=> b!587101 m!564741))

(assert (=> b!587101 m!564741))

(assert (=> b!587101 m!564735))

(declare-fun m!565007 () Bool)

(assert (=> b!587101 m!565007))

(declare-fun m!565009 () Bool)

(assert (=> d!85765 m!565009))

(declare-fun m!565011 () Bool)

(assert (=> d!85765 m!565011))

(assert (=> d!85765 m!564739))

(assert (=> d!85765 m!564755))

(assert (=> b!586796 d!85765))

(check-sat (not d!85765) (not b!587101) (not bm!32767) (not b!586963) (not d!85703) (not b!586959) (not b!586936) (not b!586962) (not d!85697) (not b!586876) (not d!85715) (not b!587098) (not b!587036) (not b!587095) (not d!85693) (not b!586891) (not bm!32755) (not d!85727) (not b!586897))
(check-sat)
