; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58552 () Bool)

(assert start!58552)

(declare-fun b!646671 () Bool)

(declare-fun e!370714 () Bool)

(declare-fun e!370703 () Bool)

(assert (=> b!646671 (= e!370714 e!370703)))

(declare-fun res!419052 () Bool)

(assert (=> b!646671 (=> (not res!419052) (not e!370703))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38487 0))(
  ( (array!38488 (arr!18454 (Array (_ BitVec 32) (_ BitVec 64))) (size!18818 (_ BitVec 32))) )
))
(declare-fun lt!300076 () array!38487)

(declare-fun a!2986 () array!38487)

(declare-fun arrayContainsKey!0 (array!38487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646671 (= res!419052 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) j!136))))

(declare-fun b!646672 () Bool)

(declare-fun e!370704 () Bool)

(declare-fun e!370701 () Bool)

(assert (=> b!646672 (= e!370704 e!370701)))

(declare-fun res!419055 () Bool)

(assert (=> b!646672 (=> (not res!419055) (not e!370701))))

(declare-datatypes ((SeekEntryResult!6894 0))(
  ( (MissingZero!6894 (index!29914 (_ BitVec 32))) (Found!6894 (index!29915 (_ BitVec 32))) (Intermediate!6894 (undefined!7706 Bool) (index!29916 (_ BitVec 32)) (x!58688 (_ BitVec 32))) (Undefined!6894) (MissingVacant!6894 (index!29917 (_ BitVec 32))) )
))
(declare-fun lt!300079 () SeekEntryResult!6894)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!646672 (= res!419055 (or (= lt!300079 (MissingZero!6894 i!1108)) (= lt!300079 (MissingVacant!6894 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38487 (_ BitVec 32)) SeekEntryResult!6894)

(assert (=> b!646672 (= lt!300079 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!646673 () Bool)

(declare-fun e!370709 () Bool)

(declare-fun e!370706 () Bool)

(assert (=> b!646673 (= e!370709 e!370706)))

(declare-fun res!419049 () Bool)

(assert (=> b!646673 (=> res!419049 e!370706)))

(declare-fun lt!300067 () (_ BitVec 64))

(declare-fun lt!300071 () (_ BitVec 64))

(assert (=> b!646673 (= res!419049 (or (not (= (select (arr!18454 a!2986) j!136) lt!300071)) (not (= (select (arr!18454 a!2986) j!136) lt!300067))))))

(declare-fun e!370716 () Bool)

(assert (=> b!646673 e!370716))

(declare-fun res!419057 () Bool)

(assert (=> b!646673 (=> (not res!419057) (not e!370716))))

(assert (=> b!646673 (= res!419057 (= lt!300067 (select (arr!18454 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!646673 (= lt!300067 (select (store (arr!18454 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646674 () Bool)

(assert (=> b!646674 (= e!370703 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) index!984))))

(declare-fun b!646675 () Bool)

(declare-fun res!419054 () Bool)

(assert (=> b!646675 (=> (not res!419054) (not e!370704))))

(assert (=> b!646675 (= res!419054 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646676 () Bool)

(declare-fun res!419062 () Bool)

(assert (=> b!646676 (=> (not res!419062) (not e!370701))))

(declare-datatypes ((List!12495 0))(
  ( (Nil!12492) (Cons!12491 (h!13536 (_ BitVec 64)) (t!18723 List!12495)) )
))
(declare-fun arrayNoDuplicates!0 (array!38487 (_ BitVec 32) List!12495) Bool)

(assert (=> b!646676 (= res!419062 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12492))))

(declare-fun b!646677 () Bool)

(declare-datatypes ((Unit!21990 0))(
  ( (Unit!21991) )
))
(declare-fun e!370708 () Unit!21990)

(declare-fun Unit!21992 () Unit!21990)

(assert (=> b!646677 (= e!370708 Unit!21992)))

(assert (=> b!646677 false))

(declare-fun b!646678 () Bool)

(declare-fun e!370702 () Bool)

(declare-fun e!370713 () Bool)

(assert (=> b!646678 (= e!370702 e!370713)))

(declare-fun res!419060 () Bool)

(assert (=> b!646678 (=> (not res!419060) (not e!370713))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!300072 () SeekEntryResult!6894)

(assert (=> b!646678 (= res!419060 (and (= lt!300072 (Found!6894 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18454 a!2986) index!984) (select (arr!18454 a!2986) j!136))) (not (= (select (arr!18454 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38487 (_ BitVec 32)) SeekEntryResult!6894)

(assert (=> b!646678 (= lt!300072 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646679 () Bool)

(declare-fun e!370711 () Bool)

(declare-fun lt!300069 () SeekEntryResult!6894)

(assert (=> b!646679 (= e!370711 (= lt!300072 lt!300069))))

(declare-fun b!646680 () Bool)

(declare-fun e!370715 () Bool)

(declare-fun noDuplicate!412 (List!12495) Bool)

(assert (=> b!646680 (= e!370715 (noDuplicate!412 Nil!12492))))

(declare-fun res!419048 () Bool)

(assert (=> start!58552 (=> (not res!419048) (not e!370704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58552 (= res!419048 (validMask!0 mask!3053))))

(assert (=> start!58552 e!370704))

(assert (=> start!58552 true))

(declare-fun array_inv!14250 (array!38487) Bool)

(assert (=> start!58552 (array_inv!14250 a!2986)))

(declare-fun e!370712 () Bool)

(declare-fun b!646681 () Bool)

(assert (=> b!646681 (= e!370712 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) index!984))))

(declare-fun b!646682 () Bool)

(declare-fun e!370707 () Bool)

(assert (=> b!646682 (= e!370707 e!370715)))

(declare-fun res!419050 () Bool)

(assert (=> b!646682 (=> res!419050 e!370715)))

(assert (=> b!646682 (= res!419050 (or (bvsge (size!18818 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18818 a!2986))))))

(assert (=> b!646682 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300066 () Unit!21990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21990)

(assert (=> b!646682 (= lt!300066 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300076 (select (arr!18454 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!646682 e!370712))

(declare-fun res!419058 () Bool)

(assert (=> b!646682 (=> (not res!419058) (not e!370712))))

(assert (=> b!646682 (= res!419058 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) j!136))))

(declare-fun b!646683 () Bool)

(declare-fun Unit!21993 () Unit!21990)

(assert (=> b!646683 (= e!370708 Unit!21993)))

(declare-fun b!646684 () Bool)

(declare-fun e!370705 () Unit!21990)

(declare-fun Unit!21994 () Unit!21990)

(assert (=> b!646684 (= e!370705 Unit!21994)))

(declare-fun lt!300077 () Unit!21990)

(assert (=> b!646684 (= lt!300077 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300076 (select (arr!18454 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646684 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300074 () Unit!21990)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12495) Unit!21990)

(assert (=> b!646684 (= lt!300074 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12492))))

(assert (=> b!646684 (arrayNoDuplicates!0 lt!300076 #b00000000000000000000000000000000 Nil!12492)))

(declare-fun lt!300075 () Unit!21990)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38487 (_ BitVec 32) (_ BitVec 32)) Unit!21990)

(assert (=> b!646684 (= lt!300075 (lemmaNoDuplicateFromThenFromBigger!0 lt!300076 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646684 (arrayNoDuplicates!0 lt!300076 j!136 Nil!12492)))

(declare-fun lt!300068 () Unit!21990)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38487 (_ BitVec 64) (_ BitVec 32) List!12495) Unit!21990)

(assert (=> b!646684 (= lt!300068 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300076 (select (arr!18454 a!2986) j!136) j!136 Nil!12492))))

(assert (=> b!646684 false))

(declare-fun b!646685 () Bool)

(declare-fun res!419056 () Bool)

(assert (=> b!646685 (=> (not res!419056) (not e!370701))))

(assert (=> b!646685 (= res!419056 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18454 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646686 () Bool)

(declare-fun res!419066 () Bool)

(assert (=> b!646686 (=> (not res!419066) (not e!370704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646686 (= res!419066 (validKeyInArray!0 (select (arr!18454 a!2986) j!136)))))

(declare-fun b!646687 () Bool)

(assert (=> b!646687 (= e!370706 e!370707)))

(declare-fun res!419051 () Bool)

(assert (=> b!646687 (=> res!419051 e!370707)))

(assert (=> b!646687 (= res!419051 (bvsge index!984 j!136))))

(declare-fun lt!300065 () Unit!21990)

(assert (=> b!646687 (= lt!300065 e!370705)))

(declare-fun c!74179 () Bool)

(assert (=> b!646687 (= c!74179 (bvslt j!136 index!984))))

(declare-fun b!646688 () Bool)

(declare-fun res!419061 () Bool)

(assert (=> b!646688 (=> (not res!419061) (not e!370704))))

(assert (=> b!646688 (= res!419061 (validKeyInArray!0 k0!1786))))

(declare-fun b!646689 () Bool)

(declare-fun res!419065 () Bool)

(assert (=> b!646689 (=> (not res!419065) (not e!370704))))

(assert (=> b!646689 (= res!419065 (and (= (size!18818 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18818 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18818 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646690 () Bool)

(declare-fun Unit!21995 () Unit!21990)

(assert (=> b!646690 (= e!370705 Unit!21995)))

(declare-fun b!646691 () Bool)

(assert (=> b!646691 (= e!370716 e!370714)))

(declare-fun res!419064 () Bool)

(assert (=> b!646691 (=> res!419064 e!370714)))

(assert (=> b!646691 (= res!419064 (or (not (= (select (arr!18454 a!2986) j!136) lt!300071)) (not (= (select (arr!18454 a!2986) j!136) lt!300067)) (bvsge j!136 index!984)))))

(declare-fun b!646692 () Bool)

(assert (=> b!646692 (= e!370701 e!370702)))

(declare-fun res!419063 () Bool)

(assert (=> b!646692 (=> (not res!419063) (not e!370702))))

(assert (=> b!646692 (= res!419063 (= (select (store (arr!18454 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646692 (= lt!300076 (array!38488 (store (arr!18454 a!2986) i!1108 k0!1786) (size!18818 a!2986)))))

(declare-fun b!646693 () Bool)

(declare-fun res!419053 () Bool)

(assert (=> b!646693 (=> (not res!419053) (not e!370701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38487 (_ BitVec 32)) Bool)

(assert (=> b!646693 (= res!419053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646694 () Bool)

(assert (=> b!646694 (= e!370713 (not e!370709))))

(declare-fun res!419059 () Bool)

(assert (=> b!646694 (=> res!419059 e!370709)))

(declare-fun lt!300070 () SeekEntryResult!6894)

(assert (=> b!646694 (= res!419059 (not (= lt!300070 (Found!6894 index!984))))))

(declare-fun lt!300064 () Unit!21990)

(assert (=> b!646694 (= lt!300064 e!370708)))

(declare-fun c!74180 () Bool)

(assert (=> b!646694 (= c!74180 (= lt!300070 Undefined!6894))))

(assert (=> b!646694 (= lt!300070 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300071 lt!300076 mask!3053))))

(assert (=> b!646694 e!370711))

(declare-fun res!419047 () Bool)

(assert (=> b!646694 (=> (not res!419047) (not e!370711))))

(declare-fun lt!300078 () (_ BitVec 32))

(assert (=> b!646694 (= res!419047 (= lt!300069 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 lt!300071 lt!300076 mask!3053)))))

(assert (=> b!646694 (= lt!300069 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646694 (= lt!300071 (select (store (arr!18454 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300073 () Unit!21990)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38487 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21990)

(assert (=> b!646694 (= lt!300073 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646694 (= lt!300078 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!58552 res!419048) b!646689))

(assert (= (and b!646689 res!419065) b!646686))

(assert (= (and b!646686 res!419066) b!646688))

(assert (= (and b!646688 res!419061) b!646675))

(assert (= (and b!646675 res!419054) b!646672))

(assert (= (and b!646672 res!419055) b!646693))

(assert (= (and b!646693 res!419053) b!646676))

(assert (= (and b!646676 res!419062) b!646685))

(assert (= (and b!646685 res!419056) b!646692))

(assert (= (and b!646692 res!419063) b!646678))

(assert (= (and b!646678 res!419060) b!646694))

(assert (= (and b!646694 res!419047) b!646679))

(assert (= (and b!646694 c!74180) b!646677))

(assert (= (and b!646694 (not c!74180)) b!646683))

(assert (= (and b!646694 (not res!419059)) b!646673))

(assert (= (and b!646673 res!419057) b!646691))

(assert (= (and b!646691 (not res!419064)) b!646671))

(assert (= (and b!646671 res!419052) b!646674))

(assert (= (and b!646673 (not res!419049)) b!646687))

(assert (= (and b!646687 c!74179) b!646684))

(assert (= (and b!646687 (not c!74179)) b!646690))

(assert (= (and b!646687 (not res!419051)) b!646682))

(assert (= (and b!646682 res!419058) b!646681))

(assert (= (and b!646682 (not res!419050)) b!646680))

(declare-fun m!620117 () Bool)

(assert (=> b!646684 m!620117))

(assert (=> b!646684 m!620117))

(declare-fun m!620119 () Bool)

(assert (=> b!646684 m!620119))

(declare-fun m!620121 () Bool)

(assert (=> b!646684 m!620121))

(assert (=> b!646684 m!620117))

(declare-fun m!620123 () Bool)

(assert (=> b!646684 m!620123))

(assert (=> b!646684 m!620117))

(declare-fun m!620125 () Bool)

(assert (=> b!646684 m!620125))

(declare-fun m!620127 () Bool)

(assert (=> b!646684 m!620127))

(declare-fun m!620129 () Bool)

(assert (=> b!646684 m!620129))

(declare-fun m!620131 () Bool)

(assert (=> b!646684 m!620131))

(declare-fun m!620133 () Bool)

(assert (=> b!646692 m!620133))

(declare-fun m!620135 () Bool)

(assert (=> b!646692 m!620135))

(assert (=> b!646673 m!620117))

(assert (=> b!646673 m!620133))

(declare-fun m!620137 () Bool)

(assert (=> b!646673 m!620137))

(declare-fun m!620139 () Bool)

(assert (=> b!646680 m!620139))

(assert (=> b!646674 m!620117))

(assert (=> b!646674 m!620117))

(declare-fun m!620141 () Bool)

(assert (=> b!646674 m!620141))

(declare-fun m!620143 () Bool)

(assert (=> b!646676 m!620143))

(assert (=> b!646671 m!620117))

(assert (=> b!646671 m!620117))

(declare-fun m!620145 () Bool)

(assert (=> b!646671 m!620145))

(assert (=> b!646691 m!620117))

(declare-fun m!620147 () Bool)

(assert (=> b!646693 m!620147))

(assert (=> b!646681 m!620117))

(assert (=> b!646681 m!620117))

(assert (=> b!646681 m!620141))

(assert (=> b!646682 m!620117))

(assert (=> b!646682 m!620117))

(declare-fun m!620149 () Bool)

(assert (=> b!646682 m!620149))

(assert (=> b!646682 m!620117))

(declare-fun m!620151 () Bool)

(assert (=> b!646682 m!620151))

(assert (=> b!646682 m!620117))

(assert (=> b!646682 m!620145))

(declare-fun m!620153 () Bool)

(assert (=> b!646685 m!620153))

(declare-fun m!620155 () Bool)

(assert (=> b!646678 m!620155))

(assert (=> b!646678 m!620117))

(assert (=> b!646678 m!620117))

(declare-fun m!620157 () Bool)

(assert (=> b!646678 m!620157))

(declare-fun m!620159 () Bool)

(assert (=> b!646688 m!620159))

(assert (=> b!646686 m!620117))

(assert (=> b!646686 m!620117))

(declare-fun m!620161 () Bool)

(assert (=> b!646686 m!620161))

(declare-fun m!620163 () Bool)

(assert (=> b!646672 m!620163))

(declare-fun m!620165 () Bool)

(assert (=> start!58552 m!620165))

(declare-fun m!620167 () Bool)

(assert (=> start!58552 m!620167))

(declare-fun m!620169 () Bool)

(assert (=> b!646675 m!620169))

(declare-fun m!620171 () Bool)

(assert (=> b!646694 m!620171))

(declare-fun m!620173 () Bool)

(assert (=> b!646694 m!620173))

(declare-fun m!620175 () Bool)

(assert (=> b!646694 m!620175))

(assert (=> b!646694 m!620117))

(declare-fun m!620177 () Bool)

(assert (=> b!646694 m!620177))

(assert (=> b!646694 m!620117))

(assert (=> b!646694 m!620133))

(declare-fun m!620179 () Bool)

(assert (=> b!646694 m!620179))

(declare-fun m!620181 () Bool)

(assert (=> b!646694 m!620181))

(check-sat (not b!646693) (not b!646675) (not b!646688) (not b!646684) (not b!646680) (not b!646674) (not b!646694) (not b!646676) (not b!646671) (not b!646672) (not b!646681) (not b!646678) (not start!58552) (not b!646686) (not b!646682))
(check-sat)
(get-model)

(declare-fun b!646777 () Bool)

(declare-fun e!370773 () Bool)

(declare-fun call!33659 () Bool)

(assert (=> b!646777 (= e!370773 call!33659)))

(declare-fun b!646778 () Bool)

(declare-fun e!370775 () Bool)

(declare-fun contains!3150 (List!12495 (_ BitVec 64)) Bool)

(assert (=> b!646778 (= e!370775 (contains!3150 Nil!12492 (select (arr!18454 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646779 () Bool)

(declare-fun e!370776 () Bool)

(declare-fun e!370774 () Bool)

(assert (=> b!646779 (= e!370776 e!370774)))

(declare-fun res!419133 () Bool)

(assert (=> b!646779 (=> (not res!419133) (not e!370774))))

(assert (=> b!646779 (= res!419133 (not e!370775))))

(declare-fun res!419134 () Bool)

(assert (=> b!646779 (=> (not res!419134) (not e!370775))))

(assert (=> b!646779 (= res!419134 (validKeyInArray!0 (select (arr!18454 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33656 () Bool)

(declare-fun c!74189 () Bool)

(assert (=> bm!33656 (= call!33659 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74189 (Cons!12491 (select (arr!18454 a!2986) #b00000000000000000000000000000000) Nil!12492) Nil!12492)))))

(declare-fun b!646781 () Bool)

(assert (=> b!646781 (= e!370774 e!370773)))

(assert (=> b!646781 (= c!74189 (validKeyInArray!0 (select (arr!18454 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646780 () Bool)

(assert (=> b!646780 (= e!370773 call!33659)))

(declare-fun d!91373 () Bool)

(declare-fun res!419135 () Bool)

(assert (=> d!91373 (=> res!419135 e!370776)))

(assert (=> d!91373 (= res!419135 (bvsge #b00000000000000000000000000000000 (size!18818 a!2986)))))

(assert (=> d!91373 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12492) e!370776)))

(assert (= (and d!91373 (not res!419135)) b!646779))

(assert (= (and b!646779 res!419134) b!646778))

(assert (= (and b!646779 res!419133) b!646781))

(assert (= (and b!646781 c!74189) b!646777))

(assert (= (and b!646781 (not c!74189)) b!646780))

(assert (= (or b!646777 b!646780) bm!33656))

(declare-fun m!620249 () Bool)

(assert (=> b!646778 m!620249))

(assert (=> b!646778 m!620249))

(declare-fun m!620251 () Bool)

(assert (=> b!646778 m!620251))

(assert (=> b!646779 m!620249))

(assert (=> b!646779 m!620249))

(declare-fun m!620253 () Bool)

(assert (=> b!646779 m!620253))

(assert (=> bm!33656 m!620249))

(declare-fun m!620255 () Bool)

(assert (=> bm!33656 m!620255))

(assert (=> b!646781 m!620249))

(assert (=> b!646781 m!620249))

(assert (=> b!646781 m!620253))

(assert (=> b!646676 d!91373))

(declare-fun d!91375 () Bool)

(declare-fun lt!300133 () SeekEntryResult!6894)

(get-info :version)

(assert (=> d!91375 (and (or ((_ is Undefined!6894) lt!300133) (not ((_ is Found!6894) lt!300133)) (and (bvsge (index!29915 lt!300133) #b00000000000000000000000000000000) (bvslt (index!29915 lt!300133) (size!18818 a!2986)))) (or ((_ is Undefined!6894) lt!300133) ((_ is Found!6894) lt!300133) (not ((_ is MissingVacant!6894) lt!300133)) (not (= (index!29917 lt!300133) vacantSpotIndex!68)) (and (bvsge (index!29917 lt!300133) #b00000000000000000000000000000000) (bvslt (index!29917 lt!300133) (size!18818 a!2986)))) (or ((_ is Undefined!6894) lt!300133) (ite ((_ is Found!6894) lt!300133) (= (select (arr!18454 a!2986) (index!29915 lt!300133)) (select (arr!18454 a!2986) j!136)) (and ((_ is MissingVacant!6894) lt!300133) (= (index!29917 lt!300133) vacantSpotIndex!68) (= (select (arr!18454 a!2986) (index!29917 lt!300133)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370783 () SeekEntryResult!6894)

(assert (=> d!91375 (= lt!300133 e!370783)))

(declare-fun c!74196 () Bool)

(assert (=> d!91375 (= c!74196 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!300132 () (_ BitVec 64))

(assert (=> d!91375 (= lt!300132 (select (arr!18454 a!2986) index!984))))

(assert (=> d!91375 (validMask!0 mask!3053)))

(assert (=> d!91375 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053) lt!300133)))

(declare-fun b!646794 () Bool)

(declare-fun e!370785 () SeekEntryResult!6894)

(assert (=> b!646794 (= e!370785 (MissingVacant!6894 vacantSpotIndex!68))))

(declare-fun b!646795 () Bool)

(assert (=> b!646795 (= e!370785 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646796 () Bool)

(declare-fun e!370784 () SeekEntryResult!6894)

(assert (=> b!646796 (= e!370783 e!370784)))

(declare-fun c!74198 () Bool)

(assert (=> b!646796 (= c!74198 (= lt!300132 (select (arr!18454 a!2986) j!136)))))

(declare-fun b!646797 () Bool)

(declare-fun c!74197 () Bool)

(assert (=> b!646797 (= c!74197 (= lt!300132 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646797 (= e!370784 e!370785)))

(declare-fun b!646798 () Bool)

(assert (=> b!646798 (= e!370784 (Found!6894 index!984))))

(declare-fun b!646799 () Bool)

(assert (=> b!646799 (= e!370783 Undefined!6894)))

(assert (= (and d!91375 c!74196) b!646799))

(assert (= (and d!91375 (not c!74196)) b!646796))

(assert (= (and b!646796 c!74198) b!646798))

(assert (= (and b!646796 (not c!74198)) b!646797))

(assert (= (and b!646797 c!74197) b!646794))

(assert (= (and b!646797 (not c!74197)) b!646795))

(declare-fun m!620257 () Bool)

(assert (=> d!91375 m!620257))

(declare-fun m!620259 () Bool)

(assert (=> d!91375 m!620259))

(assert (=> d!91375 m!620155))

(assert (=> d!91375 m!620165))

(assert (=> b!646795 m!620173))

(assert (=> b!646795 m!620173))

(assert (=> b!646795 m!620117))

(declare-fun m!620261 () Bool)

(assert (=> b!646795 m!620261))

(assert (=> b!646678 d!91375))

(declare-fun d!91377 () Bool)

(assert (=> d!91377 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646688 d!91377))

(declare-fun d!91379 () Bool)

(declare-fun res!419140 () Bool)

(declare-fun e!370790 () Bool)

(assert (=> d!91379 (=> res!419140 e!370790)))

(assert (=> d!91379 (= res!419140 (= (select (arr!18454 lt!300076) index!984) (select (arr!18454 a!2986) j!136)))))

(assert (=> d!91379 (= (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) index!984) e!370790)))

(declare-fun b!646804 () Bool)

(declare-fun e!370791 () Bool)

(assert (=> b!646804 (= e!370790 e!370791)))

(declare-fun res!419141 () Bool)

(assert (=> b!646804 (=> (not res!419141) (not e!370791))))

(assert (=> b!646804 (= res!419141 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18818 lt!300076)))))

(declare-fun b!646805 () Bool)

(assert (=> b!646805 (= e!370791 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91379 (not res!419140)) b!646804))

(assert (= (and b!646804 res!419141) b!646805))

(declare-fun m!620263 () Bool)

(assert (=> d!91379 m!620263))

(assert (=> b!646805 m!620117))

(declare-fun m!620265 () Bool)

(assert (=> b!646805 m!620265))

(assert (=> b!646674 d!91379))

(declare-fun d!91381 () Bool)

(assert (=> d!91381 (arrayNoDuplicates!0 lt!300076 j!136 Nil!12492)))

(declare-fun lt!300136 () Unit!21990)

(declare-fun choose!39 (array!38487 (_ BitVec 32) (_ BitVec 32)) Unit!21990)

(assert (=> d!91381 (= lt!300136 (choose!39 lt!300076 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91381 (bvslt (size!18818 lt!300076) #b01111111111111111111111111111111)))

(assert (=> d!91381 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300076 #b00000000000000000000000000000000 j!136) lt!300136)))

(declare-fun bs!19318 () Bool)

(assert (= bs!19318 d!91381))

(assert (=> bs!19318 m!620121))

(declare-fun m!620267 () Bool)

(assert (=> bs!19318 m!620267))

(assert (=> b!646684 d!91381))

(declare-fun b!646806 () Bool)

(declare-fun e!370792 () Bool)

(declare-fun call!33660 () Bool)

(assert (=> b!646806 (= e!370792 call!33660)))

(declare-fun b!646807 () Bool)

(declare-fun e!370794 () Bool)

(assert (=> b!646807 (= e!370794 (contains!3150 Nil!12492 (select (arr!18454 lt!300076) #b00000000000000000000000000000000)))))

(declare-fun b!646808 () Bool)

(declare-fun e!370795 () Bool)

(declare-fun e!370793 () Bool)

(assert (=> b!646808 (= e!370795 e!370793)))

(declare-fun res!419142 () Bool)

(assert (=> b!646808 (=> (not res!419142) (not e!370793))))

(assert (=> b!646808 (= res!419142 (not e!370794))))

(declare-fun res!419143 () Bool)

(assert (=> b!646808 (=> (not res!419143) (not e!370794))))

(assert (=> b!646808 (= res!419143 (validKeyInArray!0 (select (arr!18454 lt!300076) #b00000000000000000000000000000000)))))

(declare-fun bm!33657 () Bool)

(declare-fun c!74199 () Bool)

(assert (=> bm!33657 (= call!33660 (arrayNoDuplicates!0 lt!300076 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74199 (Cons!12491 (select (arr!18454 lt!300076) #b00000000000000000000000000000000) Nil!12492) Nil!12492)))))

(declare-fun b!646810 () Bool)

(assert (=> b!646810 (= e!370793 e!370792)))

(assert (=> b!646810 (= c!74199 (validKeyInArray!0 (select (arr!18454 lt!300076) #b00000000000000000000000000000000)))))

(declare-fun b!646809 () Bool)

(assert (=> b!646809 (= e!370792 call!33660)))

(declare-fun d!91383 () Bool)

(declare-fun res!419144 () Bool)

(assert (=> d!91383 (=> res!419144 e!370795)))

(assert (=> d!91383 (= res!419144 (bvsge #b00000000000000000000000000000000 (size!18818 lt!300076)))))

(assert (=> d!91383 (= (arrayNoDuplicates!0 lt!300076 #b00000000000000000000000000000000 Nil!12492) e!370795)))

(assert (= (and d!91383 (not res!419144)) b!646808))

(assert (= (and b!646808 res!419143) b!646807))

(assert (= (and b!646808 res!419142) b!646810))

(assert (= (and b!646810 c!74199) b!646806))

(assert (= (and b!646810 (not c!74199)) b!646809))

(assert (= (or b!646806 b!646809) bm!33657))

(declare-fun m!620269 () Bool)

(assert (=> b!646807 m!620269))

(assert (=> b!646807 m!620269))

(declare-fun m!620271 () Bool)

(assert (=> b!646807 m!620271))

(assert (=> b!646808 m!620269))

(assert (=> b!646808 m!620269))

(declare-fun m!620273 () Bool)

(assert (=> b!646808 m!620273))

(assert (=> bm!33657 m!620269))

(declare-fun m!620275 () Bool)

(assert (=> bm!33657 m!620275))

(assert (=> b!646810 m!620269))

(assert (=> b!646810 m!620269))

(assert (=> b!646810 m!620273))

(assert (=> b!646684 d!91383))

(declare-fun b!646811 () Bool)

(declare-fun e!370796 () Bool)

(declare-fun call!33661 () Bool)

(assert (=> b!646811 (= e!370796 call!33661)))

(declare-fun b!646812 () Bool)

(declare-fun e!370798 () Bool)

(assert (=> b!646812 (= e!370798 (contains!3150 Nil!12492 (select (arr!18454 lt!300076) j!136)))))

(declare-fun b!646813 () Bool)

(declare-fun e!370799 () Bool)

(declare-fun e!370797 () Bool)

(assert (=> b!646813 (= e!370799 e!370797)))

(declare-fun res!419145 () Bool)

(assert (=> b!646813 (=> (not res!419145) (not e!370797))))

(assert (=> b!646813 (= res!419145 (not e!370798))))

(declare-fun res!419146 () Bool)

(assert (=> b!646813 (=> (not res!419146) (not e!370798))))

(assert (=> b!646813 (= res!419146 (validKeyInArray!0 (select (arr!18454 lt!300076) j!136)))))

(declare-fun c!74200 () Bool)

(declare-fun bm!33658 () Bool)

(assert (=> bm!33658 (= call!33661 (arrayNoDuplicates!0 lt!300076 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74200 (Cons!12491 (select (arr!18454 lt!300076) j!136) Nil!12492) Nil!12492)))))

(declare-fun b!646815 () Bool)

(assert (=> b!646815 (= e!370797 e!370796)))

(assert (=> b!646815 (= c!74200 (validKeyInArray!0 (select (arr!18454 lt!300076) j!136)))))

(declare-fun b!646814 () Bool)

(assert (=> b!646814 (= e!370796 call!33661)))

(declare-fun d!91385 () Bool)

(declare-fun res!419147 () Bool)

(assert (=> d!91385 (=> res!419147 e!370799)))

(assert (=> d!91385 (= res!419147 (bvsge j!136 (size!18818 lt!300076)))))

(assert (=> d!91385 (= (arrayNoDuplicates!0 lt!300076 j!136 Nil!12492) e!370799)))

(assert (= (and d!91385 (not res!419147)) b!646813))

(assert (= (and b!646813 res!419146) b!646812))

(assert (= (and b!646813 res!419145) b!646815))

(assert (= (and b!646815 c!74200) b!646811))

(assert (= (and b!646815 (not c!74200)) b!646814))

(assert (= (or b!646811 b!646814) bm!33658))

(declare-fun m!620277 () Bool)

(assert (=> b!646812 m!620277))

(assert (=> b!646812 m!620277))

(declare-fun m!620279 () Bool)

(assert (=> b!646812 m!620279))

(assert (=> b!646813 m!620277))

(assert (=> b!646813 m!620277))

(declare-fun m!620281 () Bool)

(assert (=> b!646813 m!620281))

(assert (=> bm!33658 m!620277))

(declare-fun m!620283 () Bool)

(assert (=> bm!33658 m!620283))

(assert (=> b!646815 m!620277))

(assert (=> b!646815 m!620277))

(assert (=> b!646815 m!620281))

(assert (=> b!646684 d!91385))

(declare-fun d!91387 () Bool)

(assert (=> d!91387 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18818 lt!300076)) (not (= (select (arr!18454 lt!300076) j!136) (select (arr!18454 a!2986) j!136))))))

(declare-fun lt!300139 () Unit!21990)

(declare-fun choose!21 (array!38487 (_ BitVec 64) (_ BitVec 32) List!12495) Unit!21990)

(assert (=> d!91387 (= lt!300139 (choose!21 lt!300076 (select (arr!18454 a!2986) j!136) j!136 Nil!12492))))

(assert (=> d!91387 (bvslt (size!18818 lt!300076) #b01111111111111111111111111111111)))

(assert (=> d!91387 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300076 (select (arr!18454 a!2986) j!136) j!136 Nil!12492) lt!300139)))

(declare-fun bs!19319 () Bool)

(assert (= bs!19319 d!91387))

(assert (=> bs!19319 m!620277))

(assert (=> bs!19319 m!620117))

(declare-fun m!620285 () Bool)

(assert (=> bs!19319 m!620285))

(assert (=> b!646684 d!91387))

(declare-fun d!91389 () Bool)

(declare-fun res!419148 () Bool)

(declare-fun e!370800 () Bool)

(assert (=> d!91389 (=> res!419148 e!370800)))

(assert (=> d!91389 (= res!419148 (= (select (arr!18454 lt!300076) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18454 a!2986) j!136)))))

(assert (=> d!91389 (= (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!370800)))

(declare-fun b!646816 () Bool)

(declare-fun e!370801 () Bool)

(assert (=> b!646816 (= e!370800 e!370801)))

(declare-fun res!419149 () Bool)

(assert (=> b!646816 (=> (not res!419149) (not e!370801))))

(assert (=> b!646816 (= res!419149 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18818 lt!300076)))))

(declare-fun b!646817 () Bool)

(assert (=> b!646817 (= e!370801 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91389 (not res!419148)) b!646816))

(assert (= (and b!646816 res!419149) b!646817))

(declare-fun m!620287 () Bool)

(assert (=> d!91389 m!620287))

(assert (=> b!646817 m!620117))

(declare-fun m!620289 () Bool)

(assert (=> b!646817 m!620289))

(assert (=> b!646684 d!91389))

(declare-fun d!91391 () Bool)

(assert (=> d!91391 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300142 () Unit!21990)

(declare-fun choose!114 (array!38487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21990)

(assert (=> d!91391 (= lt!300142 (choose!114 lt!300076 (select (arr!18454 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91391 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91391 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300076 (select (arr!18454 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300142)))

(declare-fun bs!19320 () Bool)

(assert (= bs!19320 d!91391))

(assert (=> bs!19320 m!620117))

(assert (=> bs!19320 m!620125))

(assert (=> bs!19320 m!620117))

(declare-fun m!620291 () Bool)

(assert (=> bs!19320 m!620291))

(assert (=> b!646684 d!91391))

(declare-fun d!91393 () Bool)

(declare-fun e!370804 () Bool)

(assert (=> d!91393 e!370804))

(declare-fun res!419152 () Bool)

(assert (=> d!91393 (=> (not res!419152) (not e!370804))))

(assert (=> d!91393 (= res!419152 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18818 a!2986))))))

(declare-fun lt!300145 () Unit!21990)

(declare-fun choose!41 (array!38487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12495) Unit!21990)

(assert (=> d!91393 (= lt!300145 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12492))))

(assert (=> d!91393 (bvslt (size!18818 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91393 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12492) lt!300145)))

(declare-fun b!646820 () Bool)

(assert (=> b!646820 (= e!370804 (arrayNoDuplicates!0 (array!38488 (store (arr!18454 a!2986) i!1108 k0!1786) (size!18818 a!2986)) #b00000000000000000000000000000000 Nil!12492))))

(assert (= (and d!91393 res!419152) b!646820))

(declare-fun m!620293 () Bool)

(assert (=> d!91393 m!620293))

(assert (=> b!646820 m!620133))

(declare-fun m!620295 () Bool)

(assert (=> b!646820 m!620295))

(assert (=> b!646684 d!91393))

(declare-fun d!91395 () Bool)

(assert (=> d!91395 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58552 d!91395))

(declare-fun d!91401 () Bool)

(assert (=> d!91401 (= (array_inv!14250 a!2986) (bvsge (size!18818 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58552 d!91401))

(declare-fun d!91403 () Bool)

(assert (=> d!91403 (= (validKeyInArray!0 (select (arr!18454 a!2986) j!136)) (and (not (= (select (arr!18454 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18454 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646686 d!91403))

(declare-fun d!91405 () Bool)

(declare-fun res!419153 () Bool)

(declare-fun e!370805 () Bool)

(assert (=> d!91405 (=> res!419153 e!370805)))

(assert (=> d!91405 (= res!419153 (= (select (arr!18454 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91405 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!370805)))

(declare-fun b!646821 () Bool)

(declare-fun e!370806 () Bool)

(assert (=> b!646821 (= e!370805 e!370806)))

(declare-fun res!419154 () Bool)

(assert (=> b!646821 (=> (not res!419154) (not e!370806))))

(assert (=> b!646821 (= res!419154 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18818 a!2986)))))

(declare-fun b!646822 () Bool)

(assert (=> b!646822 (= e!370806 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91405 (not res!419153)) b!646821))

(assert (= (and b!646821 res!419154) b!646822))

(assert (=> d!91405 m!620249))

(declare-fun m!620297 () Bool)

(assert (=> b!646822 m!620297))

(assert (=> b!646675 d!91405))

(declare-fun d!91407 () Bool)

(declare-fun res!419155 () Bool)

(declare-fun e!370807 () Bool)

(assert (=> d!91407 (=> res!419155 e!370807)))

(assert (=> d!91407 (= res!419155 (= (select (arr!18454 lt!300076) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18454 a!2986) j!136)))))

(assert (=> d!91407 (= (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!370807)))

(declare-fun b!646823 () Bool)

(declare-fun e!370808 () Bool)

(assert (=> b!646823 (= e!370807 e!370808)))

(declare-fun res!419156 () Bool)

(assert (=> b!646823 (=> (not res!419156) (not e!370808))))

(assert (=> b!646823 (= res!419156 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18818 lt!300076)))))

(declare-fun b!646824 () Bool)

(assert (=> b!646824 (= e!370808 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91407 (not res!419155)) b!646823))

(assert (= (and b!646823 res!419156) b!646824))

(declare-fun m!620299 () Bool)

(assert (=> d!91407 m!620299))

(assert (=> b!646824 m!620117))

(declare-fun m!620301 () Bool)

(assert (=> b!646824 m!620301))

(assert (=> b!646682 d!91407))

(declare-fun d!91409 () Bool)

(assert (=> d!91409 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300146 () Unit!21990)

(assert (=> d!91409 (= lt!300146 (choose!114 lt!300076 (select (arr!18454 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91409 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91409 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300076 (select (arr!18454 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300146)))

(declare-fun bs!19321 () Bool)

(assert (= bs!19321 d!91409))

(assert (=> bs!19321 m!620117))

(assert (=> bs!19321 m!620149))

(assert (=> bs!19321 m!620117))

(declare-fun m!620303 () Bool)

(assert (=> bs!19321 m!620303))

(assert (=> b!646682 d!91409))

(declare-fun d!91411 () Bool)

(declare-fun res!419161 () Bool)

(declare-fun e!370813 () Bool)

(assert (=> d!91411 (=> res!419161 e!370813)))

(assert (=> d!91411 (= res!419161 (= (select (arr!18454 lt!300076) j!136) (select (arr!18454 a!2986) j!136)))))

(assert (=> d!91411 (= (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) j!136) e!370813)))

(declare-fun b!646829 () Bool)

(declare-fun e!370814 () Bool)

(assert (=> b!646829 (= e!370813 e!370814)))

(declare-fun res!419162 () Bool)

(assert (=> b!646829 (=> (not res!419162) (not e!370814))))

(assert (=> b!646829 (= res!419162 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18818 lt!300076)))))

(declare-fun b!646830 () Bool)

(assert (=> b!646830 (= e!370814 (arrayContainsKey!0 lt!300076 (select (arr!18454 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91411 (not res!419161)) b!646829))

(assert (= (and b!646829 res!419162) b!646830))

(assert (=> d!91411 m!620277))

(assert (=> b!646830 m!620117))

(declare-fun m!620305 () Bool)

(assert (=> b!646830 m!620305))

(assert (=> b!646682 d!91411))

(declare-fun b!646855 () Bool)

(declare-fun e!370835 () Bool)

(declare-fun e!370837 () Bool)

(assert (=> b!646855 (= e!370835 e!370837)))

(declare-fun c!74205 () Bool)

(assert (=> b!646855 (= c!74205 (validKeyInArray!0 (select (arr!18454 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91413 () Bool)

(declare-fun res!419179 () Bool)

(assert (=> d!91413 (=> res!419179 e!370835)))

(assert (=> d!91413 (= res!419179 (bvsge #b00000000000000000000000000000000 (size!18818 a!2986)))))

(assert (=> d!91413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!370835)))

(declare-fun b!646856 () Bool)

(declare-fun e!370836 () Bool)

(assert (=> b!646856 (= e!370837 e!370836)))

(declare-fun lt!300162 () (_ BitVec 64))

(assert (=> b!646856 (= lt!300162 (select (arr!18454 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300163 () Unit!21990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38487 (_ BitVec 64) (_ BitVec 32)) Unit!21990)

(assert (=> b!646856 (= lt!300163 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300162 #b00000000000000000000000000000000))))

(assert (=> b!646856 (arrayContainsKey!0 a!2986 lt!300162 #b00000000000000000000000000000000)))

(declare-fun lt!300164 () Unit!21990)

(assert (=> b!646856 (= lt!300164 lt!300163)))

(declare-fun res!419180 () Bool)

(assert (=> b!646856 (= res!419180 (= (seekEntryOrOpen!0 (select (arr!18454 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6894 #b00000000000000000000000000000000)))))

(assert (=> b!646856 (=> (not res!419180) (not e!370836))))

(declare-fun b!646857 () Bool)

(declare-fun call!33666 () Bool)

(assert (=> b!646857 (= e!370836 call!33666)))

(declare-fun bm!33663 () Bool)

(assert (=> bm!33663 (= call!33666 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!646858 () Bool)

(assert (=> b!646858 (= e!370837 call!33666)))

(assert (= (and d!91413 (not res!419179)) b!646855))

(assert (= (and b!646855 c!74205) b!646856))

(assert (= (and b!646855 (not c!74205)) b!646858))

(assert (= (and b!646856 res!419180) b!646857))

(assert (= (or b!646857 b!646858) bm!33663))

(assert (=> b!646855 m!620249))

(assert (=> b!646855 m!620249))

(assert (=> b!646855 m!620253))

(assert (=> b!646856 m!620249))

(declare-fun m!620317 () Bool)

(assert (=> b!646856 m!620317))

(declare-fun m!620319 () Bool)

(assert (=> b!646856 m!620319))

(assert (=> b!646856 m!620249))

(declare-fun m!620321 () Bool)

(assert (=> b!646856 m!620321))

(declare-fun m!620323 () Bool)

(assert (=> bm!33663 m!620323))

(assert (=> b!646693 d!91413))

(assert (=> b!646671 d!91411))

(declare-fun d!91423 () Bool)

(declare-fun lt!300169 () SeekEntryResult!6894)

(assert (=> d!91423 (and (or ((_ is Undefined!6894) lt!300169) (not ((_ is Found!6894) lt!300169)) (and (bvsge (index!29915 lt!300169) #b00000000000000000000000000000000) (bvslt (index!29915 lt!300169) (size!18818 a!2986)))) (or ((_ is Undefined!6894) lt!300169) ((_ is Found!6894) lt!300169) (not ((_ is MissingVacant!6894) lt!300169)) (not (= (index!29917 lt!300169) vacantSpotIndex!68)) (and (bvsge (index!29917 lt!300169) #b00000000000000000000000000000000) (bvslt (index!29917 lt!300169) (size!18818 a!2986)))) (or ((_ is Undefined!6894) lt!300169) (ite ((_ is Found!6894) lt!300169) (= (select (arr!18454 a!2986) (index!29915 lt!300169)) (select (arr!18454 a!2986) j!136)) (and ((_ is MissingVacant!6894) lt!300169) (= (index!29917 lt!300169) vacantSpotIndex!68) (= (select (arr!18454 a!2986) (index!29917 lt!300169)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370849 () SeekEntryResult!6894)

(assert (=> d!91423 (= lt!300169 e!370849)))

(declare-fun c!74209 () Bool)

(assert (=> d!91423 (= c!74209 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!300168 () (_ BitVec 64))

(assert (=> d!91423 (= lt!300168 (select (arr!18454 a!2986) lt!300078))))

(assert (=> d!91423 (validMask!0 mask!3053)))

(assert (=> d!91423 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053) lt!300169)))

(declare-fun b!646873 () Bool)

(declare-fun e!370851 () SeekEntryResult!6894)

(assert (=> b!646873 (= e!370851 (MissingVacant!6894 vacantSpotIndex!68))))

(declare-fun b!646874 () Bool)

(assert (=> b!646874 (= e!370851 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300078 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646875 () Bool)

(declare-fun e!370850 () SeekEntryResult!6894)

(assert (=> b!646875 (= e!370849 e!370850)))

(declare-fun c!74211 () Bool)

(assert (=> b!646875 (= c!74211 (= lt!300168 (select (arr!18454 a!2986) j!136)))))

(declare-fun b!646876 () Bool)

(declare-fun c!74210 () Bool)

(assert (=> b!646876 (= c!74210 (= lt!300168 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646876 (= e!370850 e!370851)))

(declare-fun b!646877 () Bool)

(assert (=> b!646877 (= e!370850 (Found!6894 lt!300078))))

(declare-fun b!646878 () Bool)

(assert (=> b!646878 (= e!370849 Undefined!6894)))

(assert (= (and d!91423 c!74209) b!646878))

(assert (= (and d!91423 (not c!74209)) b!646875))

(assert (= (and b!646875 c!74211) b!646877))

(assert (= (and b!646875 (not c!74211)) b!646876))

(assert (= (and b!646876 c!74210) b!646873))

(assert (= (and b!646876 (not c!74210)) b!646874))

(declare-fun m!620337 () Bool)

(assert (=> d!91423 m!620337))

(declare-fun m!620339 () Bool)

(assert (=> d!91423 m!620339))

(declare-fun m!620341 () Bool)

(assert (=> d!91423 m!620341))

(assert (=> d!91423 m!620165))

(declare-fun m!620343 () Bool)

(assert (=> b!646874 m!620343))

(assert (=> b!646874 m!620343))

(assert (=> b!646874 m!620117))

(declare-fun m!620345 () Bool)

(assert (=> b!646874 m!620345))

(assert (=> b!646694 d!91423))

(declare-fun d!91427 () Bool)

(declare-fun e!370865 () Bool)

(assert (=> d!91427 e!370865))

(declare-fun res!419201 () Bool)

(assert (=> d!91427 (=> (not res!419201) (not e!370865))))

(assert (=> d!91427 (= res!419201 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18818 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18818 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18818 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18818 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18818 a!2986))))))

(declare-fun lt!300181 () Unit!21990)

(declare-fun choose!9 (array!38487 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21990)

(assert (=> d!91427 (= lt!300181 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91427 (validMask!0 mask!3053)))

(assert (=> d!91427 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 mask!3053) lt!300181)))

(declare-fun b!646893 () Bool)

(assert (=> b!646893 (= e!370865 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 (select (arr!18454 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 (select (store (arr!18454 a!2986) i!1108 k0!1786) j!136) (array!38488 (store (arr!18454 a!2986) i!1108 k0!1786) (size!18818 a!2986)) mask!3053)))))

(assert (= (and d!91427 res!419201) b!646893))

(declare-fun m!620371 () Bool)

(assert (=> d!91427 m!620371))

(assert (=> d!91427 m!620165))

(assert (=> b!646893 m!620133))

(assert (=> b!646893 m!620175))

(declare-fun m!620373 () Bool)

(assert (=> b!646893 m!620373))

(assert (=> b!646893 m!620117))

(assert (=> b!646893 m!620117))

(assert (=> b!646893 m!620177))

(assert (=> b!646893 m!620175))

(assert (=> b!646694 d!91427))

(declare-fun lt!300183 () SeekEntryResult!6894)

(declare-fun d!91447 () Bool)

(assert (=> d!91447 (and (or ((_ is Undefined!6894) lt!300183) (not ((_ is Found!6894) lt!300183)) (and (bvsge (index!29915 lt!300183) #b00000000000000000000000000000000) (bvslt (index!29915 lt!300183) (size!18818 lt!300076)))) (or ((_ is Undefined!6894) lt!300183) ((_ is Found!6894) lt!300183) (not ((_ is MissingVacant!6894) lt!300183)) (not (= (index!29917 lt!300183) vacantSpotIndex!68)) (and (bvsge (index!29917 lt!300183) #b00000000000000000000000000000000) (bvslt (index!29917 lt!300183) (size!18818 lt!300076)))) (or ((_ is Undefined!6894) lt!300183) (ite ((_ is Found!6894) lt!300183) (= (select (arr!18454 lt!300076) (index!29915 lt!300183)) lt!300071) (and ((_ is MissingVacant!6894) lt!300183) (= (index!29917 lt!300183) vacantSpotIndex!68) (= (select (arr!18454 lt!300076) (index!29917 lt!300183)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370866 () SeekEntryResult!6894)

(assert (=> d!91447 (= lt!300183 e!370866)))

(declare-fun c!74213 () Bool)

(assert (=> d!91447 (= c!74213 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!300182 () (_ BitVec 64))

(assert (=> d!91447 (= lt!300182 (select (arr!18454 lt!300076) index!984))))

(assert (=> d!91447 (validMask!0 mask!3053)))

(assert (=> d!91447 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300071 lt!300076 mask!3053) lt!300183)))

(declare-fun b!646894 () Bool)

(declare-fun e!370868 () SeekEntryResult!6894)

(assert (=> b!646894 (= e!370868 (MissingVacant!6894 vacantSpotIndex!68))))

(declare-fun b!646895 () Bool)

(assert (=> b!646895 (= e!370868 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!300071 lt!300076 mask!3053))))

(declare-fun b!646896 () Bool)

(declare-fun e!370867 () SeekEntryResult!6894)

(assert (=> b!646896 (= e!370866 e!370867)))

(declare-fun c!74215 () Bool)

(assert (=> b!646896 (= c!74215 (= lt!300182 lt!300071))))

(declare-fun b!646897 () Bool)

(declare-fun c!74214 () Bool)

(assert (=> b!646897 (= c!74214 (= lt!300182 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646897 (= e!370867 e!370868)))

(declare-fun b!646898 () Bool)

(assert (=> b!646898 (= e!370867 (Found!6894 index!984))))

(declare-fun b!646899 () Bool)

(assert (=> b!646899 (= e!370866 Undefined!6894)))

(assert (= (and d!91447 c!74213) b!646899))

(assert (= (and d!91447 (not c!74213)) b!646896))

(assert (= (and b!646896 c!74215) b!646898))

(assert (= (and b!646896 (not c!74215)) b!646897))

(assert (= (and b!646897 c!74214) b!646894))

(assert (= (and b!646897 (not c!74214)) b!646895))

(declare-fun m!620375 () Bool)

(assert (=> d!91447 m!620375))

(declare-fun m!620377 () Bool)

(assert (=> d!91447 m!620377))

(assert (=> d!91447 m!620263))

(assert (=> d!91447 m!620165))

(assert (=> b!646895 m!620173))

(assert (=> b!646895 m!620173))

(declare-fun m!620379 () Bool)

(assert (=> b!646895 m!620379))

(assert (=> b!646694 d!91447))

(declare-fun d!91449 () Bool)

(declare-fun lt!300186 () (_ BitVec 32))

(assert (=> d!91449 (and (bvsge lt!300186 #b00000000000000000000000000000000) (bvslt lt!300186 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91449 (= lt!300186 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91449 (validMask!0 mask!3053)))

(assert (=> d!91449 (= (nextIndex!0 index!984 x!910 mask!3053) lt!300186)))

(declare-fun bs!19325 () Bool)

(assert (= bs!19325 d!91449))

(declare-fun m!620391 () Bool)

(assert (=> bs!19325 m!620391))

(assert (=> bs!19325 m!620165))

(assert (=> b!646694 d!91449))

(declare-fun d!91455 () Bool)

(declare-fun lt!300188 () SeekEntryResult!6894)

(assert (=> d!91455 (and (or ((_ is Undefined!6894) lt!300188) (not ((_ is Found!6894) lt!300188)) (and (bvsge (index!29915 lt!300188) #b00000000000000000000000000000000) (bvslt (index!29915 lt!300188) (size!18818 lt!300076)))) (or ((_ is Undefined!6894) lt!300188) ((_ is Found!6894) lt!300188) (not ((_ is MissingVacant!6894) lt!300188)) (not (= (index!29917 lt!300188) vacantSpotIndex!68)) (and (bvsge (index!29917 lt!300188) #b00000000000000000000000000000000) (bvslt (index!29917 lt!300188) (size!18818 lt!300076)))) (or ((_ is Undefined!6894) lt!300188) (ite ((_ is Found!6894) lt!300188) (= (select (arr!18454 lt!300076) (index!29915 lt!300188)) lt!300071) (and ((_ is MissingVacant!6894) lt!300188) (= (index!29917 lt!300188) vacantSpotIndex!68) (= (select (arr!18454 lt!300076) (index!29917 lt!300188)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370881 () SeekEntryResult!6894)

(assert (=> d!91455 (= lt!300188 e!370881)))

(declare-fun c!74217 () Bool)

(assert (=> d!91455 (= c!74217 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!300187 () (_ BitVec 64))

(assert (=> d!91455 (= lt!300187 (select (arr!18454 lt!300076) lt!300078))))

(assert (=> d!91455 (validMask!0 mask!3053)))

(assert (=> d!91455 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300078 vacantSpotIndex!68 lt!300071 lt!300076 mask!3053) lt!300188)))

(declare-fun b!646913 () Bool)

(declare-fun e!370883 () SeekEntryResult!6894)

(assert (=> b!646913 (= e!370883 (MissingVacant!6894 vacantSpotIndex!68))))

(declare-fun b!646914 () Bool)

(assert (=> b!646914 (= e!370883 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300078 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!300071 lt!300076 mask!3053))))

(declare-fun b!646915 () Bool)

(declare-fun e!370882 () SeekEntryResult!6894)

(assert (=> b!646915 (= e!370881 e!370882)))

(declare-fun c!74219 () Bool)

(assert (=> b!646915 (= c!74219 (= lt!300187 lt!300071))))

(declare-fun b!646916 () Bool)

(declare-fun c!74218 () Bool)

(assert (=> b!646916 (= c!74218 (= lt!300187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646916 (= e!370882 e!370883)))

(declare-fun b!646917 () Bool)

(assert (=> b!646917 (= e!370882 (Found!6894 lt!300078))))

(declare-fun b!646918 () Bool)

(assert (=> b!646918 (= e!370881 Undefined!6894)))

(assert (= (and d!91455 c!74217) b!646918))

(assert (= (and d!91455 (not c!74217)) b!646915))

(assert (= (and b!646915 c!74219) b!646917))

(assert (= (and b!646915 (not c!74219)) b!646916))

(assert (= (and b!646916 c!74218) b!646913))

(assert (= (and b!646916 (not c!74218)) b!646914))

(declare-fun m!620397 () Bool)

(assert (=> d!91455 m!620397))

(declare-fun m!620399 () Bool)

(assert (=> d!91455 m!620399))

(declare-fun m!620401 () Bool)

(assert (=> d!91455 m!620401))

(assert (=> d!91455 m!620165))

(assert (=> b!646914 m!620343))

(assert (=> b!646914 m!620343))

(declare-fun m!620403 () Bool)

(assert (=> b!646914 m!620403))

(assert (=> b!646694 d!91455))

(declare-fun d!91459 () Bool)

(declare-fun lt!300209 () SeekEntryResult!6894)

(assert (=> d!91459 (and (or ((_ is Undefined!6894) lt!300209) (not ((_ is Found!6894) lt!300209)) (and (bvsge (index!29915 lt!300209) #b00000000000000000000000000000000) (bvslt (index!29915 lt!300209) (size!18818 a!2986)))) (or ((_ is Undefined!6894) lt!300209) ((_ is Found!6894) lt!300209) (not ((_ is MissingZero!6894) lt!300209)) (and (bvsge (index!29914 lt!300209) #b00000000000000000000000000000000) (bvslt (index!29914 lt!300209) (size!18818 a!2986)))) (or ((_ is Undefined!6894) lt!300209) ((_ is Found!6894) lt!300209) ((_ is MissingZero!6894) lt!300209) (not ((_ is MissingVacant!6894) lt!300209)) (and (bvsge (index!29917 lt!300209) #b00000000000000000000000000000000) (bvslt (index!29917 lt!300209) (size!18818 a!2986)))) (or ((_ is Undefined!6894) lt!300209) (ite ((_ is Found!6894) lt!300209) (= (select (arr!18454 a!2986) (index!29915 lt!300209)) k0!1786) (ite ((_ is MissingZero!6894) lt!300209) (= (select (arr!18454 a!2986) (index!29914 lt!300209)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6894) lt!300209) (= (select (arr!18454 a!2986) (index!29917 lt!300209)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!370911 () SeekEntryResult!6894)

(assert (=> d!91459 (= lt!300209 e!370911)))

(declare-fun c!74246 () Bool)

(declare-fun lt!300211 () SeekEntryResult!6894)

(assert (=> d!91459 (= c!74246 (and ((_ is Intermediate!6894) lt!300211) (undefined!7706 lt!300211)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38487 (_ BitVec 32)) SeekEntryResult!6894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91459 (= lt!300211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91459 (validMask!0 mask!3053)))

(assert (=> d!91459 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!300209)))

(declare-fun b!646969 () Bool)

(assert (=> b!646969 (= e!370911 Undefined!6894)))

(declare-fun b!646970 () Bool)

(declare-fun c!74244 () Bool)

(declare-fun lt!300210 () (_ BitVec 64))

(assert (=> b!646970 (= c!74244 (= lt!300210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370910 () SeekEntryResult!6894)

(declare-fun e!370912 () SeekEntryResult!6894)

(assert (=> b!646970 (= e!370910 e!370912)))

(declare-fun b!646971 () Bool)

(assert (=> b!646971 (= e!370912 (MissingZero!6894 (index!29916 lt!300211)))))

(declare-fun b!646972 () Bool)

(assert (=> b!646972 (= e!370912 (seekKeyOrZeroReturnVacant!0 (x!58688 lt!300211) (index!29916 lt!300211) (index!29916 lt!300211) k0!1786 a!2986 mask!3053))))

(declare-fun b!646973 () Bool)

(assert (=> b!646973 (= e!370911 e!370910)))

(assert (=> b!646973 (= lt!300210 (select (arr!18454 a!2986) (index!29916 lt!300211)))))

(declare-fun c!74245 () Bool)

(assert (=> b!646973 (= c!74245 (= lt!300210 k0!1786))))

(declare-fun b!646974 () Bool)

(assert (=> b!646974 (= e!370910 (Found!6894 (index!29916 lt!300211)))))

(assert (= (and d!91459 c!74246) b!646969))

(assert (= (and d!91459 (not c!74246)) b!646973))

(assert (= (and b!646973 c!74245) b!646974))

(assert (= (and b!646973 (not c!74245)) b!646970))

(assert (= (and b!646970 c!74244) b!646971))

(assert (= (and b!646970 (not c!74244)) b!646972))

(declare-fun m!620417 () Bool)

(assert (=> d!91459 m!620417))

(declare-fun m!620419 () Bool)

(assert (=> d!91459 m!620419))

(assert (=> d!91459 m!620165))

(declare-fun m!620421 () Bool)

(assert (=> d!91459 m!620421))

(declare-fun m!620423 () Bool)

(assert (=> d!91459 m!620423))

(assert (=> d!91459 m!620419))

(declare-fun m!620425 () Bool)

(assert (=> d!91459 m!620425))

(declare-fun m!620427 () Bool)

(assert (=> b!646972 m!620427))

(declare-fun m!620429 () Bool)

(assert (=> b!646973 m!620429))

(assert (=> b!646672 d!91459))

(assert (=> b!646681 d!91379))

(declare-fun d!91465 () Bool)

(declare-fun res!419224 () Bool)

(declare-fun e!370927 () Bool)

(assert (=> d!91465 (=> res!419224 e!370927)))

(assert (=> d!91465 (= res!419224 ((_ is Nil!12492) Nil!12492))))

(assert (=> d!91465 (= (noDuplicate!412 Nil!12492) e!370927)))

(declare-fun b!646994 () Bool)

(declare-fun e!370928 () Bool)

(assert (=> b!646994 (= e!370927 e!370928)))

(declare-fun res!419225 () Bool)

(assert (=> b!646994 (=> (not res!419225) (not e!370928))))

(assert (=> b!646994 (= res!419225 (not (contains!3150 (t!18723 Nil!12492) (h!13536 Nil!12492))))))

(declare-fun b!646995 () Bool)

(assert (=> b!646995 (= e!370928 (noDuplicate!412 (t!18723 Nil!12492)))))

(assert (= (and d!91465 (not res!419224)) b!646994))

(assert (= (and b!646994 res!419225) b!646995))

(declare-fun m!620445 () Bool)

(assert (=> b!646994 m!620445))

(declare-fun m!620447 () Bool)

(assert (=> b!646995 m!620447))

(assert (=> b!646680 d!91465))

(check-sat (not d!91387) (not b!646874) (not b!646817) (not b!646830) (not b!646895) (not b!646805) (not b!646855) (not b!646995) (not bm!33657) (not b!646808) (not b!646972) (not d!91427) (not d!91447) (not d!91393) (not b!646856) (not b!646914) (not d!91423) (not d!91459) (not b!646778) (not b!646824) (not b!646807) (not d!91391) (not d!91375) (not b!646795) (not d!91381) (not bm!33658) (not b!646813) (not d!91455) (not d!91409) (not d!91449) (not b!646810) (not b!646812) (not b!646822) (not b!646815) (not b!646820) (not b!646781) (not bm!33663) (not b!646779) (not b!646994) (not b!646893) (not bm!33656))
(check-sat)
