; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54162 () Bool)

(assert start!54162)

(declare-fun b!591756 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!36892 0))(
  ( (array!36893 (arr!17716 (Array (_ BitVec 32) (_ BitVec 64))) (size!18080 (_ BitVec 32))) )
))
(declare-fun lt!268552 () array!36892)

(declare-fun e!337894 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!36892)

(declare-fun arrayContainsKey!0 (array!36892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591756 (= e!337894 (arrayContainsKey!0 lt!268552 (select (arr!17716 a!2986) j!136) index!984))))

(declare-fun res!378664 () Bool)

(declare-fun e!337893 () Bool)

(assert (=> start!54162 (=> (not res!378664) (not e!337893))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54162 (= res!378664 (validMask!0 mask!3053))))

(assert (=> start!54162 e!337893))

(assert (=> start!54162 true))

(declare-fun array_inv!13512 (array!36892) Bool)

(assert (=> start!54162 (array_inv!13512 a!2986)))

(declare-fun b!591757 () Bool)

(declare-fun res!378675 () Bool)

(declare-fun e!337899 () Bool)

(assert (=> b!591757 (=> (not res!378675) (not e!337899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36892 (_ BitVec 32)) Bool)

(assert (=> b!591757 (= res!378675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591758 () Bool)

(declare-fun res!378669 () Bool)

(assert (=> b!591758 (=> (not res!378669) (not e!337899))))

(declare-datatypes ((List!11757 0))(
  ( (Nil!11754) (Cons!11753 (h!12798 (_ BitVec 64)) (t!17985 List!11757)) )
))
(declare-fun arrayNoDuplicates!0 (array!36892 (_ BitVec 32) List!11757) Bool)

(assert (=> b!591758 (= res!378669 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11754))))

(declare-fun b!591759 () Bool)

(declare-fun e!337898 () Bool)

(assert (=> b!591759 (= e!337898 e!337894)))

(declare-fun res!378672 () Bool)

(assert (=> b!591759 (=> (not res!378672) (not e!337894))))

(assert (=> b!591759 (= res!378672 (arrayContainsKey!0 lt!268552 (select (arr!17716 a!2986) j!136) j!136))))

(declare-fun b!591760 () Bool)

(assert (=> b!591760 (= e!337893 e!337899)))

(declare-fun res!378674 () Bool)

(assert (=> b!591760 (=> (not res!378674) (not e!337899))))

(declare-datatypes ((SeekEntryResult!6156 0))(
  ( (MissingZero!6156 (index!26860 (_ BitVec 32))) (Found!6156 (index!26861 (_ BitVec 32))) (Intermediate!6156 (undefined!6968 Bool) (index!26862 (_ BitVec 32)) (x!55652 (_ BitVec 32))) (Undefined!6156) (MissingVacant!6156 (index!26863 (_ BitVec 32))) )
))
(declare-fun lt!268550 () SeekEntryResult!6156)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591760 (= res!378674 (or (= lt!268550 (MissingZero!6156 i!1108)) (= lt!268550 (MissingVacant!6156 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36892 (_ BitVec 32)) SeekEntryResult!6156)

(assert (=> b!591760 (= lt!268550 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591761 () Bool)

(declare-fun res!378667 () Bool)

(assert (=> b!591761 (=> (not res!378667) (not e!337893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591761 (= res!378667 (validKeyInArray!0 (select (arr!17716 a!2986) j!136)))))

(declare-fun b!591762 () Bool)

(declare-datatypes ((Unit!18542 0))(
  ( (Unit!18543) )
))
(declare-fun e!337897 () Unit!18542)

(declare-fun Unit!18544 () Unit!18542)

(assert (=> b!591762 (= e!337897 Unit!18544)))

(assert (=> b!591762 false))

(declare-fun b!591763 () Bool)

(declare-fun e!337901 () Bool)

(assert (=> b!591763 (= e!337901 true)))

(declare-fun e!337892 () Bool)

(assert (=> b!591763 e!337892))

(declare-fun res!378666 () Bool)

(assert (=> b!591763 (=> (not res!378666) (not e!337892))))

(declare-fun lt!268548 () (_ BitVec 64))

(assert (=> b!591763 (= res!378666 (= lt!268548 (select (arr!17716 a!2986) j!136)))))

(assert (=> b!591763 (= lt!268548 (select (store (arr!17716 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591764 () Bool)

(declare-fun res!378677 () Bool)

(assert (=> b!591764 (=> (not res!378677) (not e!337893))))

(assert (=> b!591764 (= res!378677 (and (= (size!18080 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18080 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18080 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591765 () Bool)

(declare-fun e!337895 () Bool)

(assert (=> b!591765 (= e!337899 e!337895)))

(declare-fun res!378663 () Bool)

(assert (=> b!591765 (=> (not res!378663) (not e!337895))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591765 (= res!378663 (= (select (store (arr!17716 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591765 (= lt!268552 (array!36893 (store (arr!17716 a!2986) i!1108 k0!1786) (size!18080 a!2986)))))

(declare-fun b!591766 () Bool)

(declare-fun e!337896 () Bool)

(assert (=> b!591766 (= e!337895 e!337896)))

(declare-fun res!378665 () Bool)

(assert (=> b!591766 (=> (not res!378665) (not e!337896))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!268547 () SeekEntryResult!6156)

(assert (=> b!591766 (= res!378665 (and (= lt!268547 (Found!6156 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17716 a!2986) index!984) (select (arr!17716 a!2986) j!136))) (not (= (select (arr!17716 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36892 (_ BitVec 32)) SeekEntryResult!6156)

(assert (=> b!591766 (= lt!268547 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17716 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591767 () Bool)

(declare-fun res!378676 () Bool)

(assert (=> b!591767 (=> (not res!378676) (not e!337899))))

(assert (=> b!591767 (= res!378676 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17716 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591768 () Bool)

(assert (=> b!591768 (= e!337892 e!337898)))

(declare-fun res!378671 () Bool)

(assert (=> b!591768 (=> res!378671 e!337898)))

(declare-fun lt!268551 () (_ BitVec 64))

(assert (=> b!591768 (= res!378671 (or (not (= (select (arr!17716 a!2986) j!136) lt!268551)) (not (= (select (arr!17716 a!2986) j!136) lt!268548)) (bvsge j!136 index!984)))))

(declare-fun b!591769 () Bool)

(assert (=> b!591769 (= e!337896 (not e!337901))))

(declare-fun res!378670 () Bool)

(assert (=> b!591769 (=> res!378670 e!337901)))

(declare-fun lt!268543 () SeekEntryResult!6156)

(assert (=> b!591769 (= res!378670 (not (= lt!268543 (Found!6156 index!984))))))

(declare-fun lt!268549 () Unit!18542)

(assert (=> b!591769 (= lt!268549 e!337897)))

(declare-fun c!66914 () Bool)

(assert (=> b!591769 (= c!66914 (= lt!268543 Undefined!6156))))

(assert (=> b!591769 (= lt!268543 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268551 lt!268552 mask!3053))))

(declare-fun e!337902 () Bool)

(assert (=> b!591769 e!337902))

(declare-fun res!378673 () Bool)

(assert (=> b!591769 (=> (not res!378673) (not e!337902))))

(declare-fun lt!268546 () (_ BitVec 32))

(declare-fun lt!268545 () SeekEntryResult!6156)

(assert (=> b!591769 (= res!378673 (= lt!268545 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268546 vacantSpotIndex!68 lt!268551 lt!268552 mask!3053)))))

(assert (=> b!591769 (= lt!268545 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268546 vacantSpotIndex!68 (select (arr!17716 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591769 (= lt!268551 (select (store (arr!17716 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268544 () Unit!18542)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36892 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18542)

(assert (=> b!591769 (= lt!268544 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268546 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591769 (= lt!268546 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591770 () Bool)

(declare-fun res!378662 () Bool)

(assert (=> b!591770 (=> (not res!378662) (not e!337893))))

(assert (=> b!591770 (= res!378662 (validKeyInArray!0 k0!1786))))

(declare-fun b!591771 () Bool)

(declare-fun Unit!18545 () Unit!18542)

(assert (=> b!591771 (= e!337897 Unit!18545)))

(declare-fun b!591772 () Bool)

(declare-fun res!378668 () Bool)

(assert (=> b!591772 (=> (not res!378668) (not e!337893))))

(assert (=> b!591772 (= res!378668 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591773 () Bool)

(assert (=> b!591773 (= e!337902 (= lt!268547 lt!268545))))

(assert (= (and start!54162 res!378664) b!591764))

(assert (= (and b!591764 res!378677) b!591761))

(assert (= (and b!591761 res!378667) b!591770))

(assert (= (and b!591770 res!378662) b!591772))

(assert (= (and b!591772 res!378668) b!591760))

(assert (= (and b!591760 res!378674) b!591757))

(assert (= (and b!591757 res!378675) b!591758))

(assert (= (and b!591758 res!378669) b!591767))

(assert (= (and b!591767 res!378676) b!591765))

(assert (= (and b!591765 res!378663) b!591766))

(assert (= (and b!591766 res!378665) b!591769))

(assert (= (and b!591769 res!378673) b!591773))

(assert (= (and b!591769 c!66914) b!591762))

(assert (= (and b!591769 (not c!66914)) b!591771))

(assert (= (and b!591769 (not res!378670)) b!591763))

(assert (= (and b!591763 res!378666) b!591768))

(assert (= (and b!591768 (not res!378671)) b!591759))

(assert (= (and b!591759 res!378672) b!591756))

(declare-fun m!569957 () Bool)

(assert (=> b!591769 m!569957))

(declare-fun m!569959 () Bool)

(assert (=> b!591769 m!569959))

(declare-fun m!569961 () Bool)

(assert (=> b!591769 m!569961))

(declare-fun m!569963 () Bool)

(assert (=> b!591769 m!569963))

(assert (=> b!591769 m!569961))

(declare-fun m!569965 () Bool)

(assert (=> b!591769 m!569965))

(declare-fun m!569967 () Bool)

(assert (=> b!591769 m!569967))

(declare-fun m!569969 () Bool)

(assert (=> b!591769 m!569969))

(declare-fun m!569971 () Bool)

(assert (=> b!591769 m!569971))

(declare-fun m!569973 () Bool)

(assert (=> b!591767 m!569973))

(declare-fun m!569975 () Bool)

(assert (=> start!54162 m!569975))

(declare-fun m!569977 () Bool)

(assert (=> start!54162 m!569977))

(declare-fun m!569979 () Bool)

(assert (=> b!591770 m!569979))

(assert (=> b!591759 m!569961))

(assert (=> b!591759 m!569961))

(declare-fun m!569981 () Bool)

(assert (=> b!591759 m!569981))

(declare-fun m!569983 () Bool)

(assert (=> b!591772 m!569983))

(declare-fun m!569985 () Bool)

(assert (=> b!591757 m!569985))

(assert (=> b!591756 m!569961))

(assert (=> b!591756 m!569961))

(declare-fun m!569987 () Bool)

(assert (=> b!591756 m!569987))

(assert (=> b!591761 m!569961))

(assert (=> b!591761 m!569961))

(declare-fun m!569989 () Bool)

(assert (=> b!591761 m!569989))

(assert (=> b!591768 m!569961))

(declare-fun m!569991 () Bool)

(assert (=> b!591760 m!569991))

(assert (=> b!591765 m!569963))

(declare-fun m!569993 () Bool)

(assert (=> b!591765 m!569993))

(assert (=> b!591763 m!569961))

(assert (=> b!591763 m!569963))

(declare-fun m!569995 () Bool)

(assert (=> b!591763 m!569995))

(declare-fun m!569997 () Bool)

(assert (=> b!591766 m!569997))

(assert (=> b!591766 m!569961))

(assert (=> b!591766 m!569961))

(declare-fun m!569999 () Bool)

(assert (=> b!591766 m!569999))

(declare-fun m!570001 () Bool)

(assert (=> b!591758 m!570001))

(check-sat (not b!591770) (not start!54162) (not b!591761) (not b!591757) (not b!591760) (not b!591759) (not b!591769) (not b!591772) (not b!591766) (not b!591756) (not b!591758))
(check-sat)
