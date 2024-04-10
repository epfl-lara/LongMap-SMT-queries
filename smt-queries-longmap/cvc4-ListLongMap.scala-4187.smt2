; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57102 () Bool)

(assert start!57102)

(declare-fun res!408773 () Bool)

(declare-fun e!361407 () Bool)

(assert (=> start!57102 (=> (not res!408773) (not e!361407))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57102 (= res!408773 (validMask!0 mask!3053))))

(assert (=> start!57102 e!361407))

(assert (=> start!57102 true))

(declare-datatypes ((array!38121 0))(
  ( (array!38122 (arr!18293 (Array (_ BitVec 32) (_ BitVec 64))) (size!18657 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38121)

(declare-fun array_inv!14089 (array!38121) Bool)

(assert (=> start!57102 (array_inv!14089 a!2986)))

(declare-fun b!632127 () Bool)

(declare-fun res!408772 () Bool)

(declare-fun e!361406 () Bool)

(assert (=> b!632127 (=> (not res!408772) (not e!361406))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632127 (= res!408772 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18293 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632128 () Bool)

(declare-datatypes ((Unit!21266 0))(
  ( (Unit!21267) )
))
(declare-fun e!361410 () Unit!21266)

(declare-fun Unit!21268 () Unit!21266)

(assert (=> b!632128 (= e!361410 Unit!21268)))

(assert (=> b!632128 false))

(declare-fun b!632129 () Bool)

(declare-fun Unit!21269 () Unit!21266)

(assert (=> b!632129 (= e!361410 Unit!21269)))

(declare-fun b!632130 () Bool)

(declare-fun res!408767 () Bool)

(assert (=> b!632130 (=> (not res!408767) (not e!361406))))

(declare-datatypes ((List!12334 0))(
  ( (Nil!12331) (Cons!12330 (h!13375 (_ BitVec 64)) (t!18562 List!12334)) )
))
(declare-fun arrayNoDuplicates!0 (array!38121 (_ BitVec 32) List!12334) Bool)

(assert (=> b!632130 (= res!408767 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12331))))

(declare-fun b!632131 () Bool)

(declare-fun res!408776 () Bool)

(assert (=> b!632131 (=> (not res!408776) (not e!361407))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632131 (= res!408776 (and (= (size!18657 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18657 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18657 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632132 () Bool)

(assert (=> b!632132 (= e!361407 e!361406)))

(declare-fun res!408777 () Bool)

(assert (=> b!632132 (=> (not res!408777) (not e!361406))))

(declare-datatypes ((SeekEntryResult!6733 0))(
  ( (MissingZero!6733 (index!29225 (_ BitVec 32))) (Found!6733 (index!29226 (_ BitVec 32))) (Intermediate!6733 (undefined!7545 Bool) (index!29227 (_ BitVec 32)) (x!57960 (_ BitVec 32))) (Undefined!6733) (MissingVacant!6733 (index!29228 (_ BitVec 32))) )
))
(declare-fun lt!292104 () SeekEntryResult!6733)

(assert (=> b!632132 (= res!408777 (or (= lt!292104 (MissingZero!6733 i!1108)) (= lt!292104 (MissingVacant!6733 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38121 (_ BitVec 32)) SeekEntryResult!6733)

(assert (=> b!632132 (= lt!292104 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632133 () Bool)

(declare-fun e!361409 () Bool)

(assert (=> b!632133 (= e!361406 e!361409)))

(declare-fun res!408768 () Bool)

(assert (=> b!632133 (=> (not res!408768) (not e!361409))))

(assert (=> b!632133 (= res!408768 (= (select (store (arr!18293 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292105 () array!38121)

(assert (=> b!632133 (= lt!292105 (array!38122 (store (arr!18293 a!2986) i!1108 k!1786) (size!18657 a!2986)))))

(declare-fun b!632134 () Bool)

(declare-fun res!408779 () Bool)

(assert (=> b!632134 (=> (not res!408779) (not e!361407))))

(declare-fun arrayContainsKey!0 (array!38121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632134 (= res!408779 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632135 () Bool)

(declare-fun e!361408 () Bool)

(assert (=> b!632135 (= e!361409 e!361408)))

(declare-fun res!408774 () Bool)

(assert (=> b!632135 (=> (not res!408774) (not e!361408))))

(declare-fun lt!292108 () SeekEntryResult!6733)

(assert (=> b!632135 (= res!408774 (and (= lt!292108 (Found!6733 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18293 a!2986) index!984) (select (arr!18293 a!2986) j!136))) (not (= (select (arr!18293 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38121 (_ BitVec 32)) SeekEntryResult!6733)

(assert (=> b!632135 (= lt!292108 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18293 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632136 () Bool)

(declare-fun e!361404 () Bool)

(assert (=> b!632136 (= e!361404 true)))

(assert (=> b!632136 (= (select (store (arr!18293 a!2986) i!1108 k!1786) index!984) (select (arr!18293 a!2986) j!136))))

(declare-fun b!632137 () Bool)

(declare-fun res!408771 () Bool)

(assert (=> b!632137 (=> (not res!408771) (not e!361406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38121 (_ BitVec 32)) Bool)

(assert (=> b!632137 (= res!408771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632138 () Bool)

(declare-fun e!361403 () Bool)

(declare-fun lt!292107 () SeekEntryResult!6733)

(assert (=> b!632138 (= e!361403 (= lt!292108 lt!292107))))

(declare-fun b!632139 () Bool)

(declare-fun res!408778 () Bool)

(assert (=> b!632139 (=> (not res!408778) (not e!361407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632139 (= res!408778 (validKeyInArray!0 (select (arr!18293 a!2986) j!136)))))

(declare-fun b!632140 () Bool)

(declare-fun res!408775 () Bool)

(assert (=> b!632140 (=> (not res!408775) (not e!361407))))

(assert (=> b!632140 (= res!408775 (validKeyInArray!0 k!1786))))

(declare-fun b!632141 () Bool)

(assert (=> b!632141 (= e!361408 (not e!361404))))

(declare-fun res!408770 () Bool)

(assert (=> b!632141 (=> res!408770 e!361404)))

(declare-fun lt!292110 () SeekEntryResult!6733)

(assert (=> b!632141 (= res!408770 (not (= lt!292110 (Found!6733 index!984))))))

(declare-fun lt!292109 () Unit!21266)

(assert (=> b!632141 (= lt!292109 e!361410)))

(declare-fun c!72047 () Bool)

(assert (=> b!632141 (= c!72047 (= lt!292110 Undefined!6733))))

(declare-fun lt!292103 () (_ BitVec 64))

(assert (=> b!632141 (= lt!292110 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292103 lt!292105 mask!3053))))

(assert (=> b!632141 e!361403))

(declare-fun res!408769 () Bool)

(assert (=> b!632141 (=> (not res!408769) (not e!361403))))

(declare-fun lt!292111 () (_ BitVec 32))

(assert (=> b!632141 (= res!408769 (= lt!292107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292111 vacantSpotIndex!68 lt!292103 lt!292105 mask!3053)))))

(assert (=> b!632141 (= lt!292107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292111 vacantSpotIndex!68 (select (arr!18293 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632141 (= lt!292103 (select (store (arr!18293 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292106 () Unit!21266)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21266)

(assert (=> b!632141 (= lt!292106 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292111 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632141 (= lt!292111 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57102 res!408773) b!632131))

(assert (= (and b!632131 res!408776) b!632139))

(assert (= (and b!632139 res!408778) b!632140))

(assert (= (and b!632140 res!408775) b!632134))

(assert (= (and b!632134 res!408779) b!632132))

(assert (= (and b!632132 res!408777) b!632137))

(assert (= (and b!632137 res!408771) b!632130))

(assert (= (and b!632130 res!408767) b!632127))

(assert (= (and b!632127 res!408772) b!632133))

(assert (= (and b!632133 res!408768) b!632135))

(assert (= (and b!632135 res!408774) b!632141))

(assert (= (and b!632141 res!408769) b!632138))

(assert (= (and b!632141 c!72047) b!632128))

(assert (= (and b!632141 (not c!72047)) b!632129))

(assert (= (and b!632141 (not res!408770)) b!632136))

(declare-fun m!606975 () Bool)

(assert (=> b!632132 m!606975))

(declare-fun m!606977 () Bool)

(assert (=> b!632133 m!606977))

(declare-fun m!606979 () Bool)

(assert (=> b!632133 m!606979))

(declare-fun m!606981 () Bool)

(assert (=> b!632141 m!606981))

(declare-fun m!606983 () Bool)

(assert (=> b!632141 m!606983))

(declare-fun m!606985 () Bool)

(assert (=> b!632141 m!606985))

(declare-fun m!606987 () Bool)

(assert (=> b!632141 m!606987))

(assert (=> b!632141 m!606977))

(declare-fun m!606989 () Bool)

(assert (=> b!632141 m!606989))

(declare-fun m!606991 () Bool)

(assert (=> b!632141 m!606991))

(assert (=> b!632141 m!606985))

(declare-fun m!606993 () Bool)

(assert (=> b!632141 m!606993))

(declare-fun m!606995 () Bool)

(assert (=> b!632134 m!606995))

(declare-fun m!606997 () Bool)

(assert (=> b!632135 m!606997))

(assert (=> b!632135 m!606985))

(assert (=> b!632135 m!606985))

(declare-fun m!606999 () Bool)

(assert (=> b!632135 m!606999))

(assert (=> b!632139 m!606985))

(assert (=> b!632139 m!606985))

(declare-fun m!607001 () Bool)

(assert (=> b!632139 m!607001))

(assert (=> b!632136 m!606977))

(declare-fun m!607003 () Bool)

(assert (=> b!632136 m!607003))

(assert (=> b!632136 m!606985))

(declare-fun m!607005 () Bool)

(assert (=> start!57102 m!607005))

(declare-fun m!607007 () Bool)

(assert (=> start!57102 m!607007))

(declare-fun m!607009 () Bool)

(assert (=> b!632140 m!607009))

(declare-fun m!607011 () Bool)

(assert (=> b!632127 m!607011))

(declare-fun m!607013 () Bool)

(assert (=> b!632130 m!607013))

(declare-fun m!607015 () Bool)

(assert (=> b!632137 m!607015))

(push 1)

(assert (not b!632130))

(assert (not b!632141))

(assert (not b!632132))

(assert (not b!632135))

(assert (not b!632139))

(assert (not b!632137))

(assert (not start!57102))

(assert (not b!632134))

(assert (not b!632140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

