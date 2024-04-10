; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54168 () Bool)

(assert start!54168)

(declare-fun b!591918 () Bool)

(declare-fun e!337996 () Bool)

(declare-fun e!337997 () Bool)

(assert (=> b!591918 (= e!337996 e!337997)))

(declare-fun res!378813 () Bool)

(assert (=> b!591918 (=> (not res!378813) (not e!337997))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6159 0))(
  ( (MissingZero!6159 (index!26872 (_ BitVec 32))) (Found!6159 (index!26873 (_ BitVec 32))) (Intermediate!6159 (undefined!6971 Bool) (index!26874 (_ BitVec 32)) (x!55663 (_ BitVec 32))) (Undefined!6159) (MissingVacant!6159 (index!26875 (_ BitVec 32))) )
))
(declare-fun lt!268636 () SeekEntryResult!6159)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36898 0))(
  ( (array!36899 (arr!17719 (Array (_ BitVec 32) (_ BitVec 64))) (size!18083 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36898)

(assert (=> b!591918 (= res!378813 (and (= lt!268636 (Found!6159 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17719 a!2986) index!984) (select (arr!17719 a!2986) j!136))) (not (= (select (arr!17719 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36898 (_ BitVec 32)) SeekEntryResult!6159)

(assert (=> b!591918 (= lt!268636 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17719 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591919 () Bool)

(declare-fun e!338001 () Bool)

(declare-fun lt!268638 () array!36898)

(declare-fun arrayContainsKey!0 (array!36898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591919 (= e!338001 (arrayContainsKey!0 lt!268638 (select (arr!17719 a!2986) j!136) index!984))))

(declare-fun b!591920 () Bool)

(declare-fun res!378821 () Bool)

(declare-fun e!337991 () Bool)

(assert (=> b!591920 (=> (not res!378821) (not e!337991))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!591920 (= res!378821 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591921 () Bool)

(declare-fun e!337998 () Bool)

(declare-fun e!337999 () Bool)

(assert (=> b!591921 (= e!337998 e!337999)))

(declare-fun res!378811 () Bool)

(assert (=> b!591921 (=> res!378811 e!337999)))

(declare-fun lt!268641 () (_ BitVec 64))

(declare-fun lt!268635 () (_ BitVec 64))

(assert (=> b!591921 (= res!378811 (or (not (= (select (arr!17719 a!2986) j!136) lt!268635)) (not (= (select (arr!17719 a!2986) j!136) lt!268641)) (bvsge j!136 index!984)))))

(declare-fun b!591922 () Bool)

(declare-fun e!337992 () Bool)

(declare-fun lt!268640 () SeekEntryResult!6159)

(assert (=> b!591922 (= e!337992 (= lt!268636 lt!268640))))

(declare-fun b!591923 () Bool)

(declare-datatypes ((Unit!18554 0))(
  ( (Unit!18555) )
))
(declare-fun e!337995 () Unit!18554)

(declare-fun Unit!18556 () Unit!18554)

(assert (=> b!591923 (= e!337995 Unit!18556)))

(declare-fun b!591924 () Bool)

(declare-fun res!378810 () Bool)

(assert (=> b!591924 (=> (not res!378810) (not e!337991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591924 (= res!378810 (validKeyInArray!0 (select (arr!17719 a!2986) j!136)))))

(declare-fun b!591925 () Bool)

(assert (=> b!591925 (= e!337999 e!338001)))

(declare-fun res!378807 () Bool)

(assert (=> b!591925 (=> (not res!378807) (not e!338001))))

(assert (=> b!591925 (= res!378807 (arrayContainsKey!0 lt!268638 (select (arr!17719 a!2986) j!136) j!136))))

(declare-fun b!591926 () Bool)

(declare-fun e!338000 () Bool)

(assert (=> b!591926 (= e!338000 e!337996)))

(declare-fun res!378812 () Bool)

(assert (=> b!591926 (=> (not res!378812) (not e!337996))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591926 (= res!378812 (= (select (store (arr!17719 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591926 (= lt!268638 (array!36899 (store (arr!17719 a!2986) i!1108 k0!1786) (size!18083 a!2986)))))

(declare-fun b!591927 () Bool)

(declare-fun res!378816 () Bool)

(assert (=> b!591927 (=> (not res!378816) (not e!338000))))

(assert (=> b!591927 (= res!378816 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17719 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!378818 () Bool)

(assert (=> start!54168 (=> (not res!378818) (not e!337991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54168 (= res!378818 (validMask!0 mask!3053))))

(assert (=> start!54168 e!337991))

(assert (=> start!54168 true))

(declare-fun array_inv!13515 (array!36898) Bool)

(assert (=> start!54168 (array_inv!13515 a!2986)))

(declare-fun b!591928 () Bool)

(declare-fun res!378819 () Bool)

(assert (=> b!591928 (=> (not res!378819) (not e!337991))))

(assert (=> b!591928 (= res!378819 (and (= (size!18083 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18083 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18083 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591929 () Bool)

(declare-fun res!378817 () Bool)

(assert (=> b!591929 (=> (not res!378817) (not e!338000))))

(declare-datatypes ((List!11760 0))(
  ( (Nil!11757) (Cons!11756 (h!12801 (_ BitVec 64)) (t!17988 List!11760)) )
))
(declare-fun arrayNoDuplicates!0 (array!36898 (_ BitVec 32) List!11760) Bool)

(assert (=> b!591929 (= res!378817 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11757))))

(declare-fun b!591930 () Bool)

(declare-fun Unit!18557 () Unit!18554)

(assert (=> b!591930 (= e!337995 Unit!18557)))

(assert (=> b!591930 false))

(declare-fun b!591931 () Bool)

(declare-fun e!337993 () Bool)

(assert (=> b!591931 (= e!337993 true)))

(assert (=> b!591931 e!337998))

(declare-fun res!378809 () Bool)

(assert (=> b!591931 (=> (not res!378809) (not e!337998))))

(assert (=> b!591931 (= res!378809 (= lt!268641 (select (arr!17719 a!2986) j!136)))))

(assert (=> b!591931 (= lt!268641 (select (store (arr!17719 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591932 () Bool)

(assert (=> b!591932 (= e!337991 e!338000)))

(declare-fun res!378814 () Bool)

(assert (=> b!591932 (=> (not res!378814) (not e!338000))))

(declare-fun lt!268633 () SeekEntryResult!6159)

(assert (=> b!591932 (= res!378814 (or (= lt!268633 (MissingZero!6159 i!1108)) (= lt!268633 (MissingVacant!6159 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36898 (_ BitVec 32)) SeekEntryResult!6159)

(assert (=> b!591932 (= lt!268633 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591933 () Bool)

(declare-fun res!378806 () Bool)

(assert (=> b!591933 (=> (not res!378806) (not e!337991))))

(assert (=> b!591933 (= res!378806 (validKeyInArray!0 k0!1786))))

(declare-fun b!591934 () Bool)

(declare-fun res!378820 () Bool)

(assert (=> b!591934 (=> (not res!378820) (not e!338000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36898 (_ BitVec 32)) Bool)

(assert (=> b!591934 (= res!378820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591935 () Bool)

(assert (=> b!591935 (= e!337997 (not e!337993))))

(declare-fun res!378808 () Bool)

(assert (=> b!591935 (=> res!378808 e!337993)))

(declare-fun lt!268642 () SeekEntryResult!6159)

(assert (=> b!591935 (= res!378808 (not (= lt!268642 (Found!6159 index!984))))))

(declare-fun lt!268637 () Unit!18554)

(assert (=> b!591935 (= lt!268637 e!337995)))

(declare-fun c!66923 () Bool)

(assert (=> b!591935 (= c!66923 (= lt!268642 Undefined!6159))))

(assert (=> b!591935 (= lt!268642 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268635 lt!268638 mask!3053))))

(assert (=> b!591935 e!337992))

(declare-fun res!378815 () Bool)

(assert (=> b!591935 (=> (not res!378815) (not e!337992))))

(declare-fun lt!268639 () (_ BitVec 32))

(assert (=> b!591935 (= res!378815 (= lt!268640 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268639 vacantSpotIndex!68 lt!268635 lt!268638 mask!3053)))))

(assert (=> b!591935 (= lt!268640 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268639 vacantSpotIndex!68 (select (arr!17719 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591935 (= lt!268635 (select (store (arr!17719 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268634 () Unit!18554)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36898 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18554)

(assert (=> b!591935 (= lt!268634 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268639 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591935 (= lt!268639 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54168 res!378818) b!591928))

(assert (= (and b!591928 res!378819) b!591924))

(assert (= (and b!591924 res!378810) b!591933))

(assert (= (and b!591933 res!378806) b!591920))

(assert (= (and b!591920 res!378821) b!591932))

(assert (= (and b!591932 res!378814) b!591934))

(assert (= (and b!591934 res!378820) b!591929))

(assert (= (and b!591929 res!378817) b!591927))

(assert (= (and b!591927 res!378816) b!591926))

(assert (= (and b!591926 res!378812) b!591918))

(assert (= (and b!591918 res!378813) b!591935))

(assert (= (and b!591935 res!378815) b!591922))

(assert (= (and b!591935 c!66923) b!591930))

(assert (= (and b!591935 (not c!66923)) b!591923))

(assert (= (and b!591935 (not res!378808)) b!591931))

(assert (= (and b!591931 res!378809) b!591921))

(assert (= (and b!591921 (not res!378811)) b!591925))

(assert (= (and b!591925 res!378807) b!591919))

(declare-fun m!570095 () Bool)

(assert (=> b!591926 m!570095))

(declare-fun m!570097 () Bool)

(assert (=> b!591926 m!570097))

(declare-fun m!570099 () Bool)

(assert (=> b!591918 m!570099))

(declare-fun m!570101 () Bool)

(assert (=> b!591918 m!570101))

(assert (=> b!591918 m!570101))

(declare-fun m!570103 () Bool)

(assert (=> b!591918 m!570103))

(declare-fun m!570105 () Bool)

(assert (=> b!591934 m!570105))

(assert (=> b!591931 m!570101))

(assert (=> b!591931 m!570095))

(declare-fun m!570107 () Bool)

(assert (=> b!591931 m!570107))

(declare-fun m!570109 () Bool)

(assert (=> b!591927 m!570109))

(declare-fun m!570111 () Bool)

(assert (=> b!591920 m!570111))

(assert (=> b!591935 m!570101))

(declare-fun m!570113 () Bool)

(assert (=> b!591935 m!570113))

(declare-fun m!570115 () Bool)

(assert (=> b!591935 m!570115))

(assert (=> b!591935 m!570101))

(assert (=> b!591935 m!570095))

(declare-fun m!570117 () Bool)

(assert (=> b!591935 m!570117))

(declare-fun m!570119 () Bool)

(assert (=> b!591935 m!570119))

(declare-fun m!570121 () Bool)

(assert (=> b!591935 m!570121))

(declare-fun m!570123 () Bool)

(assert (=> b!591935 m!570123))

(declare-fun m!570125 () Bool)

(assert (=> b!591929 m!570125))

(declare-fun m!570127 () Bool)

(assert (=> b!591933 m!570127))

(assert (=> b!591924 m!570101))

(assert (=> b!591924 m!570101))

(declare-fun m!570129 () Bool)

(assert (=> b!591924 m!570129))

(assert (=> b!591919 m!570101))

(assert (=> b!591919 m!570101))

(declare-fun m!570131 () Bool)

(assert (=> b!591919 m!570131))

(assert (=> b!591921 m!570101))

(declare-fun m!570133 () Bool)

(assert (=> b!591932 m!570133))

(assert (=> b!591925 m!570101))

(assert (=> b!591925 m!570101))

(declare-fun m!570135 () Bool)

(assert (=> b!591925 m!570135))

(declare-fun m!570137 () Bool)

(assert (=> start!54168 m!570137))

(declare-fun m!570139 () Bool)

(assert (=> start!54168 m!570139))

(check-sat (not b!591933) (not b!591919) (not b!591924) (not b!591920) (not start!54168) (not b!591918) (not b!591935) (not b!591934) (not b!591932) (not b!591925) (not b!591929))
(check-sat)
