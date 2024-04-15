; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54168 () Bool)

(assert start!54168)

(declare-fun b!592099 () Bool)

(declare-fun e!338112 () Bool)

(declare-fun e!338101 () Bool)

(assert (=> b!592099 (= e!338112 e!338101)))

(declare-fun res!379084 () Bool)

(assert (=> b!592099 (=> (not res!379084) (not e!338101))))

(declare-datatypes ((SeekEntryResult!6163 0))(
  ( (MissingZero!6163 (index!26888 (_ BitVec 32))) (Found!6163 (index!26889 (_ BitVec 32))) (Intermediate!6163 (undefined!6975 Bool) (index!26890 (_ BitVec 32)) (x!55686 (_ BitVec 32))) (Undefined!6163) (MissingVacant!6163 (index!26891 (_ BitVec 32))) )
))
(declare-fun lt!268660 () SeekEntryResult!6163)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36912 0))(
  ( (array!36913 (arr!17726 (Array (_ BitVec 32) (_ BitVec 64))) (size!18091 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36912)

(assert (=> b!592099 (= res!379084 (and (= lt!268660 (Found!6163 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17726 a!2986) index!984) (select (arr!17726 a!2986) j!136))) (not (= (select (arr!17726 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36912 (_ BitVec 32)) SeekEntryResult!6163)

(assert (=> b!592099 (= lt!268660 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592100 () Bool)

(declare-fun res!379085 () Bool)

(declare-fun e!338106 () Bool)

(assert (=> b!592100 (=> (not res!379085) (not e!338106))))

(assert (=> b!592100 (= res!379085 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17726 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592101 () Bool)

(declare-fun e!338103 () Bool)

(assert (=> b!592101 (= e!338101 (not e!338103))))

(declare-fun res!379096 () Bool)

(assert (=> b!592101 (=> res!379096 e!338103)))

(declare-fun lt!268663 () SeekEntryResult!6163)

(assert (=> b!592101 (= res!379096 (not (= lt!268663 (Found!6163 index!984))))))

(declare-datatypes ((Unit!18564 0))(
  ( (Unit!18565) )
))
(declare-fun lt!268669 () Unit!18564)

(declare-fun e!338102 () Unit!18564)

(assert (=> b!592101 (= lt!268669 e!338102)))

(declare-fun c!66876 () Bool)

(assert (=> b!592101 (= c!66876 (= lt!268663 Undefined!6163))))

(declare-fun lt!268665 () array!36912)

(declare-fun lt!268661 () (_ BitVec 64))

(assert (=> b!592101 (= lt!268663 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268661 lt!268665 mask!3053))))

(declare-fun e!338108 () Bool)

(assert (=> b!592101 e!338108))

(declare-fun res!379086 () Bool)

(assert (=> b!592101 (=> (not res!379086) (not e!338108))))

(declare-fun lt!268664 () (_ BitVec 32))

(declare-fun lt!268668 () SeekEntryResult!6163)

(assert (=> b!592101 (= res!379086 (= lt!268668 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 lt!268661 lt!268665 mask!3053)))))

(assert (=> b!592101 (= lt!268668 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!592101 (= lt!268661 (select (store (arr!17726 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268666 () Unit!18564)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36912 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18564)

(assert (=> b!592101 (= lt!268666 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592101 (= lt!268664 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592102 () Bool)

(declare-fun Unit!18566 () Unit!18564)

(assert (=> b!592102 (= e!338102 Unit!18566)))

(assert (=> b!592102 false))

(declare-fun b!592103 () Bool)

(declare-fun e!338109 () Bool)

(assert (=> b!592103 (= e!338103 e!338109)))

(declare-fun res!379089 () Bool)

(assert (=> b!592103 (=> res!379089 e!338109)))

(declare-fun lt!268659 () (_ BitVec 64))

(assert (=> b!592103 (= res!379089 (or (not (= (select (arr!17726 a!2986) j!136) lt!268661)) (not (= (select (arr!17726 a!2986) j!136) lt!268659)) (bvsge j!136 index!984)))))

(declare-fun e!338105 () Bool)

(assert (=> b!592103 e!338105))

(declare-fun res!379097 () Bool)

(assert (=> b!592103 (=> (not res!379097) (not e!338105))))

(assert (=> b!592103 (= res!379097 (= lt!268659 (select (arr!17726 a!2986) j!136)))))

(assert (=> b!592103 (= lt!268659 (select (store (arr!17726 a!2986) i!1108 k0!1786) index!984))))

(declare-fun e!338111 () Bool)

(declare-fun b!592104 () Bool)

(declare-fun arrayContainsKey!0 (array!36912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592104 (= e!338111 (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) index!984))))

(declare-fun b!592105 () Bool)

(declare-fun e!338107 () Bool)

(assert (=> b!592105 (= e!338107 e!338106)))

(declare-fun res!379083 () Bool)

(assert (=> b!592105 (=> (not res!379083) (not e!338106))))

(declare-fun lt!268667 () SeekEntryResult!6163)

(assert (=> b!592105 (= res!379083 (or (= lt!268667 (MissingZero!6163 i!1108)) (= lt!268667 (MissingVacant!6163 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36912 (_ BitVec 32)) SeekEntryResult!6163)

(assert (=> b!592105 (= lt!268667 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592106 () Bool)

(declare-fun res!379087 () Bool)

(assert (=> b!592106 (=> (not res!379087) (not e!338107))))

(assert (=> b!592106 (= res!379087 (and (= (size!18091 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18091 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18091 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!379088 () Bool)

(assert (=> start!54168 (=> (not res!379088) (not e!338107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54168 (= res!379088 (validMask!0 mask!3053))))

(assert (=> start!54168 e!338107))

(assert (=> start!54168 true))

(declare-fun array_inv!13609 (array!36912) Bool)

(assert (=> start!54168 (array_inv!13609 a!2986)))

(declare-fun b!592107 () Bool)

(declare-fun res!379091 () Bool)

(assert (=> b!592107 (=> (not res!379091) (not e!338106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36912 (_ BitVec 32)) Bool)

(assert (=> b!592107 (= res!379091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592108 () Bool)

(declare-fun Unit!18567 () Unit!18564)

(assert (=> b!592108 (= e!338102 Unit!18567)))

(declare-fun b!592109 () Bool)

(assert (=> b!592109 (= e!338109 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18091 a!2986)) (bvslt (size!18091 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!592109 (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268662 () Unit!18564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36912 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18564)

(assert (=> b!592109 (= lt!268662 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268665 (select (arr!17726 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592110 () Bool)

(declare-fun res!379090 () Bool)

(assert (=> b!592110 (=> (not res!379090) (not e!338106))))

(declare-datatypes ((List!11806 0))(
  ( (Nil!11803) (Cons!11802 (h!12847 (_ BitVec 64)) (t!18025 List!11806)) )
))
(declare-fun arrayNoDuplicates!0 (array!36912 (_ BitVec 32) List!11806) Bool)

(assert (=> b!592110 (= res!379090 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11803))))

(declare-fun b!592111 () Bool)

(declare-fun e!338110 () Bool)

(assert (=> b!592111 (= e!338105 e!338110)))

(declare-fun res!379094 () Bool)

(assert (=> b!592111 (=> res!379094 e!338110)))

(assert (=> b!592111 (= res!379094 (or (not (= (select (arr!17726 a!2986) j!136) lt!268661)) (not (= (select (arr!17726 a!2986) j!136) lt!268659)) (bvsge j!136 index!984)))))

(declare-fun b!592112 () Bool)

(declare-fun res!379081 () Bool)

(assert (=> b!592112 (=> (not res!379081) (not e!338107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592112 (= res!379081 (validKeyInArray!0 (select (arr!17726 a!2986) j!136)))))

(declare-fun b!592113 () Bool)

(declare-fun res!379082 () Bool)

(assert (=> b!592113 (=> (not res!379082) (not e!338107))))

(assert (=> b!592113 (= res!379082 (validKeyInArray!0 k0!1786))))

(declare-fun b!592114 () Bool)

(declare-fun res!379092 () Bool)

(assert (=> b!592114 (=> (not res!379092) (not e!338107))))

(assert (=> b!592114 (= res!379092 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592115 () Bool)

(assert (=> b!592115 (= e!338110 e!338111)))

(declare-fun res!379093 () Bool)

(assert (=> b!592115 (=> (not res!379093) (not e!338111))))

(assert (=> b!592115 (= res!379093 (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) j!136))))

(declare-fun b!592116 () Bool)

(assert (=> b!592116 (= e!338108 (= lt!268660 lt!268668))))

(declare-fun b!592117 () Bool)

(assert (=> b!592117 (= e!338106 e!338112)))

(declare-fun res!379095 () Bool)

(assert (=> b!592117 (=> (not res!379095) (not e!338112))))

(assert (=> b!592117 (= res!379095 (= (select (store (arr!17726 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592117 (= lt!268665 (array!36913 (store (arr!17726 a!2986) i!1108 k0!1786) (size!18091 a!2986)))))

(assert (= (and start!54168 res!379088) b!592106))

(assert (= (and b!592106 res!379087) b!592112))

(assert (= (and b!592112 res!379081) b!592113))

(assert (= (and b!592113 res!379082) b!592114))

(assert (= (and b!592114 res!379092) b!592105))

(assert (= (and b!592105 res!379083) b!592107))

(assert (= (and b!592107 res!379091) b!592110))

(assert (= (and b!592110 res!379090) b!592100))

(assert (= (and b!592100 res!379085) b!592117))

(assert (= (and b!592117 res!379095) b!592099))

(assert (= (and b!592099 res!379084) b!592101))

(assert (= (and b!592101 res!379086) b!592116))

(assert (= (and b!592101 c!66876) b!592102))

(assert (= (and b!592101 (not c!66876)) b!592108))

(assert (= (and b!592101 (not res!379096)) b!592103))

(assert (= (and b!592103 res!379097) b!592111))

(assert (= (and b!592111 (not res!379094)) b!592115))

(assert (= (and b!592115 res!379093) b!592104))

(assert (= (and b!592103 (not res!379089)) b!592109))

(declare-fun m!569701 () Bool)

(assert (=> b!592115 m!569701))

(assert (=> b!592115 m!569701))

(declare-fun m!569703 () Bool)

(assert (=> b!592115 m!569703))

(declare-fun m!569705 () Bool)

(assert (=> b!592107 m!569705))

(declare-fun m!569707 () Bool)

(assert (=> b!592105 m!569707))

(declare-fun m!569709 () Bool)

(assert (=> b!592110 m!569709))

(assert (=> b!592112 m!569701))

(assert (=> b!592112 m!569701))

(declare-fun m!569711 () Bool)

(assert (=> b!592112 m!569711))

(declare-fun m!569713 () Bool)

(assert (=> b!592113 m!569713))

(assert (=> b!592104 m!569701))

(assert (=> b!592104 m!569701))

(declare-fun m!569715 () Bool)

(assert (=> b!592104 m!569715))

(declare-fun m!569717 () Bool)

(assert (=> b!592101 m!569717))

(declare-fun m!569719 () Bool)

(assert (=> b!592101 m!569719))

(declare-fun m!569721 () Bool)

(assert (=> b!592101 m!569721))

(assert (=> b!592101 m!569701))

(declare-fun m!569723 () Bool)

(assert (=> b!592101 m!569723))

(declare-fun m!569725 () Bool)

(assert (=> b!592101 m!569725))

(declare-fun m!569727 () Bool)

(assert (=> b!592101 m!569727))

(assert (=> b!592101 m!569701))

(declare-fun m!569729 () Bool)

(assert (=> b!592101 m!569729))

(declare-fun m!569731 () Bool)

(assert (=> b!592100 m!569731))

(assert (=> b!592103 m!569701))

(assert (=> b!592103 m!569723))

(declare-fun m!569733 () Bool)

(assert (=> b!592103 m!569733))

(declare-fun m!569735 () Bool)

(assert (=> b!592099 m!569735))

(assert (=> b!592099 m!569701))

(assert (=> b!592099 m!569701))

(declare-fun m!569737 () Bool)

(assert (=> b!592099 m!569737))

(declare-fun m!569739 () Bool)

(assert (=> b!592114 m!569739))

(declare-fun m!569741 () Bool)

(assert (=> start!54168 m!569741))

(declare-fun m!569743 () Bool)

(assert (=> start!54168 m!569743))

(assert (=> b!592117 m!569723))

(declare-fun m!569745 () Bool)

(assert (=> b!592117 m!569745))

(assert (=> b!592111 m!569701))

(assert (=> b!592109 m!569701))

(assert (=> b!592109 m!569701))

(declare-fun m!569747 () Bool)

(assert (=> b!592109 m!569747))

(assert (=> b!592109 m!569701))

(declare-fun m!569749 () Bool)

(assert (=> b!592109 m!569749))

(check-sat (not b!592113) (not b!592109) (not b!592101) (not b!592107) (not b!592105) (not b!592115) (not b!592114) (not b!592099) (not b!592110) (not b!592104) (not b!592112) (not start!54168))
(check-sat)
(get-model)

(declare-fun d!86011 () Bool)

(assert (=> d!86011 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592113 d!86011))

(declare-fun d!86013 () Bool)

(assert (=> d!86013 (= (validKeyInArray!0 (select (arr!17726 a!2986) j!136)) (and (not (= (select (arr!17726 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17726 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592112 d!86013))

(declare-fun b!592244 () Bool)

(declare-fun e!338193 () SeekEntryResult!6163)

(assert (=> b!592244 (= e!338193 (MissingVacant!6163 vacantSpotIndex!68))))

(declare-fun b!592245 () Bool)

(assert (=> b!592245 (= e!338193 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268664 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!268740 () SeekEntryResult!6163)

(declare-fun d!86015 () Bool)

(get-info :version)

(assert (=> d!86015 (and (or ((_ is Undefined!6163) lt!268740) (not ((_ is Found!6163) lt!268740)) (and (bvsge (index!26889 lt!268740) #b00000000000000000000000000000000) (bvslt (index!26889 lt!268740) (size!18091 a!2986)))) (or ((_ is Undefined!6163) lt!268740) ((_ is Found!6163) lt!268740) (not ((_ is MissingVacant!6163) lt!268740)) (not (= (index!26891 lt!268740) vacantSpotIndex!68)) (and (bvsge (index!26891 lt!268740) #b00000000000000000000000000000000) (bvslt (index!26891 lt!268740) (size!18091 a!2986)))) (or ((_ is Undefined!6163) lt!268740) (ite ((_ is Found!6163) lt!268740) (= (select (arr!17726 a!2986) (index!26889 lt!268740)) (select (arr!17726 a!2986) j!136)) (and ((_ is MissingVacant!6163) lt!268740) (= (index!26891 lt!268740) vacantSpotIndex!68) (= (select (arr!17726 a!2986) (index!26891 lt!268740)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338192 () SeekEntryResult!6163)

(assert (=> d!86015 (= lt!268740 e!338192)))

(declare-fun c!66890 () Bool)

(assert (=> d!86015 (= c!66890 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!268741 () (_ BitVec 64))

(assert (=> d!86015 (= lt!268741 (select (arr!17726 a!2986) lt!268664))))

(assert (=> d!86015 (validMask!0 mask!3053)))

(assert (=> d!86015 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053) lt!268740)))

(declare-fun b!592246 () Bool)

(declare-fun e!338191 () SeekEntryResult!6163)

(assert (=> b!592246 (= e!338191 (Found!6163 lt!268664))))

(declare-fun b!592247 () Bool)

(assert (=> b!592247 (= e!338192 e!338191)))

(declare-fun c!66889 () Bool)

(assert (=> b!592247 (= c!66889 (= lt!268741 (select (arr!17726 a!2986) j!136)))))

(declare-fun b!592248 () Bool)

(declare-fun c!66891 () Bool)

(assert (=> b!592248 (= c!66891 (= lt!268741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592248 (= e!338191 e!338193)))

(declare-fun b!592249 () Bool)

(assert (=> b!592249 (= e!338192 Undefined!6163)))

(assert (= (and d!86015 c!66890) b!592249))

(assert (= (and d!86015 (not c!66890)) b!592247))

(assert (= (and b!592247 c!66889) b!592246))

(assert (= (and b!592247 (not c!66889)) b!592248))

(assert (= (and b!592248 c!66891) b!592244))

(assert (= (and b!592248 (not c!66891)) b!592245))

(declare-fun m!569851 () Bool)

(assert (=> b!592245 m!569851))

(assert (=> b!592245 m!569851))

(assert (=> b!592245 m!569701))

(declare-fun m!569853 () Bool)

(assert (=> b!592245 m!569853))

(declare-fun m!569855 () Bool)

(assert (=> d!86015 m!569855))

(declare-fun m!569857 () Bool)

(assert (=> d!86015 m!569857))

(declare-fun m!569859 () Bool)

(assert (=> d!86015 m!569859))

(assert (=> d!86015 m!569741))

(assert (=> b!592101 d!86015))

(declare-fun b!592250 () Bool)

(declare-fun e!338196 () SeekEntryResult!6163)

(assert (=> b!592250 (= e!338196 (MissingVacant!6163 vacantSpotIndex!68))))

(declare-fun b!592251 () Bool)

(assert (=> b!592251 (= e!338196 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!268661 lt!268665 mask!3053))))

(declare-fun d!86017 () Bool)

(declare-fun lt!268742 () SeekEntryResult!6163)

(assert (=> d!86017 (and (or ((_ is Undefined!6163) lt!268742) (not ((_ is Found!6163) lt!268742)) (and (bvsge (index!26889 lt!268742) #b00000000000000000000000000000000) (bvslt (index!26889 lt!268742) (size!18091 lt!268665)))) (or ((_ is Undefined!6163) lt!268742) ((_ is Found!6163) lt!268742) (not ((_ is MissingVacant!6163) lt!268742)) (not (= (index!26891 lt!268742) vacantSpotIndex!68)) (and (bvsge (index!26891 lt!268742) #b00000000000000000000000000000000) (bvslt (index!26891 lt!268742) (size!18091 lt!268665)))) (or ((_ is Undefined!6163) lt!268742) (ite ((_ is Found!6163) lt!268742) (= (select (arr!17726 lt!268665) (index!26889 lt!268742)) lt!268661) (and ((_ is MissingVacant!6163) lt!268742) (= (index!26891 lt!268742) vacantSpotIndex!68) (= (select (arr!17726 lt!268665) (index!26891 lt!268742)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338195 () SeekEntryResult!6163)

(assert (=> d!86017 (= lt!268742 e!338195)))

(declare-fun c!66893 () Bool)

(assert (=> d!86017 (= c!66893 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!268743 () (_ BitVec 64))

(assert (=> d!86017 (= lt!268743 (select (arr!17726 lt!268665) index!984))))

(assert (=> d!86017 (validMask!0 mask!3053)))

(assert (=> d!86017 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268661 lt!268665 mask!3053) lt!268742)))

(declare-fun b!592252 () Bool)

(declare-fun e!338194 () SeekEntryResult!6163)

(assert (=> b!592252 (= e!338194 (Found!6163 index!984))))

(declare-fun b!592253 () Bool)

(assert (=> b!592253 (= e!338195 e!338194)))

(declare-fun c!66892 () Bool)

(assert (=> b!592253 (= c!66892 (= lt!268743 lt!268661))))

(declare-fun b!592254 () Bool)

(declare-fun c!66894 () Bool)

(assert (=> b!592254 (= c!66894 (= lt!268743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592254 (= e!338194 e!338196)))

(declare-fun b!592255 () Bool)

(assert (=> b!592255 (= e!338195 Undefined!6163)))

(assert (= (and d!86017 c!66893) b!592255))

(assert (= (and d!86017 (not c!66893)) b!592253))

(assert (= (and b!592253 c!66892) b!592252))

(assert (= (and b!592253 (not c!66892)) b!592254))

(assert (= (and b!592254 c!66894) b!592250))

(assert (= (and b!592254 (not c!66894)) b!592251))

(assert (=> b!592251 m!569717))

(assert (=> b!592251 m!569717))

(declare-fun m!569861 () Bool)

(assert (=> b!592251 m!569861))

(declare-fun m!569863 () Bool)

(assert (=> d!86017 m!569863))

(declare-fun m!569865 () Bool)

(assert (=> d!86017 m!569865))

(declare-fun m!569867 () Bool)

(assert (=> d!86017 m!569867))

(assert (=> d!86017 m!569741))

(assert (=> b!592101 d!86017))

(declare-fun d!86019 () Bool)

(declare-fun lt!268746 () (_ BitVec 32))

(assert (=> d!86019 (and (bvsge lt!268746 #b00000000000000000000000000000000) (bvslt lt!268746 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86019 (= lt!268746 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86019 (validMask!0 mask!3053)))

(assert (=> d!86019 (= (nextIndex!0 index!984 x!910 mask!3053) lt!268746)))

(declare-fun bs!18259 () Bool)

(assert (= bs!18259 d!86019))

(declare-fun m!569869 () Bool)

(assert (=> bs!18259 m!569869))

(assert (=> bs!18259 m!569741))

(assert (=> b!592101 d!86019))

(declare-fun b!592256 () Bool)

(declare-fun e!338199 () SeekEntryResult!6163)

(assert (=> b!592256 (= e!338199 (MissingVacant!6163 vacantSpotIndex!68))))

(declare-fun b!592257 () Bool)

(assert (=> b!592257 (= e!338199 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268664 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!268661 lt!268665 mask!3053))))

(declare-fun d!86021 () Bool)

(declare-fun lt!268747 () SeekEntryResult!6163)

(assert (=> d!86021 (and (or ((_ is Undefined!6163) lt!268747) (not ((_ is Found!6163) lt!268747)) (and (bvsge (index!26889 lt!268747) #b00000000000000000000000000000000) (bvslt (index!26889 lt!268747) (size!18091 lt!268665)))) (or ((_ is Undefined!6163) lt!268747) ((_ is Found!6163) lt!268747) (not ((_ is MissingVacant!6163) lt!268747)) (not (= (index!26891 lt!268747) vacantSpotIndex!68)) (and (bvsge (index!26891 lt!268747) #b00000000000000000000000000000000) (bvslt (index!26891 lt!268747) (size!18091 lt!268665)))) (or ((_ is Undefined!6163) lt!268747) (ite ((_ is Found!6163) lt!268747) (= (select (arr!17726 lt!268665) (index!26889 lt!268747)) lt!268661) (and ((_ is MissingVacant!6163) lt!268747) (= (index!26891 lt!268747) vacantSpotIndex!68) (= (select (arr!17726 lt!268665) (index!26891 lt!268747)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338198 () SeekEntryResult!6163)

(assert (=> d!86021 (= lt!268747 e!338198)))

(declare-fun c!66896 () Bool)

(assert (=> d!86021 (= c!66896 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!268748 () (_ BitVec 64))

(assert (=> d!86021 (= lt!268748 (select (arr!17726 lt!268665) lt!268664))))

(assert (=> d!86021 (validMask!0 mask!3053)))

(assert (=> d!86021 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 lt!268661 lt!268665 mask!3053) lt!268747)))

(declare-fun b!592258 () Bool)

(declare-fun e!338197 () SeekEntryResult!6163)

(assert (=> b!592258 (= e!338197 (Found!6163 lt!268664))))

(declare-fun b!592259 () Bool)

(assert (=> b!592259 (= e!338198 e!338197)))

(declare-fun c!66895 () Bool)

(assert (=> b!592259 (= c!66895 (= lt!268748 lt!268661))))

(declare-fun b!592260 () Bool)

(declare-fun c!66897 () Bool)

(assert (=> b!592260 (= c!66897 (= lt!268748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592260 (= e!338197 e!338199)))

(declare-fun b!592261 () Bool)

(assert (=> b!592261 (= e!338198 Undefined!6163)))

(assert (= (and d!86021 c!66896) b!592261))

(assert (= (and d!86021 (not c!66896)) b!592259))

(assert (= (and b!592259 c!66895) b!592258))

(assert (= (and b!592259 (not c!66895)) b!592260))

(assert (= (and b!592260 c!66897) b!592256))

(assert (= (and b!592260 (not c!66897)) b!592257))

(assert (=> b!592257 m!569851))

(assert (=> b!592257 m!569851))

(declare-fun m!569871 () Bool)

(assert (=> b!592257 m!569871))

(declare-fun m!569873 () Bool)

(assert (=> d!86021 m!569873))

(declare-fun m!569875 () Bool)

(assert (=> d!86021 m!569875))

(declare-fun m!569877 () Bool)

(assert (=> d!86021 m!569877))

(assert (=> d!86021 m!569741))

(assert (=> b!592101 d!86021))

(declare-fun d!86023 () Bool)

(declare-fun e!338202 () Bool)

(assert (=> d!86023 e!338202))

(declare-fun res!379202 () Bool)

(assert (=> d!86023 (=> (not res!379202) (not e!338202))))

(assert (=> d!86023 (= res!379202 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18091 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18091 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18091 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18091 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18091 a!2986))))))

(declare-fun lt!268751 () Unit!18564)

(declare-fun choose!9 (array!36912 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18564)

(assert (=> d!86023 (= lt!268751 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86023 (validMask!0 mask!3053)))

(assert (=> d!86023 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 mask!3053) lt!268751)))

(declare-fun b!592264 () Bool)

(assert (=> b!592264 (= e!338202 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268664 vacantSpotIndex!68 (select (store (arr!17726 a!2986) i!1108 k0!1786) j!136) (array!36913 (store (arr!17726 a!2986) i!1108 k0!1786) (size!18091 a!2986)) mask!3053)))))

(assert (= (and d!86023 res!379202) b!592264))

(declare-fun m!569879 () Bool)

(assert (=> d!86023 m!569879))

(assert (=> d!86023 m!569741))

(assert (=> b!592264 m!569719))

(assert (=> b!592264 m!569701))

(assert (=> b!592264 m!569723))

(assert (=> b!592264 m!569701))

(assert (=> b!592264 m!569729))

(assert (=> b!592264 m!569719))

(declare-fun m!569881 () Bool)

(assert (=> b!592264 m!569881))

(assert (=> b!592101 d!86023))

(declare-fun b!592283 () Bool)

(declare-fun e!338215 () SeekEntryResult!6163)

(declare-fun e!338216 () SeekEntryResult!6163)

(assert (=> b!592283 (= e!338215 e!338216)))

(declare-fun lt!268758 () (_ BitVec 64))

(declare-fun lt!268759 () SeekEntryResult!6163)

(assert (=> b!592283 (= lt!268758 (select (arr!17726 a!2986) (index!26890 lt!268759)))))

(declare-fun c!66904 () Bool)

(assert (=> b!592283 (= c!66904 (= lt!268758 k0!1786))))

(declare-fun d!86025 () Bool)

(declare-fun lt!268760 () SeekEntryResult!6163)

(assert (=> d!86025 (and (or ((_ is Undefined!6163) lt!268760) (not ((_ is Found!6163) lt!268760)) (and (bvsge (index!26889 lt!268760) #b00000000000000000000000000000000) (bvslt (index!26889 lt!268760) (size!18091 a!2986)))) (or ((_ is Undefined!6163) lt!268760) ((_ is Found!6163) lt!268760) (not ((_ is MissingZero!6163) lt!268760)) (and (bvsge (index!26888 lt!268760) #b00000000000000000000000000000000) (bvslt (index!26888 lt!268760) (size!18091 a!2986)))) (or ((_ is Undefined!6163) lt!268760) ((_ is Found!6163) lt!268760) ((_ is MissingZero!6163) lt!268760) (not ((_ is MissingVacant!6163) lt!268760)) (and (bvsge (index!26891 lt!268760) #b00000000000000000000000000000000) (bvslt (index!26891 lt!268760) (size!18091 a!2986)))) (or ((_ is Undefined!6163) lt!268760) (ite ((_ is Found!6163) lt!268760) (= (select (arr!17726 a!2986) (index!26889 lt!268760)) k0!1786) (ite ((_ is MissingZero!6163) lt!268760) (= (select (arr!17726 a!2986) (index!26888 lt!268760)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6163) lt!268760) (= (select (arr!17726 a!2986) (index!26891 lt!268760)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86025 (= lt!268760 e!338215)))

(declare-fun c!66906 () Bool)

(assert (=> d!86025 (= c!66906 (and ((_ is Intermediate!6163) lt!268759) (undefined!6975 lt!268759)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36912 (_ BitVec 32)) SeekEntryResult!6163)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86025 (= lt!268759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86025 (validMask!0 mask!3053)))

(assert (=> d!86025 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!268760)))

(declare-fun b!592284 () Bool)

(assert (=> b!592284 (= e!338215 Undefined!6163)))

(declare-fun b!592285 () Bool)

(declare-fun c!66905 () Bool)

(assert (=> b!592285 (= c!66905 (= lt!268758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338217 () SeekEntryResult!6163)

(assert (=> b!592285 (= e!338216 e!338217)))

(declare-fun b!592286 () Bool)

(assert (=> b!592286 (= e!338216 (Found!6163 (index!26890 lt!268759)))))

(declare-fun b!592287 () Bool)

(assert (=> b!592287 (= e!338217 (MissingZero!6163 (index!26890 lt!268759)))))

(declare-fun b!592288 () Bool)

(assert (=> b!592288 (= e!338217 (seekKeyOrZeroReturnVacant!0 (x!55686 lt!268759) (index!26890 lt!268759) (index!26890 lt!268759) k0!1786 a!2986 mask!3053))))

(assert (= (and d!86025 c!66906) b!592284))

(assert (= (and d!86025 (not c!66906)) b!592283))

(assert (= (and b!592283 c!66904) b!592286))

(assert (= (and b!592283 (not c!66904)) b!592285))

(assert (= (and b!592285 c!66905) b!592287))

(assert (= (and b!592285 (not c!66905)) b!592288))

(declare-fun m!569887 () Bool)

(assert (=> b!592283 m!569887))

(declare-fun m!569889 () Bool)

(assert (=> d!86025 m!569889))

(declare-fun m!569891 () Bool)

(assert (=> d!86025 m!569891))

(declare-fun m!569893 () Bool)

(assert (=> d!86025 m!569893))

(declare-fun m!569895 () Bool)

(assert (=> d!86025 m!569895))

(assert (=> d!86025 m!569889))

(declare-fun m!569897 () Bool)

(assert (=> d!86025 m!569897))

(assert (=> d!86025 m!569741))

(declare-fun m!569899 () Bool)

(assert (=> b!592288 m!569899))

(assert (=> b!592105 d!86025))

(declare-fun d!86035 () Bool)

(declare-fun res!379219 () Bool)

(declare-fun e!338230 () Bool)

(assert (=> d!86035 (=> res!379219 e!338230)))

(assert (=> d!86035 (= res!379219 (= (select (arr!17726 lt!268665) j!136) (select (arr!17726 a!2986) j!136)))))

(assert (=> d!86035 (= (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) j!136) e!338230)))

(declare-fun b!592303 () Bool)

(declare-fun e!338231 () Bool)

(assert (=> b!592303 (= e!338230 e!338231)))

(declare-fun res!379220 () Bool)

(assert (=> b!592303 (=> (not res!379220) (not e!338231))))

(assert (=> b!592303 (= res!379220 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18091 lt!268665)))))

(declare-fun b!592304 () Bool)

(assert (=> b!592304 (= e!338231 (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86035 (not res!379219)) b!592303))

(assert (= (and b!592303 res!379220) b!592304))

(declare-fun m!569901 () Bool)

(assert (=> d!86035 m!569901))

(assert (=> b!592304 m!569701))

(declare-fun m!569903 () Bool)

(assert (=> b!592304 m!569903))

(assert (=> b!592115 d!86035))

(declare-fun d!86041 () Bool)

(declare-fun res!379221 () Bool)

(declare-fun e!338232 () Bool)

(assert (=> d!86041 (=> res!379221 e!338232)))

(assert (=> d!86041 (= res!379221 (= (select (arr!17726 lt!268665) index!984) (select (arr!17726 a!2986) j!136)))))

(assert (=> d!86041 (= (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) index!984) e!338232)))

(declare-fun b!592305 () Bool)

(declare-fun e!338233 () Bool)

(assert (=> b!592305 (= e!338232 e!338233)))

(declare-fun res!379222 () Bool)

(assert (=> b!592305 (=> (not res!379222) (not e!338233))))

(assert (=> b!592305 (= res!379222 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18091 lt!268665)))))

(declare-fun b!592306 () Bool)

(assert (=> b!592306 (= e!338233 (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86041 (not res!379221)) b!592305))

(assert (= (and b!592305 res!379222) b!592306))

(assert (=> d!86041 m!569867))

(assert (=> b!592306 m!569701))

(declare-fun m!569905 () Bool)

(assert (=> b!592306 m!569905))

(assert (=> b!592104 d!86041))

(declare-fun d!86043 () Bool)

(declare-fun res!379223 () Bool)

(declare-fun e!338234 () Bool)

(assert (=> d!86043 (=> res!379223 e!338234)))

(assert (=> d!86043 (= res!379223 (= (select (arr!17726 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86043 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!338234)))

(declare-fun b!592307 () Bool)

(declare-fun e!338235 () Bool)

(assert (=> b!592307 (= e!338234 e!338235)))

(declare-fun res!379224 () Bool)

(assert (=> b!592307 (=> (not res!379224) (not e!338235))))

(assert (=> b!592307 (= res!379224 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18091 a!2986)))))

(declare-fun b!592308 () Bool)

(assert (=> b!592308 (= e!338235 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86043 (not res!379223)) b!592307))

(assert (= (and b!592307 res!379224) b!592308))

(declare-fun m!569907 () Bool)

(assert (=> d!86043 m!569907))

(declare-fun m!569909 () Bool)

(assert (=> b!592308 m!569909))

(assert (=> b!592114 d!86043))

(declare-fun d!86045 () Bool)

(assert (=> d!86045 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54168 d!86045))

(declare-fun d!86049 () Bool)

(assert (=> d!86049 (= (array_inv!13609 a!2986) (bvsge (size!18091 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54168 d!86049))

(declare-fun b!592343 () Bool)

(declare-fun e!338260 () Bool)

(declare-fun call!32812 () Bool)

(assert (=> b!592343 (= e!338260 call!32812)))

(declare-fun b!592344 () Bool)

(declare-fun e!338258 () Bool)

(assert (=> b!592344 (= e!338258 call!32812)))

(declare-fun b!592345 () Bool)

(declare-fun e!338259 () Bool)

(assert (=> b!592345 (= e!338259 e!338260)))

(declare-fun c!66921 () Bool)

(assert (=> b!592345 (= c!66921 (validKeyInArray!0 (select (arr!17726 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86051 () Bool)

(declare-fun res!379236 () Bool)

(assert (=> d!86051 (=> res!379236 e!338259)))

(assert (=> d!86051 (= res!379236 (bvsge #b00000000000000000000000000000000 (size!18091 a!2986)))))

(assert (=> d!86051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!338259)))

(declare-fun b!592346 () Bool)

(assert (=> b!592346 (= e!338260 e!338258)))

(declare-fun lt!268780 () (_ BitVec 64))

(assert (=> b!592346 (= lt!268780 (select (arr!17726 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!268778 () Unit!18564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36912 (_ BitVec 64) (_ BitVec 32)) Unit!18564)

(assert (=> b!592346 (= lt!268778 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!268780 #b00000000000000000000000000000000))))

(assert (=> b!592346 (arrayContainsKey!0 a!2986 lt!268780 #b00000000000000000000000000000000)))

(declare-fun lt!268779 () Unit!18564)

(assert (=> b!592346 (= lt!268779 lt!268778)))

(declare-fun res!379235 () Bool)

(assert (=> b!592346 (= res!379235 (= (seekEntryOrOpen!0 (select (arr!17726 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6163 #b00000000000000000000000000000000)))))

(assert (=> b!592346 (=> (not res!379235) (not e!338258))))

(declare-fun bm!32809 () Bool)

(assert (=> bm!32809 (= call!32812 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!86051 (not res!379236)) b!592345))

(assert (= (and b!592345 c!66921) b!592346))

(assert (= (and b!592345 (not c!66921)) b!592343))

(assert (= (and b!592346 res!379235) b!592344))

(assert (= (or b!592344 b!592343) bm!32809))

(assert (=> b!592345 m!569907))

(assert (=> b!592345 m!569907))

(declare-fun m!569931 () Bool)

(assert (=> b!592345 m!569931))

(assert (=> b!592346 m!569907))

(declare-fun m!569935 () Bool)

(assert (=> b!592346 m!569935))

(declare-fun m!569937 () Bool)

(assert (=> b!592346 m!569937))

(assert (=> b!592346 m!569907))

(declare-fun m!569939 () Bool)

(assert (=> b!592346 m!569939))

(declare-fun m!569941 () Bool)

(assert (=> bm!32809 m!569941))

(assert (=> b!592107 d!86051))

(declare-fun b!592357 () Bool)

(declare-fun e!338272 () Bool)

(declare-fun e!338269 () Bool)

(assert (=> b!592357 (= e!338272 e!338269)))

(declare-fun c!66924 () Bool)

(assert (=> b!592357 (= c!66924 (validKeyInArray!0 (select (arr!17726 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86059 () Bool)

(declare-fun res!379245 () Bool)

(declare-fun e!338271 () Bool)

(assert (=> d!86059 (=> res!379245 e!338271)))

(assert (=> d!86059 (= res!379245 (bvsge #b00000000000000000000000000000000 (size!18091 a!2986)))))

(assert (=> d!86059 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11803) e!338271)))

(declare-fun b!592358 () Bool)

(declare-fun call!32815 () Bool)

(assert (=> b!592358 (= e!338269 call!32815)))

(declare-fun b!592359 () Bool)

(assert (=> b!592359 (= e!338269 call!32815)))

(declare-fun b!592360 () Bool)

(assert (=> b!592360 (= e!338271 e!338272)))

(declare-fun res!379244 () Bool)

(assert (=> b!592360 (=> (not res!379244) (not e!338272))))

(declare-fun e!338270 () Bool)

(assert (=> b!592360 (= res!379244 (not e!338270))))

(declare-fun res!379243 () Bool)

(assert (=> b!592360 (=> (not res!379243) (not e!338270))))

(assert (=> b!592360 (= res!379243 (validKeyInArray!0 (select (arr!17726 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!592361 () Bool)

(declare-fun contains!2895 (List!11806 (_ BitVec 64)) Bool)

(assert (=> b!592361 (= e!338270 (contains!2895 Nil!11803 (select (arr!17726 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32812 () Bool)

(assert (=> bm!32812 (= call!32815 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66924 (Cons!11802 (select (arr!17726 a!2986) #b00000000000000000000000000000000) Nil!11803) Nil!11803)))))

(assert (= (and d!86059 (not res!379245)) b!592360))

(assert (= (and b!592360 res!379243) b!592361))

(assert (= (and b!592360 res!379244) b!592357))

(assert (= (and b!592357 c!66924) b!592359))

(assert (= (and b!592357 (not c!66924)) b!592358))

(assert (= (or b!592359 b!592358) bm!32812))

(assert (=> b!592357 m!569907))

(assert (=> b!592357 m!569907))

(assert (=> b!592357 m!569931))

(assert (=> b!592360 m!569907))

(assert (=> b!592360 m!569907))

(assert (=> b!592360 m!569931))

(assert (=> b!592361 m!569907))

(assert (=> b!592361 m!569907))

(declare-fun m!569943 () Bool)

(assert (=> b!592361 m!569943))

(assert (=> bm!32812 m!569907))

(declare-fun m!569945 () Bool)

(assert (=> bm!32812 m!569945))

(assert (=> b!592110 d!86059))

(declare-fun b!592362 () Bool)

(declare-fun e!338275 () SeekEntryResult!6163)

(assert (=> b!592362 (= e!338275 (MissingVacant!6163 vacantSpotIndex!68))))

(declare-fun b!592363 () Bool)

(assert (=> b!592363 (= e!338275 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!268782 () SeekEntryResult!6163)

(declare-fun d!86061 () Bool)

(assert (=> d!86061 (and (or ((_ is Undefined!6163) lt!268782) (not ((_ is Found!6163) lt!268782)) (and (bvsge (index!26889 lt!268782) #b00000000000000000000000000000000) (bvslt (index!26889 lt!268782) (size!18091 a!2986)))) (or ((_ is Undefined!6163) lt!268782) ((_ is Found!6163) lt!268782) (not ((_ is MissingVacant!6163) lt!268782)) (not (= (index!26891 lt!268782) vacantSpotIndex!68)) (and (bvsge (index!26891 lt!268782) #b00000000000000000000000000000000) (bvslt (index!26891 lt!268782) (size!18091 a!2986)))) (or ((_ is Undefined!6163) lt!268782) (ite ((_ is Found!6163) lt!268782) (= (select (arr!17726 a!2986) (index!26889 lt!268782)) (select (arr!17726 a!2986) j!136)) (and ((_ is MissingVacant!6163) lt!268782) (= (index!26891 lt!268782) vacantSpotIndex!68) (= (select (arr!17726 a!2986) (index!26891 lt!268782)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338274 () SeekEntryResult!6163)

(assert (=> d!86061 (= lt!268782 e!338274)))

(declare-fun c!66926 () Bool)

(assert (=> d!86061 (= c!66926 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!268783 () (_ BitVec 64))

(assert (=> d!86061 (= lt!268783 (select (arr!17726 a!2986) index!984))))

(assert (=> d!86061 (validMask!0 mask!3053)))

(assert (=> d!86061 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053) lt!268782)))

(declare-fun b!592364 () Bool)

(declare-fun e!338273 () SeekEntryResult!6163)

(assert (=> b!592364 (= e!338273 (Found!6163 index!984))))

(declare-fun b!592365 () Bool)

(assert (=> b!592365 (= e!338274 e!338273)))

(declare-fun c!66925 () Bool)

(assert (=> b!592365 (= c!66925 (= lt!268783 (select (arr!17726 a!2986) j!136)))))

(declare-fun b!592366 () Bool)

(declare-fun c!66927 () Bool)

(assert (=> b!592366 (= c!66927 (= lt!268783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592366 (= e!338273 e!338275)))

(declare-fun b!592367 () Bool)

(assert (=> b!592367 (= e!338274 Undefined!6163)))

(assert (= (and d!86061 c!66926) b!592367))

(assert (= (and d!86061 (not c!66926)) b!592365))

(assert (= (and b!592365 c!66925) b!592364))

(assert (= (and b!592365 (not c!66925)) b!592366))

(assert (= (and b!592366 c!66927) b!592362))

(assert (= (and b!592366 (not c!66927)) b!592363))

(assert (=> b!592363 m!569717))

(assert (=> b!592363 m!569717))

(assert (=> b!592363 m!569701))

(declare-fun m!569947 () Bool)

(assert (=> b!592363 m!569947))

(declare-fun m!569949 () Bool)

(assert (=> d!86061 m!569949))

(declare-fun m!569951 () Bool)

(assert (=> d!86061 m!569951))

(assert (=> d!86061 m!569735))

(assert (=> d!86061 m!569741))

(assert (=> b!592099 d!86061))

(declare-fun d!86063 () Bool)

(declare-fun res!379246 () Bool)

(declare-fun e!338276 () Bool)

(assert (=> d!86063 (=> res!379246 e!338276)))

(assert (=> d!86063 (= res!379246 (= (select (arr!17726 lt!268665) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17726 a!2986) j!136)))))

(assert (=> d!86063 (= (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!338276)))

(declare-fun b!592368 () Bool)

(declare-fun e!338277 () Bool)

(assert (=> b!592368 (= e!338276 e!338277)))

(declare-fun res!379247 () Bool)

(assert (=> b!592368 (=> (not res!379247) (not e!338277))))

(assert (=> b!592368 (= res!379247 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18091 lt!268665)))))

(declare-fun b!592369 () Bool)

(assert (=> b!592369 (= e!338277 (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86063 (not res!379246)) b!592368))

(assert (= (and b!592368 res!379247) b!592369))

(declare-fun m!569953 () Bool)

(assert (=> d!86063 m!569953))

(assert (=> b!592369 m!569701))

(declare-fun m!569955 () Bool)

(assert (=> b!592369 m!569955))

(assert (=> b!592109 d!86063))

(declare-fun d!86065 () Bool)

(assert (=> d!86065 (arrayContainsKey!0 lt!268665 (select (arr!17726 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268788 () Unit!18564)

(declare-fun choose!114 (array!36912 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18564)

(assert (=> d!86065 (= lt!268788 (choose!114 lt!268665 (select (arr!17726 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86065 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86065 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268665 (select (arr!17726 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!268788)))

(declare-fun bs!18261 () Bool)

(assert (= bs!18261 d!86065))

(assert (=> bs!18261 m!569701))

(assert (=> bs!18261 m!569747))

(assert (=> bs!18261 m!569701))

(declare-fun m!569957 () Bool)

(assert (=> bs!18261 m!569957))

(assert (=> b!592109 d!86065))

(check-sat (not b!592357) (not d!86021) (not d!86019) (not b!592369) (not bm!32809) (not b!592346) (not d!86017) (not b!592251) (not b!592361) (not b!592306) (not d!86065) (not d!86023) (not d!86061) (not b!592360) (not d!86015) (not b!592308) (not b!592345) (not b!592304) (not b!592288) (not d!86025) (not b!592257) (not bm!32812) (not b!592363) (not b!592264) (not b!592245))
(check-sat)
