; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56040 () Bool)

(assert start!56040)

(declare-fun b!617152 () Bool)

(declare-fun res!397640 () Bool)

(declare-fun e!353878 () Bool)

(assert (=> b!617152 (=> (not res!397640) (not e!353878))))

(declare-datatypes ((array!37524 0))(
  ( (array!37525 (arr!18008 (Array (_ BitVec 32) (_ BitVec 64))) (size!18373 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37524)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37524 (_ BitVec 32)) Bool)

(assert (=> b!617152 (= res!397640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617153 () Bool)

(declare-fun e!353880 () Bool)

(declare-fun e!353870 () Bool)

(assert (=> b!617153 (= e!353880 e!353870)))

(declare-fun res!397625 () Bool)

(assert (=> b!617153 (=> (not res!397625) (not e!353870))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6445 0))(
  ( (MissingZero!6445 (index!28064 (_ BitVec 32))) (Found!6445 (index!28065 (_ BitVec 32))) (Intermediate!6445 (undefined!7257 Bool) (index!28066 (_ BitVec 32)) (x!56864 (_ BitVec 32))) (Undefined!6445) (MissingVacant!6445 (index!28067 (_ BitVec 32))) )
))
(declare-fun lt!284078 () SeekEntryResult!6445)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617153 (= res!397625 (and (= lt!284078 (Found!6445 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18008 a!2986) index!984) (select (arr!18008 a!2986) j!136))) (not (= (select (arr!18008 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37524 (_ BitVec 32)) SeekEntryResult!6445)

(assert (=> b!617153 (= lt!284078 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18008 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617154 () Bool)

(declare-fun e!353874 () Bool)

(assert (=> b!617154 (= e!353874 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!617154 (= (select (store (arr!18008 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617155 () Bool)

(declare-fun e!353872 () Bool)

(declare-fun lt!284068 () SeekEntryResult!6445)

(assert (=> b!617155 (= e!353872 (= lt!284078 lt!284068))))

(declare-fun b!617156 () Bool)

(declare-fun res!397628 () Bool)

(assert (=> b!617156 (=> (not res!397628) (not e!353878))))

(assert (=> b!617156 (= res!397628 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18008 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617158 () Bool)

(declare-datatypes ((Unit!20196 0))(
  ( (Unit!20197) )
))
(declare-fun e!353879 () Unit!20196)

(declare-fun Unit!20198 () Unit!20196)

(assert (=> b!617158 (= e!353879 Unit!20198)))

(declare-fun b!617159 () Bool)

(declare-fun e!353873 () Unit!20196)

(declare-fun Unit!20199 () Unit!20196)

(assert (=> b!617159 (= e!353873 Unit!20199)))

(declare-fun b!617160 () Bool)

(declare-fun e!353876 () Unit!20196)

(declare-fun Unit!20200 () Unit!20196)

(assert (=> b!617160 (= e!353876 Unit!20200)))

(assert (=> b!617160 false))

(declare-fun b!617161 () Bool)

(declare-fun res!397639 () Bool)

(declare-fun e!353881 () Bool)

(assert (=> b!617161 (=> (not res!397639) (not e!353881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617161 (= res!397639 (validKeyInArray!0 k0!1786))))

(declare-fun b!617162 () Bool)

(assert (=> b!617162 false))

(declare-fun lt!284066 () array!37524)

(declare-fun lt!284081 () Unit!20196)

(declare-datatypes ((List!12088 0))(
  ( (Nil!12085) (Cons!12084 (h!13129 (_ BitVec 64)) (t!18307 List!12088)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37524 (_ BitVec 64) (_ BitVec 32) List!12088) Unit!20196)

(assert (=> b!617162 (= lt!284081 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284066 (select (arr!18008 a!2986) j!136) index!984 Nil!12085))))

(declare-fun arrayNoDuplicates!0 (array!37524 (_ BitVec 32) List!12088) Bool)

(assert (=> b!617162 (arrayNoDuplicates!0 lt!284066 index!984 Nil!12085)))

(declare-fun lt!284065 () Unit!20196)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37524 (_ BitVec 32) (_ BitVec 32)) Unit!20196)

(assert (=> b!617162 (= lt!284065 (lemmaNoDuplicateFromThenFromBigger!0 lt!284066 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617162 (arrayNoDuplicates!0 lt!284066 #b00000000000000000000000000000000 Nil!12085)))

(declare-fun lt!284074 () Unit!20196)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12088) Unit!20196)

(assert (=> b!617162 (= lt!284074 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12085))))

(declare-fun arrayContainsKey!0 (array!37524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617162 (arrayContainsKey!0 lt!284066 (select (arr!18008 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284082 () Unit!20196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20196)

(assert (=> b!617162 (= lt!284082 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284066 (select (arr!18008 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353877 () Bool)

(assert (=> b!617162 e!353877))

(declare-fun res!397626 () Bool)

(assert (=> b!617162 (=> (not res!397626) (not e!353877))))

(assert (=> b!617162 (= res!397626 (arrayContainsKey!0 lt!284066 (select (arr!18008 a!2986) j!136) j!136))))

(declare-fun e!353882 () Unit!20196)

(declare-fun Unit!20201 () Unit!20196)

(assert (=> b!617162 (= e!353882 Unit!20201)))

(declare-fun b!617163 () Bool)

(declare-fun res!397637 () Bool)

(assert (=> b!617163 (=> (not res!397637) (not e!353881))))

(assert (=> b!617163 (= res!397637 (validKeyInArray!0 (select (arr!18008 a!2986) j!136)))))

(declare-fun res!397632 () Bool)

(declare-fun b!617164 () Bool)

(assert (=> b!617164 (= res!397632 (arrayContainsKey!0 lt!284066 (select (arr!18008 a!2986) j!136) j!136))))

(declare-fun e!353883 () Bool)

(assert (=> b!617164 (=> (not res!397632) (not e!353883))))

(declare-fun e!353875 () Bool)

(assert (=> b!617164 (= e!353875 e!353883)))

(declare-fun b!617165 () Bool)

(declare-fun Unit!20202 () Unit!20196)

(assert (=> b!617165 (= e!353882 Unit!20202)))

(declare-fun b!617166 () Bool)

(assert (=> b!617166 (= e!353881 e!353878)))

(declare-fun res!397638 () Bool)

(assert (=> b!617166 (=> (not res!397638) (not e!353878))))

(declare-fun lt!284075 () SeekEntryResult!6445)

(assert (=> b!617166 (= res!397638 (or (= lt!284075 (MissingZero!6445 i!1108)) (= lt!284075 (MissingVacant!6445 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37524 (_ BitVec 32)) SeekEntryResult!6445)

(assert (=> b!617166 (= lt!284075 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617167 () Bool)

(assert (=> b!617167 (= e!353883 (arrayContainsKey!0 lt!284066 (select (arr!18008 a!2986) j!136) index!984))))

(declare-fun b!617168 () Bool)

(assert (=> b!617168 false))

(declare-fun lt!284067 () Unit!20196)

(assert (=> b!617168 (= lt!284067 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284066 (select (arr!18008 a!2986) j!136) j!136 Nil!12085))))

(assert (=> b!617168 (arrayNoDuplicates!0 lt!284066 j!136 Nil!12085)))

(declare-fun lt!284077 () Unit!20196)

(assert (=> b!617168 (= lt!284077 (lemmaNoDuplicateFromThenFromBigger!0 lt!284066 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617168 (arrayNoDuplicates!0 lt!284066 #b00000000000000000000000000000000 Nil!12085)))

(declare-fun lt!284073 () Unit!20196)

(assert (=> b!617168 (= lt!284073 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12085))))

(assert (=> b!617168 (arrayContainsKey!0 lt!284066 (select (arr!18008 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284064 () Unit!20196)

(assert (=> b!617168 (= lt!284064 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284066 (select (arr!18008 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20203 () Unit!20196)

(assert (=> b!617168 (= e!353879 Unit!20203)))

(declare-fun b!617169 () Bool)

(declare-fun res!397624 () Bool)

(assert (=> b!617169 (=> (not res!397624) (not e!353881))))

(assert (=> b!617169 (= res!397624 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617157 () Bool)

(assert (=> b!617157 (= e!353870 (not e!353874))))

(declare-fun res!397630 () Bool)

(assert (=> b!617157 (=> res!397630 e!353874)))

(declare-fun lt!284072 () SeekEntryResult!6445)

(assert (=> b!617157 (= res!397630 (not (= lt!284072 (MissingVacant!6445 vacantSpotIndex!68))))))

(declare-fun lt!284069 () Unit!20196)

(assert (=> b!617157 (= lt!284069 e!353873)))

(declare-fun c!70132 () Bool)

(assert (=> b!617157 (= c!70132 (= lt!284072 (Found!6445 index!984)))))

(declare-fun lt!284079 () Unit!20196)

(assert (=> b!617157 (= lt!284079 e!353876)))

(declare-fun c!70131 () Bool)

(assert (=> b!617157 (= c!70131 (= lt!284072 Undefined!6445))))

(declare-fun lt!284071 () (_ BitVec 64))

(assert (=> b!617157 (= lt!284072 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284071 lt!284066 mask!3053))))

(assert (=> b!617157 e!353872))

(declare-fun res!397634 () Bool)

(assert (=> b!617157 (=> (not res!397634) (not e!353872))))

(declare-fun lt!284080 () (_ BitVec 32))

(assert (=> b!617157 (= res!397634 (= lt!284068 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284080 vacantSpotIndex!68 lt!284071 lt!284066 mask!3053)))))

(assert (=> b!617157 (= lt!284068 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284080 vacantSpotIndex!68 (select (arr!18008 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617157 (= lt!284071 (select (store (arr!18008 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284070 () Unit!20196)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37524 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20196)

(assert (=> b!617157 (= lt!284070 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284080 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617157 (= lt!284080 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!397631 () Bool)

(assert (=> start!56040 (=> (not res!397631) (not e!353881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56040 (= res!397631 (validMask!0 mask!3053))))

(assert (=> start!56040 e!353881))

(assert (=> start!56040 true))

(declare-fun array_inv!13891 (array!37524) Bool)

(assert (=> start!56040 (array_inv!13891 a!2986)))

(declare-fun b!617170 () Bool)

(assert (=> b!617170 (= e!353877 (arrayContainsKey!0 lt!284066 (select (arr!18008 a!2986) j!136) index!984))))

(declare-fun b!617171 () Bool)

(declare-fun Unit!20204 () Unit!20196)

(assert (=> b!617171 (= e!353876 Unit!20204)))

(declare-fun b!617172 () Bool)

(assert (=> b!617172 (= e!353878 e!353880)))

(declare-fun res!397627 () Bool)

(assert (=> b!617172 (=> (not res!397627) (not e!353880))))

(assert (=> b!617172 (= res!397627 (= (select (store (arr!18008 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617172 (= lt!284066 (array!37525 (store (arr!18008 a!2986) i!1108 k0!1786) (size!18373 a!2986)))))

(declare-fun b!617173 () Bool)

(declare-fun res!397633 () Bool)

(assert (=> b!617173 (=> (not res!397633) (not e!353878))))

(assert (=> b!617173 (= res!397633 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12085))))

(declare-fun b!617174 () Bool)

(declare-fun res!397629 () Bool)

(assert (=> b!617174 (=> (not res!397629) (not e!353881))))

(assert (=> b!617174 (= res!397629 (and (= (size!18373 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18373 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18373 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617175 () Bool)

(declare-fun Unit!20205 () Unit!20196)

(assert (=> b!617175 (= e!353873 Unit!20205)))

(declare-fun res!397636 () Bool)

(assert (=> b!617175 (= res!397636 (= (select (store (arr!18008 a!2986) i!1108 k0!1786) index!984) (select (arr!18008 a!2986) j!136)))))

(declare-fun e!353869 () Bool)

(assert (=> b!617175 (=> (not res!397636) (not e!353869))))

(assert (=> b!617175 e!353869))

(declare-fun c!70134 () Bool)

(assert (=> b!617175 (= c!70134 (bvslt j!136 index!984))))

(declare-fun lt!284076 () Unit!20196)

(assert (=> b!617175 (= lt!284076 e!353879)))

(declare-fun c!70133 () Bool)

(assert (=> b!617175 (= c!70133 (bvslt index!984 j!136))))

(declare-fun lt!284083 () Unit!20196)

(assert (=> b!617175 (= lt!284083 e!353882)))

(assert (=> b!617175 false))

(declare-fun b!617176 () Bool)

(declare-fun res!397635 () Bool)

(assert (=> b!617176 (= res!397635 (bvsge j!136 index!984))))

(assert (=> b!617176 (=> res!397635 e!353875)))

(assert (=> b!617176 (= e!353869 e!353875)))

(assert (= (and start!56040 res!397631) b!617174))

(assert (= (and b!617174 res!397629) b!617163))

(assert (= (and b!617163 res!397637) b!617161))

(assert (= (and b!617161 res!397639) b!617169))

(assert (= (and b!617169 res!397624) b!617166))

(assert (= (and b!617166 res!397638) b!617152))

(assert (= (and b!617152 res!397640) b!617173))

(assert (= (and b!617173 res!397633) b!617156))

(assert (= (and b!617156 res!397628) b!617172))

(assert (= (and b!617172 res!397627) b!617153))

(assert (= (and b!617153 res!397625) b!617157))

(assert (= (and b!617157 res!397634) b!617155))

(assert (= (and b!617157 c!70131) b!617160))

(assert (= (and b!617157 (not c!70131)) b!617171))

(assert (= (and b!617157 c!70132) b!617175))

(assert (= (and b!617157 (not c!70132)) b!617159))

(assert (= (and b!617175 res!397636) b!617176))

(assert (= (and b!617176 (not res!397635)) b!617164))

(assert (= (and b!617164 res!397632) b!617167))

(assert (= (and b!617175 c!70134) b!617168))

(assert (= (and b!617175 (not c!70134)) b!617158))

(assert (= (and b!617175 c!70133) b!617162))

(assert (= (and b!617175 (not c!70133)) b!617165))

(assert (= (and b!617162 res!397626) b!617170))

(assert (= (and b!617157 (not res!397630)) b!617154))

(declare-fun m!592759 () Bool)

(assert (=> b!617170 m!592759))

(assert (=> b!617170 m!592759))

(declare-fun m!592761 () Bool)

(assert (=> b!617170 m!592761))

(declare-fun m!592763 () Bool)

(assert (=> b!617153 m!592763))

(assert (=> b!617153 m!592759))

(assert (=> b!617153 m!592759))

(declare-fun m!592765 () Bool)

(assert (=> b!617153 m!592765))

(declare-fun m!592767 () Bool)

(assert (=> b!617162 m!592767))

(assert (=> b!617162 m!592759))

(declare-fun m!592769 () Bool)

(assert (=> b!617162 m!592769))

(declare-fun m!592771 () Bool)

(assert (=> b!617162 m!592771))

(declare-fun m!592773 () Bool)

(assert (=> b!617162 m!592773))

(declare-fun m!592775 () Bool)

(assert (=> b!617162 m!592775))

(assert (=> b!617162 m!592759))

(assert (=> b!617162 m!592759))

(declare-fun m!592777 () Bool)

(assert (=> b!617162 m!592777))

(assert (=> b!617162 m!592759))

(declare-fun m!592779 () Bool)

(assert (=> b!617162 m!592779))

(assert (=> b!617162 m!592759))

(declare-fun m!592781 () Bool)

(assert (=> b!617162 m!592781))

(declare-fun m!592783 () Bool)

(assert (=> b!617154 m!592783))

(declare-fun m!592785 () Bool)

(assert (=> b!617154 m!592785))

(declare-fun m!592787 () Bool)

(assert (=> b!617157 m!592787))

(declare-fun m!592789 () Bool)

(assert (=> b!617157 m!592789))

(declare-fun m!592791 () Bool)

(assert (=> b!617157 m!592791))

(assert (=> b!617157 m!592759))

(assert (=> b!617157 m!592783))

(declare-fun m!592793 () Bool)

(assert (=> b!617157 m!592793))

(assert (=> b!617157 m!592759))

(declare-fun m!592795 () Bool)

(assert (=> b!617157 m!592795))

(declare-fun m!592797 () Bool)

(assert (=> b!617157 m!592797))

(declare-fun m!592799 () Bool)

(assert (=> b!617166 m!592799))

(declare-fun m!592801 () Bool)

(assert (=> b!617173 m!592801))

(declare-fun m!592803 () Bool)

(assert (=> b!617152 m!592803))

(declare-fun m!592805 () Bool)

(assert (=> b!617169 m!592805))

(assert (=> b!617163 m!592759))

(assert (=> b!617163 m!592759))

(declare-fun m!592807 () Bool)

(assert (=> b!617163 m!592807))

(assert (=> b!617164 m!592759))

(assert (=> b!617164 m!592759))

(assert (=> b!617164 m!592779))

(assert (=> b!617175 m!592783))

(assert (=> b!617175 m!592785))

(assert (=> b!617175 m!592759))

(assert (=> b!617168 m!592759))

(declare-fun m!592809 () Bool)

(assert (=> b!617168 m!592809))

(declare-fun m!592811 () Bool)

(assert (=> b!617168 m!592811))

(assert (=> b!617168 m!592759))

(assert (=> b!617168 m!592759))

(declare-fun m!592813 () Bool)

(assert (=> b!617168 m!592813))

(declare-fun m!592815 () Bool)

(assert (=> b!617168 m!592815))

(assert (=> b!617168 m!592771))

(assert (=> b!617168 m!592759))

(declare-fun m!592817 () Bool)

(assert (=> b!617168 m!592817))

(assert (=> b!617168 m!592775))

(assert (=> b!617167 m!592759))

(assert (=> b!617167 m!592759))

(assert (=> b!617167 m!592761))

(declare-fun m!592819 () Bool)

(assert (=> b!617156 m!592819))

(declare-fun m!592821 () Bool)

(assert (=> start!56040 m!592821))

(declare-fun m!592823 () Bool)

(assert (=> start!56040 m!592823))

(assert (=> b!617172 m!592783))

(declare-fun m!592825 () Bool)

(assert (=> b!617172 m!592825))

(declare-fun m!592827 () Bool)

(assert (=> b!617161 m!592827))

(check-sat (not b!617169) (not b!617173) (not b!617163) (not b!617170) (not b!617157) (not b!617152) (not b!617167) (not b!617166) (not b!617162) (not start!56040) (not b!617164) (not b!617161) (not b!617153) (not b!617168))
(check-sat)
