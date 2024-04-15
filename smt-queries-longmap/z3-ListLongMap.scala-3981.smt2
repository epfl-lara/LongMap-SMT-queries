; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53940 () Bool)

(assert start!53940)

(declare-fun b!588852 () Bool)

(declare-fun res!376554 () Bool)

(declare-fun e!336190 () Bool)

(assert (=> b!588852 (=> (not res!376554) (not e!336190))))

(declare-datatypes ((array!36798 0))(
  ( (array!36799 (arr!17672 (Array (_ BitVec 32) (_ BitVec 64))) (size!18037 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36798)

(declare-datatypes ((List!11752 0))(
  ( (Nil!11749) (Cons!11748 (h!12793 (_ BitVec 64)) (t!17971 List!11752)) )
))
(declare-fun arrayNoDuplicates!0 (array!36798 (_ BitVec 32) List!11752) Bool)

(assert (=> b!588852 (= res!376554 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11749))))

(declare-fun b!588853 () Bool)

(declare-datatypes ((Unit!18348 0))(
  ( (Unit!18349) )
))
(declare-fun e!336192 () Unit!18348)

(declare-fun Unit!18350 () Unit!18348)

(assert (=> b!588853 (= e!336192 Unit!18350)))

(declare-fun res!376559 () Bool)

(declare-fun e!336186 () Bool)

(assert (=> start!53940 (=> (not res!376559) (not e!336186))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53940 (= res!376559 (validMask!0 mask!3053))))

(assert (=> start!53940 e!336186))

(assert (=> start!53940 true))

(declare-fun array_inv!13555 (array!36798) Bool)

(assert (=> start!53940 (array_inv!13555 a!2986)))

(declare-fun b!588854 () Bool)

(declare-fun e!336191 () Bool)

(assert (=> b!588854 (= e!336191 (not true))))

(declare-fun lt!266931 () Unit!18348)

(assert (=> b!588854 (= lt!266931 e!336192)))

(declare-fun c!66516 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!266926 () (_ BitVec 64))

(declare-fun lt!266925 () array!36798)

(declare-datatypes ((SeekEntryResult!6109 0))(
  ( (MissingZero!6109 (index!26666 (_ BitVec 32))) (Found!6109 (index!26667 (_ BitVec 32))) (Intermediate!6109 (undefined!6921 Bool) (index!26668 (_ BitVec 32)) (x!55470 (_ BitVec 32))) (Undefined!6109) (MissingVacant!6109 (index!26669 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36798 (_ BitVec 32)) SeekEntryResult!6109)

(assert (=> b!588854 (= c!66516 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266926 lt!266925 mask!3053) Undefined!6109))))

(declare-fun e!336188 () Bool)

(assert (=> b!588854 e!336188))

(declare-fun res!376560 () Bool)

(assert (=> b!588854 (=> (not res!376560) (not e!336188))))

(declare-fun lt!266928 () (_ BitVec 32))

(declare-fun lt!266932 () SeekEntryResult!6109)

(assert (=> b!588854 (= res!376560 (= lt!266932 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266928 vacantSpotIndex!68 lt!266926 lt!266925 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!588854 (= lt!266932 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266928 vacantSpotIndex!68 (select (arr!17672 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!588854 (= lt!266926 (select (store (arr!17672 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266930 () Unit!18348)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36798 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18348)

(assert (=> b!588854 (= lt!266930 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266928 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588854 (= lt!266928 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588855 () Bool)

(declare-fun res!376555 () Bool)

(assert (=> b!588855 (=> (not res!376555) (not e!336186))))

(declare-fun arrayContainsKey!0 (array!36798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588855 (= res!376555 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588856 () Bool)

(declare-fun e!336189 () Bool)

(assert (=> b!588856 (= e!336189 e!336191)))

(declare-fun res!376562 () Bool)

(assert (=> b!588856 (=> (not res!376562) (not e!336191))))

(declare-fun lt!266929 () SeekEntryResult!6109)

(assert (=> b!588856 (= res!376562 (and (= lt!266929 (Found!6109 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17672 a!2986) index!984) (select (arr!17672 a!2986) j!136))) (not (= (select (arr!17672 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588856 (= lt!266929 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17672 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588857 () Bool)

(assert (=> b!588857 (= e!336186 e!336190)))

(declare-fun res!376556 () Bool)

(assert (=> b!588857 (=> (not res!376556) (not e!336190))))

(declare-fun lt!266927 () SeekEntryResult!6109)

(assert (=> b!588857 (= res!376556 (or (= lt!266927 (MissingZero!6109 i!1108)) (= lt!266927 (MissingVacant!6109 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36798 (_ BitVec 32)) SeekEntryResult!6109)

(assert (=> b!588857 (= lt!266927 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588858 () Bool)

(declare-fun res!376564 () Bool)

(assert (=> b!588858 (=> (not res!376564) (not e!336190))))

(assert (=> b!588858 (= res!376564 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17672 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588859 () Bool)

(declare-fun res!376565 () Bool)

(assert (=> b!588859 (=> (not res!376565) (not e!336186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588859 (= res!376565 (validKeyInArray!0 (select (arr!17672 a!2986) j!136)))))

(declare-fun b!588860 () Bool)

(declare-fun Unit!18351 () Unit!18348)

(assert (=> b!588860 (= e!336192 Unit!18351)))

(assert (=> b!588860 false))

(declare-fun b!588861 () Bool)

(assert (=> b!588861 (= e!336188 (= lt!266929 lt!266932))))

(declare-fun b!588862 () Bool)

(assert (=> b!588862 (= e!336190 e!336189)))

(declare-fun res!376557 () Bool)

(assert (=> b!588862 (=> (not res!376557) (not e!336189))))

(assert (=> b!588862 (= res!376557 (= (select (store (arr!17672 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588862 (= lt!266925 (array!36799 (store (arr!17672 a!2986) i!1108 k0!1786) (size!18037 a!2986)))))

(declare-fun b!588863 () Bool)

(declare-fun res!376563 () Bool)

(assert (=> b!588863 (=> (not res!376563) (not e!336186))))

(assert (=> b!588863 (= res!376563 (validKeyInArray!0 k0!1786))))

(declare-fun b!588864 () Bool)

(declare-fun res!376561 () Bool)

(assert (=> b!588864 (=> (not res!376561) (not e!336190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36798 (_ BitVec 32)) Bool)

(assert (=> b!588864 (= res!376561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588865 () Bool)

(declare-fun res!376558 () Bool)

(assert (=> b!588865 (=> (not res!376558) (not e!336186))))

(assert (=> b!588865 (= res!376558 (and (= (size!18037 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18037 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18037 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53940 res!376559) b!588865))

(assert (= (and b!588865 res!376558) b!588859))

(assert (= (and b!588859 res!376565) b!588863))

(assert (= (and b!588863 res!376563) b!588855))

(assert (= (and b!588855 res!376555) b!588857))

(assert (= (and b!588857 res!376556) b!588864))

(assert (= (and b!588864 res!376561) b!588852))

(assert (= (and b!588852 res!376554) b!588858))

(assert (= (and b!588858 res!376564) b!588862))

(assert (= (and b!588862 res!376557) b!588856))

(assert (= (and b!588856 res!376562) b!588854))

(assert (= (and b!588854 res!376560) b!588861))

(assert (= (and b!588854 c!66516) b!588860))

(assert (= (and b!588854 (not c!66516)) b!588853))

(declare-fun m!566881 () Bool)

(assert (=> start!53940 m!566881))

(declare-fun m!566883 () Bool)

(assert (=> start!53940 m!566883))

(declare-fun m!566885 () Bool)

(assert (=> b!588856 m!566885))

(declare-fun m!566887 () Bool)

(assert (=> b!588856 m!566887))

(assert (=> b!588856 m!566887))

(declare-fun m!566889 () Bool)

(assert (=> b!588856 m!566889))

(declare-fun m!566891 () Bool)

(assert (=> b!588857 m!566891))

(declare-fun m!566893 () Bool)

(assert (=> b!588864 m!566893))

(declare-fun m!566895 () Bool)

(assert (=> b!588852 m!566895))

(declare-fun m!566897 () Bool)

(assert (=> b!588858 m!566897))

(declare-fun m!566899 () Bool)

(assert (=> b!588863 m!566899))

(declare-fun m!566901 () Bool)

(assert (=> b!588854 m!566901))

(assert (=> b!588854 m!566887))

(declare-fun m!566903 () Bool)

(assert (=> b!588854 m!566903))

(assert (=> b!588854 m!566887))

(declare-fun m!566905 () Bool)

(assert (=> b!588854 m!566905))

(declare-fun m!566907 () Bool)

(assert (=> b!588854 m!566907))

(declare-fun m!566909 () Bool)

(assert (=> b!588854 m!566909))

(declare-fun m!566911 () Bool)

(assert (=> b!588854 m!566911))

(declare-fun m!566913 () Bool)

(assert (=> b!588854 m!566913))

(assert (=> b!588859 m!566887))

(assert (=> b!588859 m!566887))

(declare-fun m!566915 () Bool)

(assert (=> b!588859 m!566915))

(declare-fun m!566917 () Bool)

(assert (=> b!588855 m!566917))

(assert (=> b!588862 m!566905))

(declare-fun m!566919 () Bool)

(assert (=> b!588862 m!566919))

(check-sat (not b!588859) (not b!588855) (not b!588864) (not b!588852) (not b!588857) (not start!53940) (not b!588854) (not b!588856) (not b!588863))
(check-sat)
