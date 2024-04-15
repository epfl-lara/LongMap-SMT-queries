; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55554 () Bool)

(assert start!55554)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!348181 () Bool)

(declare-datatypes ((array!37299 0))(
  ( (array!37300 (arr!17900 (Array (_ BitVec 32) (_ BitVec 64))) (size!18265 (_ BitVec 32))) )
))
(declare-fun lt!277620 () array!37299)

(declare-fun b!607997 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37299)

(declare-fun arrayContainsKey!0 (array!37299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607997 (= e!348181 (arrayContainsKey!0 lt!277620 (select (arr!17900 a!2986) j!136) index!984))))

(declare-fun b!607998 () Bool)

(declare-fun res!390853 () Bool)

(declare-fun e!348172 () Bool)

(assert (=> b!607998 (=> res!390853 e!348172)))

(declare-datatypes ((List!11980 0))(
  ( (Nil!11977) (Cons!11976 (h!13021 (_ BitVec 64)) (t!18199 List!11980)) )
))
(declare-fun contains!3002 (List!11980 (_ BitVec 64)) Bool)

(assert (=> b!607998 (= res!390853 (contains!3002 Nil!11977 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607999 () Bool)

(declare-fun res!390839 () Bool)

(declare-fun e!348171 () Bool)

(assert (=> b!607999 (=> (not res!390839) (not e!348171))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607999 (= res!390839 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17900 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608000 () Bool)

(declare-datatypes ((Unit!19404 0))(
  ( (Unit!19405) )
))
(declare-fun e!348176 () Unit!19404)

(declare-fun Unit!19406 () Unit!19404)

(assert (=> b!608000 (= e!348176 Unit!19406)))

(assert (=> b!608000 false))

(declare-fun b!608001 () Bool)

(declare-fun e!348175 () Bool)

(declare-fun e!348174 () Bool)

(assert (=> b!608001 (= e!348175 e!348174)))

(declare-fun res!390843 () Bool)

(assert (=> b!608001 (=> (not res!390843) (not e!348174))))

(assert (=> b!608001 (= res!390843 (arrayContainsKey!0 lt!277620 (select (arr!17900 a!2986) j!136) j!136))))

(declare-fun b!608002 () Bool)

(declare-fun e!348169 () Bool)

(declare-fun e!348170 () Bool)

(assert (=> b!608002 (= e!348169 e!348170)))

(declare-fun res!390844 () Bool)

(assert (=> b!608002 (=> res!390844 e!348170)))

(declare-fun lt!277611 () (_ BitVec 64))

(declare-fun lt!277615 () (_ BitVec 64))

(assert (=> b!608002 (= res!390844 (or (not (= (select (arr!17900 a!2986) j!136) lt!277615)) (not (= (select (arr!17900 a!2986) j!136) lt!277611))))))

(declare-fun e!348183 () Bool)

(assert (=> b!608002 e!348183))

(declare-fun res!390851 () Bool)

(assert (=> b!608002 (=> (not res!390851) (not e!348183))))

(assert (=> b!608002 (= res!390851 (= lt!277611 (select (arr!17900 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!608002 (= lt!277611 (select (store (arr!17900 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608003 () Bool)

(declare-fun res!390835 () Bool)

(assert (=> b!608003 (=> res!390835 e!348172)))

(declare-fun noDuplicate!329 (List!11980) Bool)

(assert (=> b!608003 (= res!390835 (not (noDuplicate!329 Nil!11977)))))

(declare-fun b!608004 () Bool)

(declare-fun Unit!19407 () Unit!19404)

(assert (=> b!608004 (= e!348176 Unit!19407)))

(declare-fun b!608005 () Bool)

(declare-fun e!348180 () Bool)

(declare-fun e!348168 () Bool)

(assert (=> b!608005 (= e!348180 e!348168)))

(declare-fun res!390854 () Bool)

(assert (=> b!608005 (=> (not res!390854) (not e!348168))))

(declare-datatypes ((SeekEntryResult!6337 0))(
  ( (MissingZero!6337 (index!27623 (_ BitVec 32))) (Found!6337 (index!27624 (_ BitVec 32))) (Intermediate!6337 (undefined!7149 Bool) (index!27625 (_ BitVec 32)) (x!56441 (_ BitVec 32))) (Undefined!6337) (MissingVacant!6337 (index!27626 (_ BitVec 32))) )
))
(declare-fun lt!277625 () SeekEntryResult!6337)

(assert (=> b!608005 (= res!390854 (and (= lt!277625 (Found!6337 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17900 a!2986) index!984) (select (arr!17900 a!2986) j!136))) (not (= (select (arr!17900 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37299 (_ BitVec 32)) SeekEntryResult!6337)

(assert (=> b!608005 (= lt!277625 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17900 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608006 () Bool)

(declare-fun res!390850 () Bool)

(declare-fun e!348173 () Bool)

(assert (=> b!608006 (=> (not res!390850) (not e!348173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608006 (= res!390850 (validKeyInArray!0 k0!1786))))

(declare-fun b!608007 () Bool)

(declare-fun res!390855 () Bool)

(assert (=> b!608007 (=> (not res!390855) (not e!348173))))

(assert (=> b!608007 (= res!390855 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608008 () Bool)

(assert (=> b!608008 (= e!348173 e!348171)))

(declare-fun res!390845 () Bool)

(assert (=> b!608008 (=> (not res!390845) (not e!348171))))

(declare-fun lt!277618 () SeekEntryResult!6337)

(assert (=> b!608008 (= res!390845 (or (= lt!277618 (MissingZero!6337 i!1108)) (= lt!277618 (MissingVacant!6337 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37299 (_ BitVec 32)) SeekEntryResult!6337)

(assert (=> b!608008 (= lt!277618 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608009 () Bool)

(declare-fun res!390841 () Bool)

(assert (=> b!608009 (=> (not res!390841) (not e!348173))))

(assert (=> b!608009 (= res!390841 (and (= (size!18265 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18265 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18265 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!390848 () Bool)

(assert (=> start!55554 (=> (not res!390848) (not e!348173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55554 (= res!390848 (validMask!0 mask!3053))))

(assert (=> start!55554 e!348173))

(assert (=> start!55554 true))

(declare-fun array_inv!13783 (array!37299) Bool)

(assert (=> start!55554 (array_inv!13783 a!2986)))

(declare-fun b!608010 () Bool)

(assert (=> b!608010 (= e!348183 e!348175)))

(declare-fun res!390840 () Bool)

(assert (=> b!608010 (=> res!390840 e!348175)))

(assert (=> b!608010 (= res!390840 (or (not (= (select (arr!17900 a!2986) j!136) lt!277615)) (not (= (select (arr!17900 a!2986) j!136) lt!277611)) (bvsge j!136 index!984)))))

(declare-fun b!608011 () Bool)

(declare-fun res!390852 () Bool)

(assert (=> b!608011 (=> (not res!390852) (not e!348171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37299 (_ BitVec 32)) Bool)

(assert (=> b!608011 (= res!390852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608012 () Bool)

(declare-fun e!348179 () Unit!19404)

(declare-fun Unit!19408 () Unit!19404)

(assert (=> b!608012 (= e!348179 Unit!19408)))

(declare-fun lt!277616 () Unit!19404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19404)

(assert (=> b!608012 (= lt!277616 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277620 (select (arr!17900 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608012 (arrayContainsKey!0 lt!277620 (select (arr!17900 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277619 () Unit!19404)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11980) Unit!19404)

(assert (=> b!608012 (= lt!277619 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11977))))

(declare-fun arrayNoDuplicates!0 (array!37299 (_ BitVec 32) List!11980) Bool)

(assert (=> b!608012 (arrayNoDuplicates!0 lt!277620 #b00000000000000000000000000000000 Nil!11977)))

(declare-fun lt!277627 () Unit!19404)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37299 (_ BitVec 32) (_ BitVec 32)) Unit!19404)

(assert (=> b!608012 (= lt!277627 (lemmaNoDuplicateFromThenFromBigger!0 lt!277620 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608012 (arrayNoDuplicates!0 lt!277620 j!136 Nil!11977)))

(declare-fun lt!277614 () Unit!19404)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37299 (_ BitVec 64) (_ BitVec 32) List!11980) Unit!19404)

(assert (=> b!608012 (= lt!277614 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277620 (select (arr!17900 a!2986) j!136) j!136 Nil!11977))))

(assert (=> b!608012 false))

(declare-fun b!608013 () Bool)

(declare-fun e!348177 () Bool)

(assert (=> b!608013 (= e!348170 e!348177)))

(declare-fun res!390849 () Bool)

(assert (=> b!608013 (=> res!390849 e!348177)))

(assert (=> b!608013 (= res!390849 (bvsge index!984 j!136))))

(declare-fun lt!277624 () Unit!19404)

(assert (=> b!608013 (= lt!277624 e!348179)))

(declare-fun c!68948 () Bool)

(assert (=> b!608013 (= c!68948 (bvslt j!136 index!984))))

(declare-fun b!608014 () Bool)

(assert (=> b!608014 (= e!348168 (not e!348169))))

(declare-fun res!390836 () Bool)

(assert (=> b!608014 (=> res!390836 e!348169)))

(declare-fun lt!277613 () SeekEntryResult!6337)

(assert (=> b!608014 (= res!390836 (not (= lt!277613 (Found!6337 index!984))))))

(declare-fun lt!277617 () Unit!19404)

(assert (=> b!608014 (= lt!277617 e!348176)))

(declare-fun c!68949 () Bool)

(assert (=> b!608014 (= c!68949 (= lt!277613 Undefined!6337))))

(assert (=> b!608014 (= lt!277613 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277615 lt!277620 mask!3053))))

(declare-fun e!348182 () Bool)

(assert (=> b!608014 e!348182))

(declare-fun res!390837 () Bool)

(assert (=> b!608014 (=> (not res!390837) (not e!348182))))

(declare-fun lt!277612 () (_ BitVec 32))

(declare-fun lt!277621 () SeekEntryResult!6337)

(assert (=> b!608014 (= res!390837 (= lt!277621 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277612 vacantSpotIndex!68 lt!277615 lt!277620 mask!3053)))))

(assert (=> b!608014 (= lt!277621 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277612 vacantSpotIndex!68 (select (arr!17900 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608014 (= lt!277615 (select (store (arr!17900 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277622 () Unit!19404)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19404)

(assert (=> b!608014 (= lt!277622 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277612 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608014 (= lt!277612 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608015 () Bool)

(assert (=> b!608015 (= e!348182 (= lt!277625 lt!277621))))

(declare-fun b!608016 () Bool)

(assert (=> b!608016 (= e!348172 true)))

(declare-fun lt!277623 () Bool)

(assert (=> b!608016 (= lt!277623 (contains!3002 Nil!11977 k0!1786))))

(declare-fun b!608017 () Bool)

(assert (=> b!608017 (= e!348174 (arrayContainsKey!0 lt!277620 (select (arr!17900 a!2986) j!136) index!984))))

(declare-fun b!608018 () Bool)

(assert (=> b!608018 (= e!348171 e!348180)))

(declare-fun res!390846 () Bool)

(assert (=> b!608018 (=> (not res!390846) (not e!348180))))

(assert (=> b!608018 (= res!390846 (= (select (store (arr!17900 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608018 (= lt!277620 (array!37300 (store (arr!17900 a!2986) i!1108 k0!1786) (size!18265 a!2986)))))

(declare-fun b!608019 () Bool)

(assert (=> b!608019 (= e!348177 e!348172)))

(declare-fun res!390847 () Bool)

(assert (=> b!608019 (=> res!390847 e!348172)))

(assert (=> b!608019 (= res!390847 (or (bvsge (size!18265 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18265 a!2986))))))

(assert (=> b!608019 (arrayContainsKey!0 lt!277620 (select (arr!17900 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277626 () Unit!19404)

(assert (=> b!608019 (= lt!277626 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277620 (select (arr!17900 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608019 e!348181))

(declare-fun res!390857 () Bool)

(assert (=> b!608019 (=> (not res!390857) (not e!348181))))

(assert (=> b!608019 (= res!390857 (arrayContainsKey!0 lt!277620 (select (arr!17900 a!2986) j!136) j!136))))

(declare-fun b!608020 () Bool)

(declare-fun res!390856 () Bool)

(assert (=> b!608020 (=> (not res!390856) (not e!348173))))

(assert (=> b!608020 (= res!390856 (validKeyInArray!0 (select (arr!17900 a!2986) j!136)))))

(declare-fun b!608021 () Bool)

(declare-fun Unit!19409 () Unit!19404)

(assert (=> b!608021 (= e!348179 Unit!19409)))

(declare-fun b!608022 () Bool)

(declare-fun res!390838 () Bool)

(assert (=> b!608022 (=> res!390838 e!348172)))

(assert (=> b!608022 (= res!390838 (contains!3002 Nil!11977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608023 () Bool)

(declare-fun res!390842 () Bool)

(assert (=> b!608023 (=> (not res!390842) (not e!348171))))

(assert (=> b!608023 (= res!390842 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11977))))

(assert (= (and start!55554 res!390848) b!608009))

(assert (= (and b!608009 res!390841) b!608020))

(assert (= (and b!608020 res!390856) b!608006))

(assert (= (and b!608006 res!390850) b!608007))

(assert (= (and b!608007 res!390855) b!608008))

(assert (= (and b!608008 res!390845) b!608011))

(assert (= (and b!608011 res!390852) b!608023))

(assert (= (and b!608023 res!390842) b!607999))

(assert (= (and b!607999 res!390839) b!608018))

(assert (= (and b!608018 res!390846) b!608005))

(assert (= (and b!608005 res!390854) b!608014))

(assert (= (and b!608014 res!390837) b!608015))

(assert (= (and b!608014 c!68949) b!608000))

(assert (= (and b!608014 (not c!68949)) b!608004))

(assert (= (and b!608014 (not res!390836)) b!608002))

(assert (= (and b!608002 res!390851) b!608010))

(assert (= (and b!608010 (not res!390840)) b!608001))

(assert (= (and b!608001 res!390843) b!608017))

(assert (= (and b!608002 (not res!390844)) b!608013))

(assert (= (and b!608013 c!68948) b!608012))

(assert (= (and b!608013 (not c!68948)) b!608021))

(assert (= (and b!608013 (not res!390849)) b!608019))

(assert (= (and b!608019 res!390857) b!607997))

(assert (= (and b!608019 (not res!390847)) b!608003))

(assert (= (and b!608003 (not res!390835)) b!608022))

(assert (= (and b!608022 (not res!390838)) b!607998))

(assert (= (and b!607998 (not res!390853)) b!608016))

(declare-fun m!584143 () Bool)

(assert (=> b!607997 m!584143))

(assert (=> b!607997 m!584143))

(declare-fun m!584145 () Bool)

(assert (=> b!607997 m!584145))

(declare-fun m!584147 () Bool)

(assert (=> b!608011 m!584147))

(declare-fun m!584149 () Bool)

(assert (=> b!608005 m!584149))

(assert (=> b!608005 m!584143))

(assert (=> b!608005 m!584143))

(declare-fun m!584151 () Bool)

(assert (=> b!608005 m!584151))

(assert (=> b!608017 m!584143))

(assert (=> b!608017 m!584143))

(assert (=> b!608017 m!584145))

(declare-fun m!584153 () Bool)

(assert (=> b!608022 m!584153))

(declare-fun m!584155 () Bool)

(assert (=> b!607998 m!584155))

(declare-fun m!584157 () Bool)

(assert (=> b!608007 m!584157))

(declare-fun m!584159 () Bool)

(assert (=> start!55554 m!584159))

(declare-fun m!584161 () Bool)

(assert (=> start!55554 m!584161))

(declare-fun m!584163 () Bool)

(assert (=> b!608008 m!584163))

(declare-fun m!584165 () Bool)

(assert (=> b!608018 m!584165))

(declare-fun m!584167 () Bool)

(assert (=> b!608018 m!584167))

(assert (=> b!608020 m!584143))

(assert (=> b!608020 m!584143))

(declare-fun m!584169 () Bool)

(assert (=> b!608020 m!584169))

(declare-fun m!584171 () Bool)

(assert (=> b!608014 m!584171))

(declare-fun m!584173 () Bool)

(assert (=> b!608014 m!584173))

(assert (=> b!608014 m!584143))

(assert (=> b!608014 m!584165))

(assert (=> b!608014 m!584143))

(declare-fun m!584175 () Bool)

(assert (=> b!608014 m!584175))

(declare-fun m!584177 () Bool)

(assert (=> b!608014 m!584177))

(declare-fun m!584179 () Bool)

(assert (=> b!608014 m!584179))

(declare-fun m!584181 () Bool)

(assert (=> b!608014 m!584181))

(assert (=> b!608019 m!584143))

(assert (=> b!608019 m!584143))

(declare-fun m!584183 () Bool)

(assert (=> b!608019 m!584183))

(assert (=> b!608019 m!584143))

(declare-fun m!584185 () Bool)

(assert (=> b!608019 m!584185))

(assert (=> b!608019 m!584143))

(declare-fun m!584187 () Bool)

(assert (=> b!608019 m!584187))

(assert (=> b!608001 m!584143))

(assert (=> b!608001 m!584143))

(assert (=> b!608001 m!584187))

(assert (=> b!608002 m!584143))

(assert (=> b!608002 m!584165))

(declare-fun m!584189 () Bool)

(assert (=> b!608002 m!584189))

(declare-fun m!584191 () Bool)

(assert (=> b!608003 m!584191))

(declare-fun m!584193 () Bool)

(assert (=> b!608006 m!584193))

(declare-fun m!584195 () Bool)

(assert (=> b!607999 m!584195))

(declare-fun m!584197 () Bool)

(assert (=> b!608023 m!584197))

(declare-fun m!584199 () Bool)

(assert (=> b!608016 m!584199))

(assert (=> b!608012 m!584143))

(assert (=> b!608012 m!584143))

(declare-fun m!584201 () Bool)

(assert (=> b!608012 m!584201))

(declare-fun m!584203 () Bool)

(assert (=> b!608012 m!584203))

(declare-fun m!584205 () Bool)

(assert (=> b!608012 m!584205))

(assert (=> b!608012 m!584143))

(declare-fun m!584207 () Bool)

(assert (=> b!608012 m!584207))

(declare-fun m!584209 () Bool)

(assert (=> b!608012 m!584209))

(assert (=> b!608012 m!584143))

(declare-fun m!584211 () Bool)

(assert (=> b!608012 m!584211))

(declare-fun m!584213 () Bool)

(assert (=> b!608012 m!584213))

(assert (=> b!608010 m!584143))

(check-sat (not b!608016) (not b!608008) (not b!608007) (not b!608020) (not b!608011) (not b!608014) (not b!607998) (not b!608022) (not b!607997) (not b!608019) (not start!55554) (not b!608001) (not b!608017) (not b!608005) (not b!608023) (not b!608006) (not b!608003) (not b!608012))
(check-sat)
