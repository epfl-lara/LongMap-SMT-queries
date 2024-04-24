; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56808 () Bool)

(assert start!56808)

(declare-fun b!629153 () Bool)

(declare-fun res!406612 () Bool)

(declare-fun e!359877 () Bool)

(assert (=> b!629153 (=> (not res!406612) (not e!359877))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629153 (= res!406612 (validKeyInArray!0 k0!1786))))

(declare-fun b!629154 () Bool)

(declare-fun res!406607 () Bool)

(declare-fun e!359879 () Bool)

(assert (=> b!629154 (=> (not res!406607) (not e!359879))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37992 0))(
  ( (array!37993 (arr!18232 (Array (_ BitVec 32) (_ BitVec 64))) (size!18596 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37992)

(assert (=> b!629154 (= res!406607 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18232 a!2986) index!984) (select (arr!18232 a!2986) j!136))) (not (= (select (arr!18232 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629155 () Bool)

(declare-fun e!359876 () Bool)

(assert (=> b!629155 (= e!359876 e!359879)))

(declare-fun res!406613 () Bool)

(assert (=> b!629155 (=> (not res!406613) (not e!359879))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6628 0))(
  ( (MissingZero!6628 (index!28796 (_ BitVec 32))) (Found!6628 (index!28797 (_ BitVec 32))) (Intermediate!6628 (undefined!7440 Bool) (index!28798 (_ BitVec 32)) (x!57681 (_ BitVec 32))) (Undefined!6628) (MissingVacant!6628 (index!28799 (_ BitVec 32))) )
))
(declare-fun lt!290699 () SeekEntryResult!6628)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37992 (_ BitVec 32)) SeekEntryResult!6628)

(assert (=> b!629155 (= res!406613 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18232 a!2986) j!136) a!2986 mask!3053) lt!290699))))

(assert (=> b!629155 (= lt!290699 (Found!6628 j!136))))

(declare-fun b!629156 () Bool)

(declare-fun res!406606 () Bool)

(assert (=> b!629156 (=> (not res!406606) (not e!359876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37992 (_ BitVec 32)) Bool)

(assert (=> b!629156 (= res!406606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629157 () Bool)

(declare-fun e!359880 () Bool)

(assert (=> b!629157 (= e!359879 e!359880)))

(declare-fun res!406605 () Bool)

(assert (=> b!629157 (=> (not res!406605) (not e!359880))))

(declare-fun lt!290700 () (_ BitVec 32))

(assert (=> b!629157 (= res!406605 (and (bvsge lt!290700 #b00000000000000000000000000000000) (bvslt lt!290700 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629157 (= lt!290700 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!629158 () Bool)

(declare-fun res!406611 () Bool)

(assert (=> b!629158 (=> (not res!406611) (not e!359877))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629158 (= res!406611 (and (= (size!18596 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18596 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18596 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629159 () Bool)

(assert (=> b!629159 (= e!359877 e!359876)))

(declare-fun res!406610 () Bool)

(assert (=> b!629159 (=> (not res!406610) (not e!359876))))

(declare-fun lt!290701 () SeekEntryResult!6628)

(assert (=> b!629159 (= res!406610 (or (= lt!290701 (MissingZero!6628 i!1108)) (= lt!290701 (MissingVacant!6628 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37992 (_ BitVec 32)) SeekEntryResult!6628)

(assert (=> b!629159 (= lt!290701 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629160 () Bool)

(assert (=> b!629160 (= e!359880 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290700 vacantSpotIndex!68 (select (arr!18232 a!2986) j!136) a!2986 mask!3053) lt!290699)))))

(declare-fun b!629161 () Bool)

(declare-fun res!406604 () Bool)

(assert (=> b!629161 (=> (not res!406604) (not e!359877))))

(declare-fun arrayContainsKey!0 (array!37992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629161 (= res!406604 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!406609 () Bool)

(assert (=> start!56808 (=> (not res!406609) (not e!359877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56808 (= res!406609 (validMask!0 mask!3053))))

(assert (=> start!56808 e!359877))

(assert (=> start!56808 true))

(declare-fun array_inv!14091 (array!37992) Bool)

(assert (=> start!56808 (array_inv!14091 a!2986)))

(declare-fun b!629162 () Bool)

(declare-fun res!406608 () Bool)

(assert (=> b!629162 (=> (not res!406608) (not e!359876))))

(assert (=> b!629162 (= res!406608 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18232 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18232 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629163 () Bool)

(declare-fun res!406614 () Bool)

(assert (=> b!629163 (=> (not res!406614) (not e!359876))))

(declare-datatypes ((List!12180 0))(
  ( (Nil!12177) (Cons!12176 (h!13224 (_ BitVec 64)) (t!18400 List!12180)) )
))
(declare-fun arrayNoDuplicates!0 (array!37992 (_ BitVec 32) List!12180) Bool)

(assert (=> b!629163 (= res!406614 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12177))))

(declare-fun b!629164 () Bool)

(declare-fun res!406615 () Bool)

(assert (=> b!629164 (=> (not res!406615) (not e!359877))))

(assert (=> b!629164 (= res!406615 (validKeyInArray!0 (select (arr!18232 a!2986) j!136)))))

(assert (= (and start!56808 res!406609) b!629158))

(assert (= (and b!629158 res!406611) b!629164))

(assert (= (and b!629164 res!406615) b!629153))

(assert (= (and b!629153 res!406612) b!629161))

(assert (= (and b!629161 res!406604) b!629159))

(assert (= (and b!629159 res!406610) b!629156))

(assert (= (and b!629156 res!406606) b!629163))

(assert (= (and b!629163 res!406614) b!629162))

(assert (= (and b!629162 res!406608) b!629155))

(assert (= (and b!629155 res!406613) b!629154))

(assert (= (and b!629154 res!406607) b!629157))

(assert (= (and b!629157 res!406605) b!629160))

(declare-fun m!604543 () Bool)

(assert (=> b!629162 m!604543))

(declare-fun m!604545 () Bool)

(assert (=> b!629162 m!604545))

(declare-fun m!604547 () Bool)

(assert (=> b!629162 m!604547))

(declare-fun m!604549 () Bool)

(assert (=> b!629164 m!604549))

(assert (=> b!629164 m!604549))

(declare-fun m!604551 () Bool)

(assert (=> b!629164 m!604551))

(declare-fun m!604553 () Bool)

(assert (=> b!629153 m!604553))

(declare-fun m!604555 () Bool)

(assert (=> b!629154 m!604555))

(assert (=> b!629154 m!604549))

(declare-fun m!604557 () Bool)

(assert (=> b!629156 m!604557))

(declare-fun m!604559 () Bool)

(assert (=> b!629163 m!604559))

(assert (=> b!629160 m!604549))

(assert (=> b!629160 m!604549))

(declare-fun m!604561 () Bool)

(assert (=> b!629160 m!604561))

(declare-fun m!604563 () Bool)

(assert (=> b!629157 m!604563))

(assert (=> b!629155 m!604549))

(assert (=> b!629155 m!604549))

(declare-fun m!604565 () Bool)

(assert (=> b!629155 m!604565))

(declare-fun m!604567 () Bool)

(assert (=> b!629161 m!604567))

(declare-fun m!604569 () Bool)

(assert (=> start!56808 m!604569))

(declare-fun m!604571 () Bool)

(assert (=> start!56808 m!604571))

(declare-fun m!604573 () Bool)

(assert (=> b!629159 m!604573))

(check-sat (not b!629156) (not b!629164) (not b!629157) (not b!629160) (not b!629155) (not b!629159) (not b!629163) (not b!629153) (not b!629161) (not start!56808))
(check-sat)
(get-model)

(declare-fun b!629250 () Bool)

(declare-fun e!359918 () SeekEntryResult!6628)

(declare-fun lt!290726 () SeekEntryResult!6628)

(assert (=> b!629250 (= e!359918 (MissingZero!6628 (index!28798 lt!290726)))))

(declare-fun b!629251 () Bool)

(declare-fun e!359917 () SeekEntryResult!6628)

(declare-fun e!359919 () SeekEntryResult!6628)

(assert (=> b!629251 (= e!359917 e!359919)))

(declare-fun lt!290728 () (_ BitVec 64))

(assert (=> b!629251 (= lt!290728 (select (arr!18232 a!2986) (index!28798 lt!290726)))))

(declare-fun c!71650 () Bool)

(assert (=> b!629251 (= c!71650 (= lt!290728 k0!1786))))

(declare-fun b!629252 () Bool)

(declare-fun c!71649 () Bool)

(assert (=> b!629252 (= c!71649 (= lt!290728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629252 (= e!359919 e!359918)))

(declare-fun b!629253 () Bool)

(assert (=> b!629253 (= e!359917 Undefined!6628)))

(declare-fun b!629254 () Bool)

(assert (=> b!629254 (= e!359919 (Found!6628 (index!28798 lt!290726)))))

(declare-fun b!629249 () Bool)

(assert (=> b!629249 (= e!359918 (seekKeyOrZeroReturnVacant!0 (x!57681 lt!290726) (index!28798 lt!290726) (index!28798 lt!290726) k0!1786 a!2986 mask!3053))))

(declare-fun d!89173 () Bool)

(declare-fun lt!290727 () SeekEntryResult!6628)

(get-info :version)

(assert (=> d!89173 (and (or ((_ is Undefined!6628) lt!290727) (not ((_ is Found!6628) lt!290727)) (and (bvsge (index!28797 lt!290727) #b00000000000000000000000000000000) (bvslt (index!28797 lt!290727) (size!18596 a!2986)))) (or ((_ is Undefined!6628) lt!290727) ((_ is Found!6628) lt!290727) (not ((_ is MissingZero!6628) lt!290727)) (and (bvsge (index!28796 lt!290727) #b00000000000000000000000000000000) (bvslt (index!28796 lt!290727) (size!18596 a!2986)))) (or ((_ is Undefined!6628) lt!290727) ((_ is Found!6628) lt!290727) ((_ is MissingZero!6628) lt!290727) (not ((_ is MissingVacant!6628) lt!290727)) (and (bvsge (index!28799 lt!290727) #b00000000000000000000000000000000) (bvslt (index!28799 lt!290727) (size!18596 a!2986)))) (or ((_ is Undefined!6628) lt!290727) (ite ((_ is Found!6628) lt!290727) (= (select (arr!18232 a!2986) (index!28797 lt!290727)) k0!1786) (ite ((_ is MissingZero!6628) lt!290727) (= (select (arr!18232 a!2986) (index!28796 lt!290727)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6628) lt!290727) (= (select (arr!18232 a!2986) (index!28799 lt!290727)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89173 (= lt!290727 e!359917)))

(declare-fun c!71651 () Bool)

(assert (=> d!89173 (= c!71651 (and ((_ is Intermediate!6628) lt!290726) (undefined!7440 lt!290726)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37992 (_ BitVec 32)) SeekEntryResult!6628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89173 (= lt!290726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89173 (validMask!0 mask!3053)))

(assert (=> d!89173 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290727)))

(assert (= (and d!89173 c!71651) b!629253))

(assert (= (and d!89173 (not c!71651)) b!629251))

(assert (= (and b!629251 c!71650) b!629254))

(assert (= (and b!629251 (not c!71650)) b!629252))

(assert (= (and b!629252 c!71649) b!629250))

(assert (= (and b!629252 (not c!71649)) b!629249))

(declare-fun m!604639 () Bool)

(assert (=> b!629251 m!604639))

(declare-fun m!604641 () Bool)

(assert (=> b!629249 m!604641))

(assert (=> d!89173 m!604569))

(declare-fun m!604643 () Bool)

(assert (=> d!89173 m!604643))

(declare-fun m!604645 () Bool)

(assert (=> d!89173 m!604645))

(declare-fun m!604647 () Bool)

(assert (=> d!89173 m!604647))

(assert (=> d!89173 m!604643))

(declare-fun m!604649 () Bool)

(assert (=> d!89173 m!604649))

(declare-fun m!604651 () Bool)

(assert (=> d!89173 m!604651))

(assert (=> b!629159 d!89173))

(declare-fun d!89177 () Bool)

(assert (=> d!89177 (= (validKeyInArray!0 (select (arr!18232 a!2986) j!136)) (and (not (= (select (arr!18232 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18232 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629164 d!89177))

(declare-fun d!89181 () Bool)

(assert (=> d!89181 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56808 d!89181))

(declare-fun d!89187 () Bool)

(assert (=> d!89187 (= (array_inv!14091 a!2986) (bvsge (size!18596 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56808 d!89187))

(declare-fun lt!290754 () SeekEntryResult!6628)

(declare-fun d!89189 () Bool)

(assert (=> d!89189 (and (or ((_ is Undefined!6628) lt!290754) (not ((_ is Found!6628) lt!290754)) (and (bvsge (index!28797 lt!290754) #b00000000000000000000000000000000) (bvslt (index!28797 lt!290754) (size!18596 a!2986)))) (or ((_ is Undefined!6628) lt!290754) ((_ is Found!6628) lt!290754) (not ((_ is MissingVacant!6628) lt!290754)) (not (= (index!28799 lt!290754) vacantSpotIndex!68)) (and (bvsge (index!28799 lt!290754) #b00000000000000000000000000000000) (bvslt (index!28799 lt!290754) (size!18596 a!2986)))) (or ((_ is Undefined!6628) lt!290754) (ite ((_ is Found!6628) lt!290754) (= (select (arr!18232 a!2986) (index!28797 lt!290754)) (select (arr!18232 a!2986) j!136)) (and ((_ is MissingVacant!6628) lt!290754) (= (index!28799 lt!290754) vacantSpotIndex!68) (= (select (arr!18232 a!2986) (index!28799 lt!290754)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359965 () SeekEntryResult!6628)

(assert (=> d!89189 (= lt!290754 e!359965)))

(declare-fun c!71683 () Bool)

(assert (=> d!89189 (= c!71683 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290755 () (_ BitVec 64))

(assert (=> d!89189 (= lt!290755 (select (arr!18232 a!2986) index!984))))

(assert (=> d!89189 (validMask!0 mask!3053)))

(assert (=> d!89189 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18232 a!2986) j!136) a!2986 mask!3053) lt!290754)))

(declare-fun e!359967 () SeekEntryResult!6628)

(declare-fun b!629330 () Bool)

(assert (=> b!629330 (= e!359967 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18232 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629331 () Bool)

(declare-fun e!359966 () SeekEntryResult!6628)

(assert (=> b!629331 (= e!359965 e!359966)))

(declare-fun c!71684 () Bool)

(assert (=> b!629331 (= c!71684 (= lt!290755 (select (arr!18232 a!2986) j!136)))))

(declare-fun b!629332 () Bool)

(assert (=> b!629332 (= e!359965 Undefined!6628)))

(declare-fun b!629333 () Bool)

(declare-fun c!71682 () Bool)

(assert (=> b!629333 (= c!71682 (= lt!290755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629333 (= e!359966 e!359967)))

(declare-fun b!629334 () Bool)

(assert (=> b!629334 (= e!359966 (Found!6628 index!984))))

(declare-fun b!629335 () Bool)

(assert (=> b!629335 (= e!359967 (MissingVacant!6628 vacantSpotIndex!68))))

(assert (= (and d!89189 c!71683) b!629332))

(assert (= (and d!89189 (not c!71683)) b!629331))

(assert (= (and b!629331 c!71684) b!629334))

(assert (= (and b!629331 (not c!71684)) b!629333))

(assert (= (and b!629333 c!71682) b!629335))

(assert (= (and b!629333 (not c!71682)) b!629330))

(declare-fun m!604691 () Bool)

(assert (=> d!89189 m!604691))

(declare-fun m!604693 () Bool)

(assert (=> d!89189 m!604693))

(assert (=> d!89189 m!604555))

(assert (=> d!89189 m!604569))

(declare-fun m!604695 () Bool)

(assert (=> b!629330 m!604695))

(assert (=> b!629330 m!604695))

(assert (=> b!629330 m!604549))

(declare-fun m!604697 () Bool)

(assert (=> b!629330 m!604697))

(assert (=> b!629155 d!89189))

(declare-fun d!89197 () Bool)

(declare-fun lt!290756 () SeekEntryResult!6628)

(assert (=> d!89197 (and (or ((_ is Undefined!6628) lt!290756) (not ((_ is Found!6628) lt!290756)) (and (bvsge (index!28797 lt!290756) #b00000000000000000000000000000000) (bvslt (index!28797 lt!290756) (size!18596 a!2986)))) (or ((_ is Undefined!6628) lt!290756) ((_ is Found!6628) lt!290756) (not ((_ is MissingVacant!6628) lt!290756)) (not (= (index!28799 lt!290756) vacantSpotIndex!68)) (and (bvsge (index!28799 lt!290756) #b00000000000000000000000000000000) (bvslt (index!28799 lt!290756) (size!18596 a!2986)))) (or ((_ is Undefined!6628) lt!290756) (ite ((_ is Found!6628) lt!290756) (= (select (arr!18232 a!2986) (index!28797 lt!290756)) (select (arr!18232 a!2986) j!136)) (and ((_ is MissingVacant!6628) lt!290756) (= (index!28799 lt!290756) vacantSpotIndex!68) (= (select (arr!18232 a!2986) (index!28799 lt!290756)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359968 () SeekEntryResult!6628)

(assert (=> d!89197 (= lt!290756 e!359968)))

(declare-fun c!71686 () Bool)

(assert (=> d!89197 (= c!71686 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!290757 () (_ BitVec 64))

(assert (=> d!89197 (= lt!290757 (select (arr!18232 a!2986) lt!290700))))

(assert (=> d!89197 (validMask!0 mask!3053)))

(assert (=> d!89197 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290700 vacantSpotIndex!68 (select (arr!18232 a!2986) j!136) a!2986 mask!3053) lt!290756)))

(declare-fun b!629336 () Bool)

(declare-fun e!359970 () SeekEntryResult!6628)

(assert (=> b!629336 (= e!359970 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290700 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18232 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629337 () Bool)

(declare-fun e!359969 () SeekEntryResult!6628)

(assert (=> b!629337 (= e!359968 e!359969)))

(declare-fun c!71687 () Bool)

(assert (=> b!629337 (= c!71687 (= lt!290757 (select (arr!18232 a!2986) j!136)))))

(declare-fun b!629338 () Bool)

(assert (=> b!629338 (= e!359968 Undefined!6628)))

(declare-fun b!629339 () Bool)

(declare-fun c!71685 () Bool)

(assert (=> b!629339 (= c!71685 (= lt!290757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629339 (= e!359969 e!359970)))

(declare-fun b!629340 () Bool)

(assert (=> b!629340 (= e!359969 (Found!6628 lt!290700))))

(declare-fun b!629341 () Bool)

(assert (=> b!629341 (= e!359970 (MissingVacant!6628 vacantSpotIndex!68))))

(assert (= (and d!89197 c!71686) b!629338))

(assert (= (and d!89197 (not c!71686)) b!629337))

(assert (= (and b!629337 c!71687) b!629340))

(assert (= (and b!629337 (not c!71687)) b!629339))

(assert (= (and b!629339 c!71685) b!629341))

(assert (= (and b!629339 (not c!71685)) b!629336))

(declare-fun m!604699 () Bool)

(assert (=> d!89197 m!604699))

(declare-fun m!604701 () Bool)

(assert (=> d!89197 m!604701))

(declare-fun m!604703 () Bool)

(assert (=> d!89197 m!604703))

(assert (=> d!89197 m!604569))

(declare-fun m!604705 () Bool)

(assert (=> b!629336 m!604705))

(assert (=> b!629336 m!604705))

(assert (=> b!629336 m!604549))

(declare-fun m!604707 () Bool)

(assert (=> b!629336 m!604707))

(assert (=> b!629160 d!89197))

(declare-fun d!89199 () Bool)

(declare-fun res!406713 () Bool)

(declare-fun e!359983 () Bool)

(assert (=> d!89199 (=> res!406713 e!359983)))

(assert (=> d!89199 (= res!406713 (= (select (arr!18232 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89199 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!359983)))

(declare-fun b!629356 () Bool)

(declare-fun e!359984 () Bool)

(assert (=> b!629356 (= e!359983 e!359984)))

(declare-fun res!406714 () Bool)

(assert (=> b!629356 (=> (not res!406714) (not e!359984))))

(assert (=> b!629356 (= res!406714 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18596 a!2986)))))

(declare-fun b!629357 () Bool)

(assert (=> b!629357 (= e!359984 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89199 (not res!406713)) b!629356))

(assert (= (and b!629356 res!406714) b!629357))

(declare-fun m!604709 () Bool)

(assert (=> d!89199 m!604709))

(declare-fun m!604711 () Bool)

(assert (=> b!629357 m!604711))

(assert (=> b!629161 d!89199))

(declare-fun b!629389 () Bool)

(declare-fun e!360010 () Bool)

(declare-fun call!33288 () Bool)

(assert (=> b!629389 (= e!360010 call!33288)))

(declare-fun b!629390 () Bool)

(declare-fun e!360012 () Bool)

(declare-fun e!360011 () Bool)

(assert (=> b!629390 (= e!360012 e!360011)))

(declare-fun c!71696 () Bool)

(assert (=> b!629390 (= c!71696 (validKeyInArray!0 (select (arr!18232 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33285 () Bool)

(assert (=> bm!33285 (= call!33288 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!629392 () Bool)

(assert (=> b!629392 (= e!360011 e!360010)))

(declare-fun lt!290767 () (_ BitVec 64))

(assert (=> b!629392 (= lt!290767 (select (arr!18232 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21085 0))(
  ( (Unit!21086) )
))
(declare-fun lt!290768 () Unit!21085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37992 (_ BitVec 64) (_ BitVec 32)) Unit!21085)

(assert (=> b!629392 (= lt!290768 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290767 #b00000000000000000000000000000000))))

(assert (=> b!629392 (arrayContainsKey!0 a!2986 lt!290767 #b00000000000000000000000000000000)))

(declare-fun lt!290766 () Unit!21085)

(assert (=> b!629392 (= lt!290766 lt!290768)))

(declare-fun res!406735 () Bool)

(assert (=> b!629392 (= res!406735 (= (seekEntryOrOpen!0 (select (arr!18232 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6628 #b00000000000000000000000000000000)))))

(assert (=> b!629392 (=> (not res!406735) (not e!360010))))

(declare-fun b!629391 () Bool)

(assert (=> b!629391 (= e!360011 call!33288)))

(declare-fun d!89201 () Bool)

(declare-fun res!406734 () Bool)

(assert (=> d!89201 (=> res!406734 e!360012)))

(assert (=> d!89201 (= res!406734 (bvsge #b00000000000000000000000000000000 (size!18596 a!2986)))))

(assert (=> d!89201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!360012)))

(assert (= (and d!89201 (not res!406734)) b!629390))

(assert (= (and b!629390 c!71696) b!629392))

(assert (= (and b!629390 (not c!71696)) b!629391))

(assert (= (and b!629392 res!406735) b!629389))

(assert (= (or b!629389 b!629391) bm!33285))

(assert (=> b!629390 m!604709))

(assert (=> b!629390 m!604709))

(declare-fun m!604729 () Bool)

(assert (=> b!629390 m!604729))

(declare-fun m!604731 () Bool)

(assert (=> bm!33285 m!604731))

(assert (=> b!629392 m!604709))

(declare-fun m!604733 () Bool)

(assert (=> b!629392 m!604733))

(declare-fun m!604735 () Bool)

(assert (=> b!629392 m!604735))

(assert (=> b!629392 m!604709))

(declare-fun m!604737 () Bool)

(assert (=> b!629392 m!604737))

(assert (=> b!629156 d!89201))

(declare-fun d!89219 () Bool)

(declare-fun lt!290774 () (_ BitVec 32))

(assert (=> d!89219 (and (bvsge lt!290774 #b00000000000000000000000000000000) (bvslt lt!290774 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89219 (= lt!290774 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89219 (validMask!0 mask!3053)))

(assert (=> d!89219 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!290774)))

(declare-fun bs!18993 () Bool)

(assert (= bs!18993 d!89219))

(declare-fun m!604741 () Bool)

(assert (=> bs!18993 m!604741))

(assert (=> bs!18993 m!604569))

(assert (=> b!629157 d!89219))

(declare-fun b!629417 () Bool)

(declare-fun e!360030 () Bool)

(declare-fun e!360032 () Bool)

(assert (=> b!629417 (= e!360030 e!360032)))

(declare-fun c!71704 () Bool)

(assert (=> b!629417 (= c!71704 (validKeyInArray!0 (select (arr!18232 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33290 () Bool)

(declare-fun call!33293 () Bool)

(assert (=> bm!33290 (= call!33293 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71704 (Cons!12176 (select (arr!18232 a!2986) #b00000000000000000000000000000000) Nil!12177) Nil!12177)))))

(declare-fun d!89223 () Bool)

(declare-fun res!406748 () Bool)

(declare-fun e!360031 () Bool)

(assert (=> d!89223 (=> res!406748 e!360031)))

(assert (=> d!89223 (= res!406748 (bvsge #b00000000000000000000000000000000 (size!18596 a!2986)))))

(assert (=> d!89223 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12177) e!360031)))

(declare-fun b!629418 () Bool)

(assert (=> b!629418 (= e!360031 e!360030)))

(declare-fun res!406746 () Bool)

(assert (=> b!629418 (=> (not res!406746) (not e!360030))))

(declare-fun e!360033 () Bool)

(assert (=> b!629418 (= res!406746 (not e!360033))))

(declare-fun res!406747 () Bool)

(assert (=> b!629418 (=> (not res!406747) (not e!360033))))

(assert (=> b!629418 (= res!406747 (validKeyInArray!0 (select (arr!18232 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629419 () Bool)

(declare-fun contains!3059 (List!12180 (_ BitVec 64)) Bool)

(assert (=> b!629419 (= e!360033 (contains!3059 Nil!12177 (select (arr!18232 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629420 () Bool)

(assert (=> b!629420 (= e!360032 call!33293)))

(declare-fun b!629421 () Bool)

(assert (=> b!629421 (= e!360032 call!33293)))

(assert (= (and d!89223 (not res!406748)) b!629418))

(assert (= (and b!629418 res!406747) b!629419))

(assert (= (and b!629418 res!406746) b!629417))

(assert (= (and b!629417 c!71704) b!629420))

(assert (= (and b!629417 (not c!71704)) b!629421))

(assert (= (or b!629420 b!629421) bm!33290))

(assert (=> b!629417 m!604709))

(assert (=> b!629417 m!604709))

(assert (=> b!629417 m!604729))

(assert (=> bm!33290 m!604709))

(declare-fun m!604755 () Bool)

(assert (=> bm!33290 m!604755))

(assert (=> b!629418 m!604709))

(assert (=> b!629418 m!604709))

(assert (=> b!629418 m!604729))

(assert (=> b!629419 m!604709))

(assert (=> b!629419 m!604709))

(declare-fun m!604757 () Bool)

(assert (=> b!629419 m!604757))

(assert (=> b!629163 d!89223))

(declare-fun d!89233 () Bool)

(assert (=> d!89233 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629153 d!89233))

(check-sat (not b!629336) (not bm!33290) (not b!629330) (not b!629392) (not b!629357) (not d!89219) (not b!629419) (not b!629249) (not b!629390) (not b!629418) (not b!629417) (not bm!33285) (not d!89197) (not d!89189) (not d!89173))
(check-sat)
