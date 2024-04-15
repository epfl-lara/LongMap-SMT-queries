; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56094 () Bool)

(assert start!56094)

(declare-datatypes ((array!37578 0))(
  ( (array!37579 (arr!18035 (Array (_ BitVec 32) (_ BitVec 64))) (size!18400 (_ BitVec 32))) )
))
(declare-fun lt!285690 () array!37578)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!619177 () Bool)

(declare-fun e!355085 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37578)

(declare-fun arrayContainsKey!0 (array!37578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619177 (= e!355085 (arrayContainsKey!0 lt!285690 (select (arr!18035 a!2986) j!136) index!984))))

(declare-fun b!619179 () Bool)

(declare-fun e!355092 () Bool)

(declare-fun e!355093 () Bool)

(assert (=> b!619179 (= e!355092 e!355093)))

(declare-fun res!399016 () Bool)

(assert (=> b!619179 (=> (not res!399016) (not e!355093))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619179 (= res!399016 (= (select (store (arr!18035 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619179 (= lt!285690 (array!37579 (store (arr!18035 a!2986) i!1108 k0!1786) (size!18400 a!2986)))))

(declare-fun b!619180 () Bool)

(declare-fun res!399009 () Bool)

(assert (=> b!619180 (= res!399009 (arrayContainsKey!0 lt!285690 (select (arr!18035 a!2986) j!136) j!136))))

(declare-fun e!355096 () Bool)

(assert (=> b!619180 (=> (not res!399009) (not e!355096))))

(declare-fun e!355091 () Bool)

(assert (=> b!619180 (= e!355091 e!355096)))

(declare-fun b!619181 () Bool)

(declare-datatypes ((Unit!20466 0))(
  ( (Unit!20467) )
))
(declare-fun e!355084 () Unit!20466)

(declare-fun Unit!20468 () Unit!20466)

(assert (=> b!619181 (= e!355084 Unit!20468)))

(declare-fun b!619182 () Bool)

(declare-fun res!399001 () Bool)

(declare-fun e!355095 () Bool)

(assert (=> b!619182 (=> (not res!399001) (not e!355095))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!619182 (= res!399001 (and (= (size!18400 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18400 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18400 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619183 () Bool)

(assert (=> b!619183 (= e!355095 e!355092)))

(declare-fun res!399008 () Bool)

(assert (=> b!619183 (=> (not res!399008) (not e!355092))))

(declare-datatypes ((SeekEntryResult!6472 0))(
  ( (MissingZero!6472 (index!28172 (_ BitVec 32))) (Found!6472 (index!28173 (_ BitVec 32))) (Intermediate!6472 (undefined!7284 Bool) (index!28174 (_ BitVec 32)) (x!56963 (_ BitVec 32))) (Undefined!6472) (MissingVacant!6472 (index!28175 (_ BitVec 32))) )
))
(declare-fun lt!285691 () SeekEntryResult!6472)

(assert (=> b!619183 (= res!399008 (or (= lt!285691 (MissingZero!6472 i!1108)) (= lt!285691 (MissingVacant!6472 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37578 (_ BitVec 32)) SeekEntryResult!6472)

(assert (=> b!619183 (= lt!285691 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619184 () Bool)

(declare-fun res!399014 () Bool)

(assert (=> b!619184 (= res!399014 (bvsge j!136 index!984))))

(assert (=> b!619184 (=> res!399014 e!355091)))

(declare-fun e!355098 () Bool)

(assert (=> b!619184 (= e!355098 e!355091)))

(declare-fun b!619185 () Bool)

(declare-fun res!399002 () Bool)

(assert (=> b!619185 (=> (not res!399002) (not e!355095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619185 (= res!399002 (validKeyInArray!0 k0!1786))))

(declare-fun b!619186 () Bool)

(declare-fun res!399006 () Bool)

(assert (=> b!619186 (=> (not res!399006) (not e!355092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37578 (_ BitVec 32)) Bool)

(assert (=> b!619186 (= res!399006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619187 () Bool)

(declare-fun e!355090 () Bool)

(assert (=> b!619187 (= e!355093 e!355090)))

(declare-fun res!399003 () Bool)

(assert (=> b!619187 (=> (not res!399003) (not e!355090))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!285686 () SeekEntryResult!6472)

(assert (=> b!619187 (= res!399003 (and (= lt!285686 (Found!6472 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18035 a!2986) index!984) (select (arr!18035 a!2986) j!136))) (not (= (select (arr!18035 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37578 (_ BitVec 32)) SeekEntryResult!6472)

(assert (=> b!619187 (= lt!285686 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18035 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619188 () Bool)

(declare-fun res!399005 () Bool)

(assert (=> b!619188 (=> (not res!399005) (not e!355095))))

(assert (=> b!619188 (= res!399005 (validKeyInArray!0 (select (arr!18035 a!2986) j!136)))))

(declare-fun b!619189 () Bool)

(declare-fun e!355087 () Bool)

(declare-fun lt!285701 () SeekEntryResult!6472)

(assert (=> b!619189 (= e!355087 (= lt!285686 lt!285701))))

(declare-fun b!619190 () Bool)

(declare-fun e!355086 () Bool)

(assert (=> b!619190 (= e!355090 (not e!355086))))

(declare-fun res!399007 () Bool)

(assert (=> b!619190 (=> res!399007 e!355086)))

(declare-fun lt!285696 () SeekEntryResult!6472)

(assert (=> b!619190 (= res!399007 (not (= lt!285696 (MissingVacant!6472 vacantSpotIndex!68))))))

(declare-fun lt!285700 () Unit!20466)

(declare-fun e!355094 () Unit!20466)

(assert (=> b!619190 (= lt!285700 e!355094)))

(declare-fun c!70458 () Bool)

(assert (=> b!619190 (= c!70458 (= lt!285696 (Found!6472 index!984)))))

(declare-fun lt!285687 () Unit!20466)

(declare-fun e!355088 () Unit!20466)

(assert (=> b!619190 (= lt!285687 e!355088)))

(declare-fun c!70455 () Bool)

(assert (=> b!619190 (= c!70455 (= lt!285696 Undefined!6472))))

(declare-fun lt!285685 () (_ BitVec 64))

(assert (=> b!619190 (= lt!285696 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285685 lt!285690 mask!3053))))

(assert (=> b!619190 e!355087))

(declare-fun res!399015 () Bool)

(assert (=> b!619190 (=> (not res!399015) (not e!355087))))

(declare-fun lt!285702 () (_ BitVec 32))

(assert (=> b!619190 (= res!399015 (= lt!285701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285702 vacantSpotIndex!68 lt!285685 lt!285690 mask!3053)))))

(assert (=> b!619190 (= lt!285701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285702 vacantSpotIndex!68 (select (arr!18035 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619190 (= lt!285685 (select (store (arr!18035 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285689 () Unit!20466)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37578 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20466)

(assert (=> b!619190 (= lt!285689 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285702 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619190 (= lt!285702 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619191 () Bool)

(assert (=> b!619191 false))

(declare-fun lt!285693 () Unit!20466)

(declare-datatypes ((List!12115 0))(
  ( (Nil!12112) (Cons!12111 (h!13156 (_ BitVec 64)) (t!18334 List!12115)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37578 (_ BitVec 64) (_ BitVec 32) List!12115) Unit!20466)

(assert (=> b!619191 (= lt!285693 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285690 (select (arr!18035 a!2986) j!136) index!984 Nil!12112))))

(declare-fun arrayNoDuplicates!0 (array!37578 (_ BitVec 32) List!12115) Bool)

(assert (=> b!619191 (arrayNoDuplicates!0 lt!285690 index!984 Nil!12112)))

(declare-fun lt!285692 () Unit!20466)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37578 (_ BitVec 32) (_ BitVec 32)) Unit!20466)

(assert (=> b!619191 (= lt!285692 (lemmaNoDuplicateFromThenFromBigger!0 lt!285690 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619191 (arrayNoDuplicates!0 lt!285690 #b00000000000000000000000000000000 Nil!12112)))

(declare-fun lt!285688 () Unit!20466)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37578 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12115) Unit!20466)

(assert (=> b!619191 (= lt!285688 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12112))))

(assert (=> b!619191 (arrayContainsKey!0 lt!285690 (select (arr!18035 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285695 () Unit!20466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37578 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20466)

(assert (=> b!619191 (= lt!285695 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285690 (select (arr!18035 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619191 e!355085))

(declare-fun res!399012 () Bool)

(assert (=> b!619191 (=> (not res!399012) (not e!355085))))

(assert (=> b!619191 (= res!399012 (arrayContainsKey!0 lt!285690 (select (arr!18035 a!2986) j!136) j!136))))

(declare-fun Unit!20469 () Unit!20466)

(assert (=> b!619191 (= e!355084 Unit!20469)))

(declare-fun res!399010 () Bool)

(assert (=> start!56094 (=> (not res!399010) (not e!355095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56094 (= res!399010 (validMask!0 mask!3053))))

(assert (=> start!56094 e!355095))

(assert (=> start!56094 true))

(declare-fun array_inv!13918 (array!37578) Bool)

(assert (=> start!56094 (array_inv!13918 a!2986)))

(declare-fun b!619178 () Bool)

(declare-fun res!399011 () Bool)

(assert (=> b!619178 (=> (not res!399011) (not e!355095))))

(assert (=> b!619178 (= res!399011 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619192 () Bool)

(assert (=> b!619192 (= e!355086 true)))

(assert (=> b!619192 (= (select (store (arr!18035 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619193 () Bool)

(declare-fun Unit!20470 () Unit!20466)

(assert (=> b!619193 (= e!355088 Unit!20470)))

(declare-fun b!619194 () Bool)

(declare-fun res!399013 () Bool)

(assert (=> b!619194 (=> (not res!399013) (not e!355092))))

(assert (=> b!619194 (= res!399013 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18035 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619195 () Bool)

(declare-fun res!399017 () Bool)

(assert (=> b!619195 (=> (not res!399017) (not e!355092))))

(assert (=> b!619195 (= res!399017 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12112))))

(declare-fun b!619196 () Bool)

(assert (=> b!619196 false))

(declare-fun lt!285697 () Unit!20466)

(assert (=> b!619196 (= lt!285697 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285690 (select (arr!18035 a!2986) j!136) j!136 Nil!12112))))

(assert (=> b!619196 (arrayNoDuplicates!0 lt!285690 j!136 Nil!12112)))

(declare-fun lt!285703 () Unit!20466)

(assert (=> b!619196 (= lt!285703 (lemmaNoDuplicateFromThenFromBigger!0 lt!285690 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619196 (arrayNoDuplicates!0 lt!285690 #b00000000000000000000000000000000 Nil!12112)))

(declare-fun lt!285698 () Unit!20466)

(assert (=> b!619196 (= lt!285698 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12112))))

(assert (=> b!619196 (arrayContainsKey!0 lt!285690 (select (arr!18035 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285694 () Unit!20466)

(assert (=> b!619196 (= lt!285694 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285690 (select (arr!18035 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355089 () Unit!20466)

(declare-fun Unit!20471 () Unit!20466)

(assert (=> b!619196 (= e!355089 Unit!20471)))

(declare-fun b!619197 () Bool)

(declare-fun Unit!20472 () Unit!20466)

(assert (=> b!619197 (= e!355094 Unit!20472)))

(declare-fun res!399004 () Bool)

(assert (=> b!619197 (= res!399004 (= (select (store (arr!18035 a!2986) i!1108 k0!1786) index!984) (select (arr!18035 a!2986) j!136)))))

(assert (=> b!619197 (=> (not res!399004) (not e!355098))))

(assert (=> b!619197 e!355098))

(declare-fun c!70457 () Bool)

(assert (=> b!619197 (= c!70457 (bvslt j!136 index!984))))

(declare-fun lt!285699 () Unit!20466)

(assert (=> b!619197 (= lt!285699 e!355089)))

(declare-fun c!70456 () Bool)

(assert (=> b!619197 (= c!70456 (bvslt index!984 j!136))))

(declare-fun lt!285684 () Unit!20466)

(assert (=> b!619197 (= lt!285684 e!355084)))

(assert (=> b!619197 false))

(declare-fun b!619198 () Bool)

(declare-fun Unit!20473 () Unit!20466)

(assert (=> b!619198 (= e!355088 Unit!20473)))

(assert (=> b!619198 false))

(declare-fun b!619199 () Bool)

(declare-fun Unit!20474 () Unit!20466)

(assert (=> b!619199 (= e!355089 Unit!20474)))

(declare-fun b!619200 () Bool)

(declare-fun Unit!20475 () Unit!20466)

(assert (=> b!619200 (= e!355094 Unit!20475)))

(declare-fun b!619201 () Bool)

(assert (=> b!619201 (= e!355096 (arrayContainsKey!0 lt!285690 (select (arr!18035 a!2986) j!136) index!984))))

(assert (= (and start!56094 res!399010) b!619182))

(assert (= (and b!619182 res!399001) b!619188))

(assert (= (and b!619188 res!399005) b!619185))

(assert (= (and b!619185 res!399002) b!619178))

(assert (= (and b!619178 res!399011) b!619183))

(assert (= (and b!619183 res!399008) b!619186))

(assert (= (and b!619186 res!399006) b!619195))

(assert (= (and b!619195 res!399017) b!619194))

(assert (= (and b!619194 res!399013) b!619179))

(assert (= (and b!619179 res!399016) b!619187))

(assert (= (and b!619187 res!399003) b!619190))

(assert (= (and b!619190 res!399015) b!619189))

(assert (= (and b!619190 c!70455) b!619198))

(assert (= (and b!619190 (not c!70455)) b!619193))

(assert (= (and b!619190 c!70458) b!619197))

(assert (= (and b!619190 (not c!70458)) b!619200))

(assert (= (and b!619197 res!399004) b!619184))

(assert (= (and b!619184 (not res!399014)) b!619180))

(assert (= (and b!619180 res!399009) b!619201))

(assert (= (and b!619197 c!70457) b!619196))

(assert (= (and b!619197 (not c!70457)) b!619199))

(assert (= (and b!619197 c!70456) b!619191))

(assert (= (and b!619197 (not c!70456)) b!619181))

(assert (= (and b!619191 res!399012) b!619177))

(assert (= (and b!619190 (not res!399007)) b!619192))

(declare-fun m!594649 () Bool)

(assert (=> b!619178 m!594649))

(declare-fun m!594651 () Bool)

(assert (=> b!619195 m!594651))

(declare-fun m!594653 () Bool)

(assert (=> b!619192 m!594653))

(declare-fun m!594655 () Bool)

(assert (=> b!619192 m!594655))

(declare-fun m!594657 () Bool)

(assert (=> b!619183 m!594657))

(declare-fun m!594659 () Bool)

(assert (=> b!619194 m!594659))

(declare-fun m!594661 () Bool)

(assert (=> b!619186 m!594661))

(declare-fun m!594663 () Bool)

(assert (=> b!619188 m!594663))

(assert (=> b!619188 m!594663))

(declare-fun m!594665 () Bool)

(assert (=> b!619188 m!594665))

(declare-fun m!594667 () Bool)

(assert (=> b!619185 m!594667))

(assert (=> b!619201 m!594663))

(assert (=> b!619201 m!594663))

(declare-fun m!594669 () Bool)

(assert (=> b!619201 m!594669))

(assert (=> b!619180 m!594663))

(assert (=> b!619180 m!594663))

(declare-fun m!594671 () Bool)

(assert (=> b!619180 m!594671))

(declare-fun m!594673 () Bool)

(assert (=> b!619190 m!594673))

(declare-fun m!594675 () Bool)

(assert (=> b!619190 m!594675))

(assert (=> b!619190 m!594653))

(declare-fun m!594677 () Bool)

(assert (=> b!619190 m!594677))

(assert (=> b!619190 m!594663))

(declare-fun m!594679 () Bool)

(assert (=> b!619190 m!594679))

(declare-fun m!594681 () Bool)

(assert (=> b!619190 m!594681))

(declare-fun m!594683 () Bool)

(assert (=> b!619190 m!594683))

(assert (=> b!619190 m!594663))

(assert (=> b!619179 m!594653))

(declare-fun m!594685 () Bool)

(assert (=> b!619179 m!594685))

(declare-fun m!594687 () Bool)

(assert (=> b!619191 m!594687))

(assert (=> b!619191 m!594663))

(assert (=> b!619191 m!594671))

(declare-fun m!594689 () Bool)

(assert (=> b!619191 m!594689))

(declare-fun m!594691 () Bool)

(assert (=> b!619191 m!594691))

(assert (=> b!619191 m!594663))

(declare-fun m!594693 () Bool)

(assert (=> b!619191 m!594693))

(assert (=> b!619191 m!594663))

(declare-fun m!594695 () Bool)

(assert (=> b!619191 m!594695))

(declare-fun m!594697 () Bool)

(assert (=> b!619191 m!594697))

(assert (=> b!619191 m!594663))

(assert (=> b!619191 m!594663))

(declare-fun m!594699 () Bool)

(assert (=> b!619191 m!594699))

(assert (=> b!619197 m!594653))

(assert (=> b!619197 m!594655))

(assert (=> b!619197 m!594663))

(assert (=> b!619177 m!594663))

(assert (=> b!619177 m!594663))

(assert (=> b!619177 m!594669))

(declare-fun m!594701 () Bool)

(assert (=> b!619187 m!594701))

(assert (=> b!619187 m!594663))

(assert (=> b!619187 m!594663))

(declare-fun m!594703 () Bool)

(assert (=> b!619187 m!594703))

(assert (=> b!619196 m!594687))

(assert (=> b!619196 m!594663))

(declare-fun m!594705 () Bool)

(assert (=> b!619196 m!594705))

(declare-fun m!594707 () Bool)

(assert (=> b!619196 m!594707))

(assert (=> b!619196 m!594663))

(declare-fun m!594709 () Bool)

(assert (=> b!619196 m!594709))

(assert (=> b!619196 m!594663))

(declare-fun m!594711 () Bool)

(assert (=> b!619196 m!594711))

(assert (=> b!619196 m!594663))

(declare-fun m!594713 () Bool)

(assert (=> b!619196 m!594713))

(assert (=> b!619196 m!594697))

(declare-fun m!594715 () Bool)

(assert (=> start!56094 m!594715))

(declare-fun m!594717 () Bool)

(assert (=> start!56094 m!594717))

(check-sat (not b!619187) (not b!619188) (not b!619183) (not b!619190) (not b!619186) (not b!619177) (not b!619201) (not b!619195) (not b!619196) (not b!619178) (not b!619185) (not b!619191) (not start!56094) (not b!619180))
(check-sat)
