; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54072 () Bool)

(assert start!54072)

(declare-fun b!590674 () Bool)

(declare-datatypes ((Unit!18482 0))(
  ( (Unit!18483) )
))
(declare-fun e!337233 () Unit!18482)

(declare-fun Unit!18484 () Unit!18482)

(assert (=> b!590674 (= e!337233 Unit!18484)))

(assert (=> b!590674 false))

(declare-fun b!590675 () Bool)

(declare-fun e!337229 () Bool)

(declare-fun e!337224 () Bool)

(assert (=> b!590675 (= e!337229 (not e!337224))))

(declare-fun res!377874 () Bool)

(assert (=> b!590675 (=> res!377874 e!337224)))

(declare-datatypes ((SeekEntryResult!6141 0))(
  ( (MissingZero!6141 (index!26797 (_ BitVec 32))) (Found!6141 (index!26798 (_ BitVec 32))) (Intermediate!6141 (undefined!6953 Bool) (index!26799 (_ BitVec 32)) (x!55588 (_ BitVec 32))) (Undefined!6141) (MissingVacant!6141 (index!26800 (_ BitVec 32))) )
))
(declare-fun lt!267989 () SeekEntryResult!6141)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590675 (= res!377874 (not (= lt!267989 (Found!6141 index!984))))))

(declare-fun lt!267991 () Unit!18482)

(assert (=> b!590675 (= lt!267991 e!337233)))

(declare-fun c!66770 () Bool)

(assert (=> b!590675 (= c!66770 (= lt!267989 Undefined!6141))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36859 0))(
  ( (array!36860 (arr!17701 (Array (_ BitVec 32) (_ BitVec 64))) (size!18065 (_ BitVec 32))) )
))
(declare-fun lt!267995 () array!36859)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!267992 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36859 (_ BitVec 32)) SeekEntryResult!6141)

(assert (=> b!590675 (= lt!267989 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267992 lt!267995 mask!3053))))

(declare-fun e!337226 () Bool)

(assert (=> b!590675 e!337226))

(declare-fun res!377868 () Bool)

(assert (=> b!590675 (=> (not res!377868) (not e!337226))))

(declare-fun lt!267997 () SeekEntryResult!6141)

(declare-fun lt!267993 () (_ BitVec 32))

(assert (=> b!590675 (= res!377868 (= lt!267997 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 lt!267992 lt!267995 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36859)

(assert (=> b!590675 (= lt!267997 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!590675 (= lt!267992 (select (store (arr!17701 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267990 () Unit!18482)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18482)

(assert (=> b!590675 (= lt!267990 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590675 (= lt!267993 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590676 () Bool)

(assert (=> b!590676 (= e!337224 (or (not (= (select (arr!17701 a!2986) j!136) lt!267992)) (not (= (select (arr!17701 a!2986) j!136) (select (store (arr!17701 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvsge index!984 (size!18065 a!2986)) (bvslt (size!18065 a!2986) #b01111111111111111111111111111111)))))

(declare-fun e!337230 () Bool)

(assert (=> b!590676 e!337230))

(declare-fun res!377875 () Bool)

(assert (=> b!590676 (=> (not res!377875) (not e!337230))))

(assert (=> b!590676 (= res!377875 (= (select (store (arr!17701 a!2986) i!1108 k0!1786) index!984) (select (arr!17701 a!2986) j!136)))))

(declare-fun b!590677 () Bool)

(declare-fun lt!267994 () SeekEntryResult!6141)

(assert (=> b!590677 (= e!337226 (= lt!267994 lt!267997))))

(declare-fun b!590678 () Bool)

(declare-fun res!377877 () Bool)

(declare-fun e!337225 () Bool)

(assert (=> b!590678 (=> (not res!377877) (not e!337225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590678 (= res!377877 (validKeyInArray!0 k0!1786))))

(declare-fun res!377870 () Bool)

(assert (=> start!54072 (=> (not res!377870) (not e!337225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54072 (= res!377870 (validMask!0 mask!3053))))

(assert (=> start!54072 e!337225))

(assert (=> start!54072 true))

(declare-fun array_inv!13497 (array!36859) Bool)

(assert (=> start!54072 (array_inv!13497 a!2986)))

(declare-fun b!590679 () Bool)

(declare-fun e!337227 () Bool)

(assert (=> b!590679 (= e!337227 e!337229)))

(declare-fun res!377878 () Bool)

(assert (=> b!590679 (=> (not res!377878) (not e!337229))))

(assert (=> b!590679 (= res!377878 (and (= lt!267994 (Found!6141 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17701 a!2986) index!984) (select (arr!17701 a!2986) j!136))) (not (= (select (arr!17701 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590679 (= lt!267994 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590680 () Bool)

(declare-fun e!337232 () Bool)

(declare-fun arrayContainsKey!0 (array!36859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590680 (= e!337232 (arrayContainsKey!0 lt!267995 (select (arr!17701 a!2986) j!136) j!136))))

(declare-fun b!590681 () Bool)

(declare-fun res!377881 () Bool)

(declare-fun e!337228 () Bool)

(assert (=> b!590681 (=> (not res!377881) (not e!337228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36859 (_ BitVec 32)) Bool)

(assert (=> b!590681 (= res!377881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590682 () Bool)

(assert (=> b!590682 (= e!337228 e!337227)))

(declare-fun res!377879 () Bool)

(assert (=> b!590682 (=> (not res!377879) (not e!337227))))

(assert (=> b!590682 (= res!377879 (= (select (store (arr!17701 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590682 (= lt!267995 (array!36860 (store (arr!17701 a!2986) i!1108 k0!1786) (size!18065 a!2986)))))

(declare-fun b!590683 () Bool)

(assert (=> b!590683 (= e!337230 e!337232)))

(declare-fun res!377869 () Bool)

(assert (=> b!590683 (=> res!377869 e!337232)))

(assert (=> b!590683 (= res!377869 (or (not (= (select (arr!17701 a!2986) j!136) lt!267992)) (not (= (select (arr!17701 a!2986) j!136) (select (store (arr!17701 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590684 () Bool)

(declare-fun res!377871 () Bool)

(assert (=> b!590684 (=> (not res!377871) (not e!337228))))

(declare-datatypes ((List!11742 0))(
  ( (Nil!11739) (Cons!11738 (h!12783 (_ BitVec 64)) (t!17970 List!11742)) )
))
(declare-fun arrayNoDuplicates!0 (array!36859 (_ BitVec 32) List!11742) Bool)

(assert (=> b!590684 (= res!377871 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11739))))

(declare-fun b!590685 () Bool)

(declare-fun res!377873 () Bool)

(assert (=> b!590685 (=> (not res!377873) (not e!337225))))

(assert (=> b!590685 (= res!377873 (validKeyInArray!0 (select (arr!17701 a!2986) j!136)))))

(declare-fun b!590686 () Bool)

(declare-fun Unit!18485 () Unit!18482)

(assert (=> b!590686 (= e!337233 Unit!18485)))

(declare-fun b!590687 () Bool)

(declare-fun res!377876 () Bool)

(assert (=> b!590687 (=> (not res!377876) (not e!337225))))

(assert (=> b!590687 (= res!377876 (and (= (size!18065 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18065 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18065 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590688 () Bool)

(declare-fun res!377872 () Bool)

(assert (=> b!590688 (=> (not res!377872) (not e!337225))))

(assert (=> b!590688 (= res!377872 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590689 () Bool)

(declare-fun res!377880 () Bool)

(assert (=> b!590689 (=> (not res!377880) (not e!337228))))

(assert (=> b!590689 (= res!377880 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17701 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590690 () Bool)

(assert (=> b!590690 (= e!337225 e!337228)))

(declare-fun res!377882 () Bool)

(assert (=> b!590690 (=> (not res!377882) (not e!337228))))

(declare-fun lt!267996 () SeekEntryResult!6141)

(assert (=> b!590690 (= res!377882 (or (= lt!267996 (MissingZero!6141 i!1108)) (= lt!267996 (MissingVacant!6141 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36859 (_ BitVec 32)) SeekEntryResult!6141)

(assert (=> b!590690 (= lt!267996 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!54072 res!377870) b!590687))

(assert (= (and b!590687 res!377876) b!590685))

(assert (= (and b!590685 res!377873) b!590678))

(assert (= (and b!590678 res!377877) b!590688))

(assert (= (and b!590688 res!377872) b!590690))

(assert (= (and b!590690 res!377882) b!590681))

(assert (= (and b!590681 res!377881) b!590684))

(assert (= (and b!590684 res!377871) b!590689))

(assert (= (and b!590689 res!377880) b!590682))

(assert (= (and b!590682 res!377879) b!590679))

(assert (= (and b!590679 res!377878) b!590675))

(assert (= (and b!590675 res!377868) b!590677))

(assert (= (and b!590675 c!66770) b!590674))

(assert (= (and b!590675 (not c!66770)) b!590686))

(assert (= (and b!590675 (not res!377874)) b!590676))

(assert (= (and b!590676 res!377875) b!590683))

(assert (= (and b!590683 (not res!377869)) b!590680))

(declare-fun m!569049 () Bool)

(assert (=> b!590675 m!569049))

(declare-fun m!569051 () Bool)

(assert (=> b!590675 m!569051))

(declare-fun m!569053 () Bool)

(assert (=> b!590675 m!569053))

(assert (=> b!590675 m!569053))

(declare-fun m!569055 () Bool)

(assert (=> b!590675 m!569055))

(declare-fun m!569057 () Bool)

(assert (=> b!590675 m!569057))

(declare-fun m!569059 () Bool)

(assert (=> b!590675 m!569059))

(declare-fun m!569061 () Bool)

(assert (=> b!590675 m!569061))

(declare-fun m!569063 () Bool)

(assert (=> b!590675 m!569063))

(assert (=> b!590680 m!569053))

(assert (=> b!590680 m!569053))

(declare-fun m!569065 () Bool)

(assert (=> b!590680 m!569065))

(declare-fun m!569067 () Bool)

(assert (=> b!590678 m!569067))

(declare-fun m!569069 () Bool)

(assert (=> start!54072 m!569069))

(declare-fun m!569071 () Bool)

(assert (=> start!54072 m!569071))

(declare-fun m!569073 () Bool)

(assert (=> b!590690 m!569073))

(assert (=> b!590676 m!569053))

(assert (=> b!590676 m!569057))

(declare-fun m!569075 () Bool)

(assert (=> b!590676 m!569075))

(declare-fun m!569077 () Bool)

(assert (=> b!590689 m!569077))

(assert (=> b!590683 m!569053))

(assert (=> b!590683 m!569057))

(assert (=> b!590683 m!569075))

(declare-fun m!569079 () Bool)

(assert (=> b!590688 m!569079))

(assert (=> b!590682 m!569057))

(declare-fun m!569081 () Bool)

(assert (=> b!590682 m!569081))

(declare-fun m!569083 () Bool)

(assert (=> b!590679 m!569083))

(assert (=> b!590679 m!569053))

(assert (=> b!590679 m!569053))

(declare-fun m!569085 () Bool)

(assert (=> b!590679 m!569085))

(assert (=> b!590685 m!569053))

(assert (=> b!590685 m!569053))

(declare-fun m!569087 () Bool)

(assert (=> b!590685 m!569087))

(declare-fun m!569089 () Bool)

(assert (=> b!590684 m!569089))

(declare-fun m!569091 () Bool)

(assert (=> b!590681 m!569091))

(check-sat (not b!590679) (not start!54072) (not b!590678) (not b!590681) (not b!590690) (not b!590675) (not b!590685) (not b!590684) (not b!590680) (not b!590688))
(check-sat)
(get-model)

(declare-fun b!590750 () Bool)

(declare-fun e!337270 () Bool)

(declare-fun call!32816 () Bool)

(assert (=> b!590750 (= e!337270 call!32816)))

(declare-fun bm!32813 () Bool)

(assert (=> bm!32813 (= call!32816 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!590751 () Bool)

(declare-fun e!337271 () Bool)

(assert (=> b!590751 (= e!337271 call!32816)))

(declare-fun b!590752 () Bool)

(assert (=> b!590752 (= e!337271 e!337270)))

(declare-fun lt!268033 () (_ BitVec 64))

(assert (=> b!590752 (= lt!268033 (select (arr!17701 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!268031 () Unit!18482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36859 (_ BitVec 64) (_ BitVec 32)) Unit!18482)

(assert (=> b!590752 (= lt!268031 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!268033 #b00000000000000000000000000000000))))

(assert (=> b!590752 (arrayContainsKey!0 a!2986 lt!268033 #b00000000000000000000000000000000)))

(declare-fun lt!268032 () Unit!18482)

(assert (=> b!590752 (= lt!268032 lt!268031)))

(declare-fun res!377932 () Bool)

(assert (=> b!590752 (= res!377932 (= (seekEntryOrOpen!0 (select (arr!17701 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6141 #b00000000000000000000000000000000)))))

(assert (=> b!590752 (=> (not res!377932) (not e!337270))))

(declare-fun b!590753 () Bool)

(declare-fun e!337272 () Bool)

(assert (=> b!590753 (= e!337272 e!337271)))

(declare-fun c!66776 () Bool)

(assert (=> b!590753 (= c!66776 (validKeyInArray!0 (select (arr!17701 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86117 () Bool)

(declare-fun res!377933 () Bool)

(assert (=> d!86117 (=> res!377933 e!337272)))

(assert (=> d!86117 (= res!377933 (bvsge #b00000000000000000000000000000000 (size!18065 a!2986)))))

(assert (=> d!86117 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!337272)))

(assert (= (and d!86117 (not res!377933)) b!590753))

(assert (= (and b!590753 c!66776) b!590752))

(assert (= (and b!590753 (not c!66776)) b!590751))

(assert (= (and b!590752 res!377932) b!590750))

(assert (= (or b!590750 b!590751) bm!32813))

(declare-fun m!569137 () Bool)

(assert (=> bm!32813 m!569137))

(declare-fun m!569139 () Bool)

(assert (=> b!590752 m!569139))

(declare-fun m!569141 () Bool)

(assert (=> b!590752 m!569141))

(declare-fun m!569143 () Bool)

(assert (=> b!590752 m!569143))

(assert (=> b!590752 m!569139))

(declare-fun m!569145 () Bool)

(assert (=> b!590752 m!569145))

(assert (=> b!590753 m!569139))

(assert (=> b!590753 m!569139))

(declare-fun m!569147 () Bool)

(assert (=> b!590753 m!569147))

(assert (=> b!590681 d!86117))

(declare-fun b!590772 () Bool)

(declare-fun c!66785 () Bool)

(declare-fun lt!268038 () (_ BitVec 64))

(assert (=> b!590772 (= c!66785 (= lt!268038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337286 () SeekEntryResult!6141)

(declare-fun e!337287 () SeekEntryResult!6141)

(assert (=> b!590772 (= e!337286 e!337287)))

(declare-fun b!590773 () Bool)

(declare-fun e!337285 () SeekEntryResult!6141)

(assert (=> b!590773 (= e!337285 e!337286)))

(declare-fun c!66784 () Bool)

(assert (=> b!590773 (= c!66784 (= lt!268038 (select (arr!17701 a!2986) j!136)))))

(declare-fun b!590775 () Bool)

(assert (=> b!590775 (= e!337285 Undefined!6141)))

(declare-fun b!590776 () Bool)

(assert (=> b!590776 (= e!337286 (Found!6141 lt!267993))))

(declare-fun b!590777 () Bool)

(assert (=> b!590777 (= e!337287 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267993 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!268039 () SeekEntryResult!6141)

(declare-fun d!86119 () Bool)

(get-info :version)

(assert (=> d!86119 (and (or ((_ is Undefined!6141) lt!268039) (not ((_ is Found!6141) lt!268039)) (and (bvsge (index!26798 lt!268039) #b00000000000000000000000000000000) (bvslt (index!26798 lt!268039) (size!18065 a!2986)))) (or ((_ is Undefined!6141) lt!268039) ((_ is Found!6141) lt!268039) (not ((_ is MissingVacant!6141) lt!268039)) (not (= (index!26800 lt!268039) vacantSpotIndex!68)) (and (bvsge (index!26800 lt!268039) #b00000000000000000000000000000000) (bvslt (index!26800 lt!268039) (size!18065 a!2986)))) (or ((_ is Undefined!6141) lt!268039) (ite ((_ is Found!6141) lt!268039) (= (select (arr!17701 a!2986) (index!26798 lt!268039)) (select (arr!17701 a!2986) j!136)) (and ((_ is MissingVacant!6141) lt!268039) (= (index!26800 lt!268039) vacantSpotIndex!68) (= (select (arr!17701 a!2986) (index!26800 lt!268039)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86119 (= lt!268039 e!337285)))

(declare-fun c!66783 () Bool)

(assert (=> d!86119 (= c!66783 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86119 (= lt!268038 (select (arr!17701 a!2986) lt!267993))))

(assert (=> d!86119 (validMask!0 mask!3053)))

(assert (=> d!86119 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053) lt!268039)))

(declare-fun b!590774 () Bool)

(assert (=> b!590774 (= e!337287 (MissingVacant!6141 vacantSpotIndex!68))))

(assert (= (and d!86119 c!66783) b!590775))

(assert (= (and d!86119 (not c!66783)) b!590773))

(assert (= (and b!590773 c!66784) b!590776))

(assert (= (and b!590773 (not c!66784)) b!590772))

(assert (= (and b!590772 c!66785) b!590774))

(assert (= (and b!590772 (not c!66785)) b!590777))

(declare-fun m!569153 () Bool)

(assert (=> b!590777 m!569153))

(assert (=> b!590777 m!569153))

(assert (=> b!590777 m!569053))

(declare-fun m!569155 () Bool)

(assert (=> b!590777 m!569155))

(declare-fun m!569157 () Bool)

(assert (=> d!86119 m!569157))

(declare-fun m!569159 () Bool)

(assert (=> d!86119 m!569159))

(declare-fun m!569161 () Bool)

(assert (=> d!86119 m!569161))

(assert (=> d!86119 m!569069))

(assert (=> b!590675 d!86119))

(declare-fun d!86125 () Bool)

(declare-fun lt!268042 () (_ BitVec 32))

(assert (=> d!86125 (and (bvsge lt!268042 #b00000000000000000000000000000000) (bvslt lt!268042 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86125 (= lt!268042 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86125 (validMask!0 mask!3053)))

(assert (=> d!86125 (= (nextIndex!0 index!984 x!910 mask!3053) lt!268042)))

(declare-fun bs!18259 () Bool)

(assert (= bs!18259 d!86125))

(declare-fun m!569163 () Bool)

(assert (=> bs!18259 m!569163))

(assert (=> bs!18259 m!569069))

(assert (=> b!590675 d!86125))

(declare-fun b!590778 () Bool)

(declare-fun c!66788 () Bool)

(declare-fun lt!268043 () (_ BitVec 64))

(assert (=> b!590778 (= c!66788 (= lt!268043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337289 () SeekEntryResult!6141)

(declare-fun e!337290 () SeekEntryResult!6141)

(assert (=> b!590778 (= e!337289 e!337290)))

(declare-fun b!590779 () Bool)

(declare-fun e!337288 () SeekEntryResult!6141)

(assert (=> b!590779 (= e!337288 e!337289)))

(declare-fun c!66787 () Bool)

(assert (=> b!590779 (= c!66787 (= lt!268043 lt!267992))))

(declare-fun b!590781 () Bool)

(assert (=> b!590781 (= e!337288 Undefined!6141)))

(declare-fun b!590782 () Bool)

(assert (=> b!590782 (= e!337289 (Found!6141 index!984))))

(declare-fun b!590783 () Bool)

(assert (=> b!590783 (= e!337290 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!267992 lt!267995 mask!3053))))

(declare-fun lt!268044 () SeekEntryResult!6141)

(declare-fun d!86127 () Bool)

(assert (=> d!86127 (and (or ((_ is Undefined!6141) lt!268044) (not ((_ is Found!6141) lt!268044)) (and (bvsge (index!26798 lt!268044) #b00000000000000000000000000000000) (bvslt (index!26798 lt!268044) (size!18065 lt!267995)))) (or ((_ is Undefined!6141) lt!268044) ((_ is Found!6141) lt!268044) (not ((_ is MissingVacant!6141) lt!268044)) (not (= (index!26800 lt!268044) vacantSpotIndex!68)) (and (bvsge (index!26800 lt!268044) #b00000000000000000000000000000000) (bvslt (index!26800 lt!268044) (size!18065 lt!267995)))) (or ((_ is Undefined!6141) lt!268044) (ite ((_ is Found!6141) lt!268044) (= (select (arr!17701 lt!267995) (index!26798 lt!268044)) lt!267992) (and ((_ is MissingVacant!6141) lt!268044) (= (index!26800 lt!268044) vacantSpotIndex!68) (= (select (arr!17701 lt!267995) (index!26800 lt!268044)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86127 (= lt!268044 e!337288)))

(declare-fun c!66786 () Bool)

(assert (=> d!86127 (= c!66786 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86127 (= lt!268043 (select (arr!17701 lt!267995) index!984))))

(assert (=> d!86127 (validMask!0 mask!3053)))

(assert (=> d!86127 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267992 lt!267995 mask!3053) lt!268044)))

(declare-fun b!590780 () Bool)

(assert (=> b!590780 (= e!337290 (MissingVacant!6141 vacantSpotIndex!68))))

(assert (= (and d!86127 c!66786) b!590781))

(assert (= (and d!86127 (not c!66786)) b!590779))

(assert (= (and b!590779 c!66787) b!590782))

(assert (= (and b!590779 (not c!66787)) b!590778))

(assert (= (and b!590778 c!66788) b!590780))

(assert (= (and b!590778 (not c!66788)) b!590783))

(assert (=> b!590783 m!569049))

(assert (=> b!590783 m!569049))

(declare-fun m!569165 () Bool)

(assert (=> b!590783 m!569165))

(declare-fun m!569167 () Bool)

(assert (=> d!86127 m!569167))

(declare-fun m!569169 () Bool)

(assert (=> d!86127 m!569169))

(declare-fun m!569171 () Bool)

(assert (=> d!86127 m!569171))

(assert (=> d!86127 m!569069))

(assert (=> b!590675 d!86127))

(declare-fun d!86129 () Bool)

(declare-fun e!337303 () Bool)

(assert (=> d!86129 e!337303))

(declare-fun res!377948 () Bool)

(assert (=> d!86129 (=> (not res!377948) (not e!337303))))

(assert (=> d!86129 (= res!377948 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18065 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18065 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18065 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18065 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18065 a!2986))))))

(declare-fun lt!268051 () Unit!18482)

(declare-fun choose!9 (array!36859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18482)

(assert (=> d!86129 (= lt!268051 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86129 (validMask!0 mask!3053)))

(assert (=> d!86129 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 mask!3053) lt!268051)))

(declare-fun b!590800 () Bool)

(assert (=> b!590800 (= e!337303 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 (select (store (arr!17701 a!2986) i!1108 k0!1786) j!136) (array!36860 (store (arr!17701 a!2986) i!1108 k0!1786) (size!18065 a!2986)) mask!3053)))))

(assert (= (and d!86129 res!377948) b!590800))

(declare-fun m!569177 () Bool)

(assert (=> d!86129 m!569177))

(assert (=> d!86129 m!569069))

(assert (=> b!590800 m!569053))

(assert (=> b!590800 m!569055))

(assert (=> b!590800 m!569051))

(declare-fun m!569179 () Bool)

(assert (=> b!590800 m!569179))

(assert (=> b!590800 m!569051))

(assert (=> b!590800 m!569053))

(assert (=> b!590800 m!569057))

(assert (=> b!590675 d!86129))

(declare-fun b!590805 () Bool)

(declare-fun c!66797 () Bool)

(declare-fun lt!268052 () (_ BitVec 64))

(assert (=> b!590805 (= c!66797 (= lt!268052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337307 () SeekEntryResult!6141)

(declare-fun e!337308 () SeekEntryResult!6141)

(assert (=> b!590805 (= e!337307 e!337308)))

(declare-fun b!590806 () Bool)

(declare-fun e!337306 () SeekEntryResult!6141)

(assert (=> b!590806 (= e!337306 e!337307)))

(declare-fun c!66796 () Bool)

(assert (=> b!590806 (= c!66796 (= lt!268052 lt!267992))))

(declare-fun b!590808 () Bool)

(assert (=> b!590808 (= e!337306 Undefined!6141)))

(declare-fun b!590809 () Bool)

(assert (=> b!590809 (= e!337307 (Found!6141 lt!267993))))

(declare-fun b!590810 () Bool)

(assert (=> b!590810 (= e!337308 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267993 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!267992 lt!267995 mask!3053))))

(declare-fun d!86139 () Bool)

(declare-fun lt!268053 () SeekEntryResult!6141)

(assert (=> d!86139 (and (or ((_ is Undefined!6141) lt!268053) (not ((_ is Found!6141) lt!268053)) (and (bvsge (index!26798 lt!268053) #b00000000000000000000000000000000) (bvslt (index!26798 lt!268053) (size!18065 lt!267995)))) (or ((_ is Undefined!6141) lt!268053) ((_ is Found!6141) lt!268053) (not ((_ is MissingVacant!6141) lt!268053)) (not (= (index!26800 lt!268053) vacantSpotIndex!68)) (and (bvsge (index!26800 lt!268053) #b00000000000000000000000000000000) (bvslt (index!26800 lt!268053) (size!18065 lt!267995)))) (or ((_ is Undefined!6141) lt!268053) (ite ((_ is Found!6141) lt!268053) (= (select (arr!17701 lt!267995) (index!26798 lt!268053)) lt!267992) (and ((_ is MissingVacant!6141) lt!268053) (= (index!26800 lt!268053) vacantSpotIndex!68) (= (select (arr!17701 lt!267995) (index!26800 lt!268053)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86139 (= lt!268053 e!337306)))

(declare-fun c!66795 () Bool)

(assert (=> d!86139 (= c!66795 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86139 (= lt!268052 (select (arr!17701 lt!267995) lt!267993))))

(assert (=> d!86139 (validMask!0 mask!3053)))

(assert (=> d!86139 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267993 vacantSpotIndex!68 lt!267992 lt!267995 mask!3053) lt!268053)))

(declare-fun b!590807 () Bool)

(assert (=> b!590807 (= e!337308 (MissingVacant!6141 vacantSpotIndex!68))))

(assert (= (and d!86139 c!66795) b!590808))

(assert (= (and d!86139 (not c!66795)) b!590806))

(assert (= (and b!590806 c!66796) b!590809))

(assert (= (and b!590806 (not c!66796)) b!590805))

(assert (= (and b!590805 c!66797) b!590807))

(assert (= (and b!590805 (not c!66797)) b!590810))

(assert (=> b!590810 m!569153))

(assert (=> b!590810 m!569153))

(declare-fun m!569181 () Bool)

(assert (=> b!590810 m!569181))

(declare-fun m!569183 () Bool)

(assert (=> d!86139 m!569183))

(declare-fun m!569185 () Bool)

(assert (=> d!86139 m!569185))

(declare-fun m!569187 () Bool)

(assert (=> d!86139 m!569187))

(assert (=> d!86139 m!569069))

(assert (=> b!590675 d!86139))

(declare-fun d!86141 () Bool)

(assert (=> d!86141 (= (validKeyInArray!0 (select (arr!17701 a!2986) j!136)) (and (not (= (select (arr!17701 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17701 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590685 d!86141))

(declare-fun d!86143 () Bool)

(declare-fun res!377953 () Bool)

(declare-fun e!337322 () Bool)

(assert (=> d!86143 (=> res!377953 e!337322)))

(assert (=> d!86143 (= res!377953 (= (select (arr!17701 lt!267995) j!136) (select (arr!17701 a!2986) j!136)))))

(assert (=> d!86143 (= (arrayContainsKey!0 lt!267995 (select (arr!17701 a!2986) j!136) j!136) e!337322)))

(declare-fun b!590833 () Bool)

(declare-fun e!337323 () Bool)

(assert (=> b!590833 (= e!337322 e!337323)))

(declare-fun res!377954 () Bool)

(assert (=> b!590833 (=> (not res!377954) (not e!337323))))

(assert (=> b!590833 (= res!377954 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18065 lt!267995)))))

(declare-fun b!590834 () Bool)

(assert (=> b!590834 (= e!337323 (arrayContainsKey!0 lt!267995 (select (arr!17701 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86143 (not res!377953)) b!590833))

(assert (= (and b!590833 res!377954) b!590834))

(declare-fun m!569199 () Bool)

(assert (=> d!86143 m!569199))

(assert (=> b!590834 m!569053))

(declare-fun m!569201 () Bool)

(assert (=> b!590834 m!569201))

(assert (=> b!590680 d!86143))

(declare-fun b!590841 () Bool)

(declare-fun c!66812 () Bool)

(declare-fun lt!268064 () (_ BitVec 64))

(assert (=> b!590841 (= c!66812 (= lt!268064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337328 () SeekEntryResult!6141)

(declare-fun e!337329 () SeekEntryResult!6141)

(assert (=> b!590841 (= e!337328 e!337329)))

(declare-fun b!590842 () Bool)

(declare-fun e!337327 () SeekEntryResult!6141)

(assert (=> b!590842 (= e!337327 e!337328)))

(declare-fun c!66811 () Bool)

(assert (=> b!590842 (= c!66811 (= lt!268064 (select (arr!17701 a!2986) j!136)))))

(declare-fun b!590844 () Bool)

(assert (=> b!590844 (= e!337327 Undefined!6141)))

(declare-fun b!590845 () Bool)

(assert (=> b!590845 (= e!337328 (Found!6141 index!984))))

(declare-fun b!590846 () Bool)

(assert (=> b!590846 (= e!337329 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!268065 () SeekEntryResult!6141)

(declare-fun d!86147 () Bool)

(assert (=> d!86147 (and (or ((_ is Undefined!6141) lt!268065) (not ((_ is Found!6141) lt!268065)) (and (bvsge (index!26798 lt!268065) #b00000000000000000000000000000000) (bvslt (index!26798 lt!268065) (size!18065 a!2986)))) (or ((_ is Undefined!6141) lt!268065) ((_ is Found!6141) lt!268065) (not ((_ is MissingVacant!6141) lt!268065)) (not (= (index!26800 lt!268065) vacantSpotIndex!68)) (and (bvsge (index!26800 lt!268065) #b00000000000000000000000000000000) (bvslt (index!26800 lt!268065) (size!18065 a!2986)))) (or ((_ is Undefined!6141) lt!268065) (ite ((_ is Found!6141) lt!268065) (= (select (arr!17701 a!2986) (index!26798 lt!268065)) (select (arr!17701 a!2986) j!136)) (and ((_ is MissingVacant!6141) lt!268065) (= (index!26800 lt!268065) vacantSpotIndex!68) (= (select (arr!17701 a!2986) (index!26800 lt!268065)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86147 (= lt!268065 e!337327)))

(declare-fun c!66810 () Bool)

(assert (=> d!86147 (= c!66810 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86147 (= lt!268064 (select (arr!17701 a!2986) index!984))))

(assert (=> d!86147 (validMask!0 mask!3053)))

(assert (=> d!86147 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053) lt!268065)))

(declare-fun b!590843 () Bool)

(assert (=> b!590843 (= e!337329 (MissingVacant!6141 vacantSpotIndex!68))))

(assert (= (and d!86147 c!66810) b!590844))

(assert (= (and d!86147 (not c!66810)) b!590842))

(assert (= (and b!590842 c!66811) b!590845))

(assert (= (and b!590842 (not c!66811)) b!590841))

(assert (= (and b!590841 c!66812) b!590843))

(assert (= (and b!590841 (not c!66812)) b!590846))

(assert (=> b!590846 m!569049))

(assert (=> b!590846 m!569049))

(assert (=> b!590846 m!569053))

(declare-fun m!569213 () Bool)

(assert (=> b!590846 m!569213))

(declare-fun m!569215 () Bool)

(assert (=> d!86147 m!569215))

(declare-fun m!569217 () Bool)

(assert (=> d!86147 m!569217))

(assert (=> d!86147 m!569083))

(assert (=> d!86147 m!569069))

(assert (=> b!590679 d!86147))

(declare-fun d!86153 () Bool)

(declare-fun lt!268096 () SeekEntryResult!6141)

(assert (=> d!86153 (and (or ((_ is Undefined!6141) lt!268096) (not ((_ is Found!6141) lt!268096)) (and (bvsge (index!26798 lt!268096) #b00000000000000000000000000000000) (bvslt (index!26798 lt!268096) (size!18065 a!2986)))) (or ((_ is Undefined!6141) lt!268096) ((_ is Found!6141) lt!268096) (not ((_ is MissingZero!6141) lt!268096)) (and (bvsge (index!26797 lt!268096) #b00000000000000000000000000000000) (bvslt (index!26797 lt!268096) (size!18065 a!2986)))) (or ((_ is Undefined!6141) lt!268096) ((_ is Found!6141) lt!268096) ((_ is MissingZero!6141) lt!268096) (not ((_ is MissingVacant!6141) lt!268096)) (and (bvsge (index!26800 lt!268096) #b00000000000000000000000000000000) (bvslt (index!26800 lt!268096) (size!18065 a!2986)))) (or ((_ is Undefined!6141) lt!268096) (ite ((_ is Found!6141) lt!268096) (= (select (arr!17701 a!2986) (index!26798 lt!268096)) k0!1786) (ite ((_ is MissingZero!6141) lt!268096) (= (select (arr!17701 a!2986) (index!26797 lt!268096)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6141) lt!268096) (= (select (arr!17701 a!2986) (index!26800 lt!268096)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!337362 () SeekEntryResult!6141)

(assert (=> d!86153 (= lt!268096 e!337362)))

(declare-fun c!66834 () Bool)

(declare-fun lt!268090 () SeekEntryResult!6141)

(assert (=> d!86153 (= c!66834 (and ((_ is Intermediate!6141) lt!268090) (undefined!6953 lt!268090)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36859 (_ BitVec 32)) SeekEntryResult!6141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86153 (= lt!268090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86153 (validMask!0 mask!3053)))

(assert (=> d!86153 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!268096)))

(declare-fun b!590897 () Bool)

(declare-fun e!337360 () SeekEntryResult!6141)

(assert (=> b!590897 (= e!337362 e!337360)))

(declare-fun lt!268095 () (_ BitVec 64))

(assert (=> b!590897 (= lt!268095 (select (arr!17701 a!2986) (index!26799 lt!268090)))))

(declare-fun c!66835 () Bool)

(assert (=> b!590897 (= c!66835 (= lt!268095 k0!1786))))

(declare-fun e!337361 () SeekEntryResult!6141)

(declare-fun b!590898 () Bool)

(assert (=> b!590898 (= e!337361 (seekKeyOrZeroReturnVacant!0 (x!55588 lt!268090) (index!26799 lt!268090) (index!26799 lt!268090) k0!1786 a!2986 mask!3053))))

(declare-fun b!590899 () Bool)

(assert (=> b!590899 (= e!337360 (Found!6141 (index!26799 lt!268090)))))

(declare-fun b!590900 () Bool)

(declare-fun c!66833 () Bool)

(assert (=> b!590900 (= c!66833 (= lt!268095 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590900 (= e!337360 e!337361)))

(declare-fun b!590901 () Bool)

(assert (=> b!590901 (= e!337361 (MissingZero!6141 (index!26799 lt!268090)))))

(declare-fun b!590902 () Bool)

(assert (=> b!590902 (= e!337362 Undefined!6141)))

(assert (= (and d!86153 c!66834) b!590902))

(assert (= (and d!86153 (not c!66834)) b!590897))

(assert (= (and b!590897 c!66835) b!590899))

(assert (= (and b!590897 (not c!66835)) b!590900))

(assert (= (and b!590900 c!66833) b!590901))

(assert (= (and b!590900 (not c!66833)) b!590898))

(declare-fun m!569267 () Bool)

(assert (=> d!86153 m!569267))

(declare-fun m!569269 () Bool)

(assert (=> d!86153 m!569269))

(declare-fun m!569271 () Bool)

(assert (=> d!86153 m!569271))

(declare-fun m!569273 () Bool)

(assert (=> d!86153 m!569273))

(assert (=> d!86153 m!569069))

(declare-fun m!569275 () Bool)

(assert (=> d!86153 m!569275))

(assert (=> d!86153 m!569271))

(declare-fun m!569277 () Bool)

(assert (=> b!590897 m!569277))

(declare-fun m!569279 () Bool)

(assert (=> b!590898 m!569279))

(assert (=> b!590690 d!86153))

(declare-fun b!590935 () Bool)

(declare-fun e!337389 () Bool)

(declare-fun call!32825 () Bool)

(assert (=> b!590935 (= e!337389 call!32825)))

(declare-fun b!590936 () Bool)

(declare-fun e!337388 () Bool)

(declare-fun contains!2908 (List!11742 (_ BitVec 64)) Bool)

(assert (=> b!590936 (= e!337388 (contains!2908 Nil!11739 (select (arr!17701 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590937 () Bool)

(declare-fun e!337391 () Bool)

(assert (=> b!590937 (= e!337391 e!337389)))

(declare-fun c!66842 () Bool)

(assert (=> b!590937 (= c!66842 (validKeyInArray!0 (select (arr!17701 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590938 () Bool)

(declare-fun e!337390 () Bool)

(assert (=> b!590938 (= e!337390 e!337391)))

(declare-fun res!377984 () Bool)

(assert (=> b!590938 (=> (not res!377984) (not e!337391))))

(assert (=> b!590938 (= res!377984 (not e!337388))))

(declare-fun res!377986 () Bool)

(assert (=> b!590938 (=> (not res!377986) (not e!337388))))

(assert (=> b!590938 (= res!377986 (validKeyInArray!0 (select (arr!17701 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32822 () Bool)

(assert (=> bm!32822 (= call!32825 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66842 (Cons!11738 (select (arr!17701 a!2986) #b00000000000000000000000000000000) Nil!11739) Nil!11739)))))

(declare-fun b!590934 () Bool)

(assert (=> b!590934 (= e!337389 call!32825)))

(declare-fun d!86173 () Bool)

(declare-fun res!377985 () Bool)

(assert (=> d!86173 (=> res!377985 e!337390)))

(assert (=> d!86173 (= res!377985 (bvsge #b00000000000000000000000000000000 (size!18065 a!2986)))))

(assert (=> d!86173 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11739) e!337390)))

(assert (= (and d!86173 (not res!377985)) b!590938))

(assert (= (and b!590938 res!377986) b!590936))

(assert (= (and b!590938 res!377984) b!590937))

(assert (= (and b!590937 c!66842) b!590935))

(assert (= (and b!590937 (not c!66842)) b!590934))

(assert (= (or b!590935 b!590934) bm!32822))

(assert (=> b!590936 m!569139))

(assert (=> b!590936 m!569139))

(declare-fun m!569297 () Bool)

(assert (=> b!590936 m!569297))

(assert (=> b!590937 m!569139))

(assert (=> b!590937 m!569139))

(assert (=> b!590937 m!569147))

(assert (=> b!590938 m!569139))

(assert (=> b!590938 m!569139))

(assert (=> b!590938 m!569147))

(assert (=> bm!32822 m!569139))

(declare-fun m!569299 () Bool)

(assert (=> bm!32822 m!569299))

(assert (=> b!590684 d!86173))

(declare-fun d!86179 () Bool)

(assert (=> d!86179 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590678 d!86179))

(declare-fun d!86181 () Bool)

(assert (=> d!86181 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54072 d!86181))

(declare-fun d!86183 () Bool)

(assert (=> d!86183 (= (array_inv!13497 a!2986) (bvsge (size!18065 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54072 d!86183))

(declare-fun d!86185 () Bool)

(declare-fun res!377987 () Bool)

(declare-fun e!337392 () Bool)

(assert (=> d!86185 (=> res!377987 e!337392)))

(assert (=> d!86185 (= res!377987 (= (select (arr!17701 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86185 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!337392)))

(declare-fun b!590939 () Bool)

(declare-fun e!337393 () Bool)

(assert (=> b!590939 (= e!337392 e!337393)))

(declare-fun res!377988 () Bool)

(assert (=> b!590939 (=> (not res!377988) (not e!337393))))

(assert (=> b!590939 (= res!377988 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18065 a!2986)))))

(declare-fun b!590940 () Bool)

(assert (=> b!590940 (= e!337393 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86185 (not res!377987)) b!590939))

(assert (= (and b!590939 res!377988) b!590940))

(assert (=> d!86185 m!569139))

(declare-fun m!569301 () Bool)

(assert (=> b!590940 m!569301))

(assert (=> b!590688 d!86185))

(check-sat (not d!86139) (not b!590898) (not b!590938) (not b!590752) (not b!590753) (not b!590846) (not d!86153) (not b!590937) (not b!590940) (not d!86147) (not bm!32822) (not b!590810) (not b!590783) (not b!590936) (not d!86125) (not bm!32813) (not d!86129) (not d!86127) (not d!86119) (not b!590834) (not b!590777) (not b!590800))
(check-sat)
