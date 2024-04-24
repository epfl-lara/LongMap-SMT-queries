; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54888 () Bool)

(assert start!54888)

(declare-fun b!599188 () Bool)

(declare-fun e!342556 () Bool)

(declare-fun e!342553 () Bool)

(assert (=> b!599188 (= e!342556 e!342553)))

(declare-fun res!384117 () Bool)

(assert (=> b!599188 (=> res!384117 e!342553)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!272310 () (_ BitVec 64))

(declare-fun lt!272315 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37068 0))(
  ( (array!37069 (arr!17791 (Array (_ BitVec 32) (_ BitVec 64))) (size!18155 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37068)

(assert (=> b!599188 (= res!384117 (or (not (= (select (arr!17791 a!2986) j!136) lt!272315)) (not (= (select (arr!17791 a!2986) j!136) lt!272310)) (bvsge j!136 index!984)))))

(declare-fun b!599189 () Bool)

(declare-fun res!384112 () Bool)

(declare-fun e!342558 () Bool)

(assert (=> b!599189 (=> (not res!384112) (not e!342558))))

(declare-datatypes ((List!11739 0))(
  ( (Nil!11736) (Cons!11735 (h!12783 (_ BitVec 64)) (t!17959 List!11739)) )
))
(declare-fun arrayNoDuplicates!0 (array!37068 (_ BitVec 32) List!11739) Bool)

(assert (=> b!599189 (= res!384112 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11736))))

(declare-fun b!599190 () Bool)

(declare-fun e!342554 () Bool)

(declare-datatypes ((SeekEntryResult!6187 0))(
  ( (MissingZero!6187 (index!27005 (_ BitVec 32))) (Found!6187 (index!27006 (_ BitVec 32))) (Intermediate!6187 (undefined!6999 Bool) (index!27007 (_ BitVec 32)) (x!55965 (_ BitVec 32))) (Undefined!6187) (MissingVacant!6187 (index!27008 (_ BitVec 32))) )
))
(declare-fun lt!272306 () SeekEntryResult!6187)

(declare-fun lt!272314 () SeekEntryResult!6187)

(assert (=> b!599190 (= e!342554 (= lt!272306 lt!272314))))

(declare-fun e!342548 () Bool)

(declare-fun lt!272309 () array!37068)

(declare-fun b!599191 () Bool)

(declare-fun arrayContainsKey!0 (array!37068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599191 (= e!342548 (arrayContainsKey!0 lt!272309 (select (arr!17791 a!2986) j!136) index!984))))

(declare-fun b!599192 () Bool)

(declare-fun e!342555 () Bool)

(assert (=> b!599192 (= e!342558 e!342555)))

(declare-fun res!384119 () Bool)

(assert (=> b!599192 (=> (not res!384119) (not e!342555))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!599192 (= res!384119 (= (select (store (arr!17791 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599192 (= lt!272309 (array!37069 (store (arr!17791 a!2986) i!1108 k0!1786) (size!18155 a!2986)))))

(declare-fun res!384121 () Bool)

(declare-fun e!342551 () Bool)

(assert (=> start!54888 (=> (not res!384121) (not e!342551))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54888 (= res!384121 (validMask!0 mask!3053))))

(assert (=> start!54888 e!342551))

(assert (=> start!54888 true))

(declare-fun array_inv!13650 (array!37068) Bool)

(assert (=> start!54888 (array_inv!13650 a!2986)))

(declare-fun b!599193 () Bool)

(declare-fun e!342547 () Bool)

(assert (=> b!599193 (= e!342555 e!342547)))

(declare-fun res!384118 () Bool)

(assert (=> b!599193 (=> (not res!384118) (not e!342547))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599193 (= res!384118 (and (= lt!272306 (Found!6187 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17791 a!2986) index!984) (select (arr!17791 a!2986) j!136))) (not (= (select (arr!17791 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37068 (_ BitVec 32)) SeekEntryResult!6187)

(assert (=> b!599193 (= lt!272306 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17791 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599194 () Bool)

(declare-datatypes ((Unit!18841 0))(
  ( (Unit!18842) )
))
(declare-fun e!342549 () Unit!18841)

(declare-fun Unit!18843 () Unit!18841)

(assert (=> b!599194 (= e!342549 Unit!18843)))

(declare-fun b!599195 () Bool)

(declare-fun res!384111 () Bool)

(assert (=> b!599195 (=> (not res!384111) (not e!342551))))

(assert (=> b!599195 (= res!384111 (and (= (size!18155 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18155 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18155 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599196 () Bool)

(declare-fun res!384115 () Bool)

(assert (=> b!599196 (=> (not res!384115) (not e!342558))))

(assert (=> b!599196 (= res!384115 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17791 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599197 () Bool)

(declare-fun Unit!18844 () Unit!18841)

(assert (=> b!599197 (= e!342549 Unit!18844)))

(assert (=> b!599197 false))

(declare-fun b!599198 () Bool)

(assert (=> b!599198 (= e!342551 e!342558)))

(declare-fun res!384108 () Bool)

(assert (=> b!599198 (=> (not res!384108) (not e!342558))))

(declare-fun lt!272317 () SeekEntryResult!6187)

(assert (=> b!599198 (= res!384108 (or (= lt!272317 (MissingZero!6187 i!1108)) (= lt!272317 (MissingVacant!6187 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37068 (_ BitVec 32)) SeekEntryResult!6187)

(assert (=> b!599198 (= lt!272317 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599199 () Bool)

(declare-fun e!342552 () Bool)

(declare-fun e!342557 () Bool)

(assert (=> b!599199 (= e!342552 e!342557)))

(declare-fun res!384113 () Bool)

(assert (=> b!599199 (=> res!384113 e!342557)))

(assert (=> b!599199 (= res!384113 (or (not (= (select (arr!17791 a!2986) j!136) lt!272315)) (not (= (select (arr!17791 a!2986) j!136) lt!272310)) (bvsge j!136 index!984)))))

(assert (=> b!599199 e!342556))

(declare-fun res!384110 () Bool)

(assert (=> b!599199 (=> (not res!384110) (not e!342556))))

(assert (=> b!599199 (= res!384110 (= lt!272310 (select (arr!17791 a!2986) j!136)))))

(assert (=> b!599199 (= lt!272310 (select (store (arr!17791 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599200 () Bool)

(assert (=> b!599200 (= e!342557 true)))

(assert (=> b!599200 (arrayNoDuplicates!0 lt!272309 #b00000000000000000000000000000000 Nil!11736)))

(declare-fun lt!272312 () Unit!18841)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37068 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11739) Unit!18841)

(assert (=> b!599200 (= lt!272312 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11736))))

(assert (=> b!599200 (arrayContainsKey!0 lt!272309 (select (arr!17791 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272316 () Unit!18841)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37068 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18841)

(assert (=> b!599200 (= lt!272316 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272309 (select (arr!17791 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599201 () Bool)

(declare-fun res!384109 () Bool)

(assert (=> b!599201 (=> (not res!384109) (not e!342551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599201 (= res!384109 (validKeyInArray!0 (select (arr!17791 a!2986) j!136)))))

(declare-fun b!599202 () Bool)

(assert (=> b!599202 (= e!342553 e!342548)))

(declare-fun res!384105 () Bool)

(assert (=> b!599202 (=> (not res!384105) (not e!342548))))

(assert (=> b!599202 (= res!384105 (arrayContainsKey!0 lt!272309 (select (arr!17791 a!2986) j!136) j!136))))

(declare-fun b!599203 () Bool)

(assert (=> b!599203 (= e!342547 (not e!342552))))

(declare-fun res!384116 () Bool)

(assert (=> b!599203 (=> res!384116 e!342552)))

(declare-fun lt!272313 () SeekEntryResult!6187)

(assert (=> b!599203 (= res!384116 (not (= lt!272313 (Found!6187 index!984))))))

(declare-fun lt!272311 () Unit!18841)

(assert (=> b!599203 (= lt!272311 e!342549)))

(declare-fun c!67910 () Bool)

(assert (=> b!599203 (= c!67910 (= lt!272313 Undefined!6187))))

(assert (=> b!599203 (= lt!272313 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272315 lt!272309 mask!3053))))

(assert (=> b!599203 e!342554))

(declare-fun res!384107 () Bool)

(assert (=> b!599203 (=> (not res!384107) (not e!342554))))

(declare-fun lt!272308 () (_ BitVec 32))

(assert (=> b!599203 (= res!384107 (= lt!272314 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272308 vacantSpotIndex!68 lt!272315 lt!272309 mask!3053)))))

(assert (=> b!599203 (= lt!272314 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272308 vacantSpotIndex!68 (select (arr!17791 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599203 (= lt!272315 (select (store (arr!17791 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272307 () Unit!18841)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18841)

(assert (=> b!599203 (= lt!272307 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272308 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599203 (= lt!272308 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!599204 () Bool)

(declare-fun res!384114 () Bool)

(assert (=> b!599204 (=> (not res!384114) (not e!342551))))

(assert (=> b!599204 (= res!384114 (validKeyInArray!0 k0!1786))))

(declare-fun b!599205 () Bool)

(declare-fun res!384120 () Bool)

(assert (=> b!599205 (=> (not res!384120) (not e!342558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37068 (_ BitVec 32)) Bool)

(assert (=> b!599205 (= res!384120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599206 () Bool)

(declare-fun res!384106 () Bool)

(assert (=> b!599206 (=> (not res!384106) (not e!342551))))

(assert (=> b!599206 (= res!384106 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54888 res!384121) b!599195))

(assert (= (and b!599195 res!384111) b!599201))

(assert (= (and b!599201 res!384109) b!599204))

(assert (= (and b!599204 res!384114) b!599206))

(assert (= (and b!599206 res!384106) b!599198))

(assert (= (and b!599198 res!384108) b!599205))

(assert (= (and b!599205 res!384120) b!599189))

(assert (= (and b!599189 res!384112) b!599196))

(assert (= (and b!599196 res!384115) b!599192))

(assert (= (and b!599192 res!384119) b!599193))

(assert (= (and b!599193 res!384118) b!599203))

(assert (= (and b!599203 res!384107) b!599190))

(assert (= (and b!599203 c!67910) b!599197))

(assert (= (and b!599203 (not c!67910)) b!599194))

(assert (= (and b!599203 (not res!384116)) b!599199))

(assert (= (and b!599199 res!384110) b!599188))

(assert (= (and b!599188 (not res!384117)) b!599202))

(assert (= (and b!599202 res!384105) b!599191))

(assert (= (and b!599199 (not res!384113)) b!599200))

(declare-fun m!576689 () Bool)

(assert (=> b!599199 m!576689))

(declare-fun m!576691 () Bool)

(assert (=> b!599199 m!576691))

(declare-fun m!576693 () Bool)

(assert (=> b!599199 m!576693))

(declare-fun m!576695 () Bool)

(assert (=> b!599206 m!576695))

(declare-fun m!576697 () Bool)

(assert (=> b!599189 m!576697))

(assert (=> b!599191 m!576689))

(assert (=> b!599191 m!576689))

(declare-fun m!576699 () Bool)

(assert (=> b!599191 m!576699))

(declare-fun m!576701 () Bool)

(assert (=> b!599205 m!576701))

(declare-fun m!576703 () Bool)

(assert (=> start!54888 m!576703))

(declare-fun m!576705 () Bool)

(assert (=> start!54888 m!576705))

(assert (=> b!599201 m!576689))

(assert (=> b!599201 m!576689))

(declare-fun m!576707 () Bool)

(assert (=> b!599201 m!576707))

(declare-fun m!576709 () Bool)

(assert (=> b!599198 m!576709))

(declare-fun m!576711 () Bool)

(assert (=> b!599204 m!576711))

(assert (=> b!599192 m!576691))

(declare-fun m!576713 () Bool)

(assert (=> b!599192 m!576713))

(declare-fun m!576715 () Bool)

(assert (=> b!599203 m!576715))

(declare-fun m!576717 () Bool)

(assert (=> b!599203 m!576717))

(declare-fun m!576719 () Bool)

(assert (=> b!599203 m!576719))

(assert (=> b!599203 m!576689))

(assert (=> b!599203 m!576691))

(assert (=> b!599203 m!576689))

(declare-fun m!576721 () Bool)

(assert (=> b!599203 m!576721))

(declare-fun m!576723 () Bool)

(assert (=> b!599203 m!576723))

(declare-fun m!576725 () Bool)

(assert (=> b!599203 m!576725))

(declare-fun m!576727 () Bool)

(assert (=> b!599196 m!576727))

(assert (=> b!599202 m!576689))

(assert (=> b!599202 m!576689))

(declare-fun m!576729 () Bool)

(assert (=> b!599202 m!576729))

(declare-fun m!576731 () Bool)

(assert (=> b!599193 m!576731))

(assert (=> b!599193 m!576689))

(assert (=> b!599193 m!576689))

(declare-fun m!576733 () Bool)

(assert (=> b!599193 m!576733))

(assert (=> b!599188 m!576689))

(assert (=> b!599200 m!576689))

(assert (=> b!599200 m!576689))

(declare-fun m!576735 () Bool)

(assert (=> b!599200 m!576735))

(assert (=> b!599200 m!576689))

(declare-fun m!576737 () Bool)

(assert (=> b!599200 m!576737))

(declare-fun m!576739 () Bool)

(assert (=> b!599200 m!576739))

(declare-fun m!576741 () Bool)

(assert (=> b!599200 m!576741))

(check-sat (not b!599198) (not b!599191) (not start!54888) (not b!599203) (not b!599204) (not b!599200) (not b!599201) (not b!599193) (not b!599206) (not b!599202) (not b!599205) (not b!599189))
(check-sat)
