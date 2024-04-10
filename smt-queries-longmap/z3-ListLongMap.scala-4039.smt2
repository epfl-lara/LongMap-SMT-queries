; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55110 () Bool)

(assert start!55110)

(declare-fun b!602996 () Bool)

(declare-fun e!344915 () Bool)

(assert (=> b!602996 (= e!344915 true)))

(declare-fun e!344923 () Bool)

(assert (=> b!602996 e!344923))

(declare-fun res!387180 () Bool)

(assert (=> b!602996 (=> (not res!387180) (not e!344923))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37183 0))(
  ( (array!37184 (arr!17848 (Array (_ BitVec 32) (_ BitVec 64))) (size!18212 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37183)

(declare-fun lt!274707 () array!37183)

(declare-fun arrayContainsKey!0 (array!37183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602996 (= res!387180 (arrayContainsKey!0 lt!274707 (select (arr!17848 a!2986) j!136) j!136))))

(declare-fun b!602997 () Bool)

(declare-datatypes ((Unit!19108 0))(
  ( (Unit!19109) )
))
(declare-fun e!344913 () Unit!19108)

(declare-fun Unit!19110 () Unit!19108)

(assert (=> b!602997 (= e!344913 Unit!19110)))

(declare-fun lt!274715 () Unit!19108)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37183 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19108)

(assert (=> b!602997 (= lt!274715 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274707 (select (arr!17848 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602997 (arrayContainsKey!0 lt!274707 (select (arr!17848 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!274704 () Unit!19108)

(declare-datatypes ((List!11889 0))(
  ( (Nil!11886) (Cons!11885 (h!12930 (_ BitVec 64)) (t!18117 List!11889)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37183 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11889) Unit!19108)

(assert (=> b!602997 (= lt!274704 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11886))))

(declare-fun arrayNoDuplicates!0 (array!37183 (_ BitVec 32) List!11889) Bool)

(assert (=> b!602997 (arrayNoDuplicates!0 lt!274707 #b00000000000000000000000000000000 Nil!11886)))

(declare-fun lt!274710 () Unit!19108)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37183 (_ BitVec 32) (_ BitVec 32)) Unit!19108)

(assert (=> b!602997 (= lt!274710 (lemmaNoDuplicateFromThenFromBigger!0 lt!274707 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602997 (arrayNoDuplicates!0 lt!274707 j!136 Nil!11886)))

(declare-fun lt!274714 () Unit!19108)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37183 (_ BitVec 64) (_ BitVec 32) List!11889) Unit!19108)

(assert (=> b!602997 (= lt!274714 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274707 (select (arr!17848 a!2986) j!136) j!136 Nil!11886))))

(assert (=> b!602997 false))

(declare-fun b!602998 () Bool)

(declare-fun e!344920 () Bool)

(declare-fun e!344914 () Bool)

(assert (=> b!602998 (= e!344920 e!344914)))

(declare-fun res!387173 () Bool)

(assert (=> b!602998 (=> res!387173 e!344914)))

(declare-fun lt!274717 () (_ BitVec 64))

(declare-fun lt!274706 () (_ BitVec 64))

(assert (=> b!602998 (= res!387173 (or (not (= (select (arr!17848 a!2986) j!136) lt!274717)) (not (= (select (arr!17848 a!2986) j!136) lt!274706))))))

(declare-fun e!344919 () Bool)

(assert (=> b!602998 e!344919))

(declare-fun res!387168 () Bool)

(assert (=> b!602998 (=> (not res!387168) (not e!344919))))

(assert (=> b!602998 (= res!387168 (= lt!274706 (select (arr!17848 a!2986) j!136)))))

(assert (=> b!602998 (= lt!274706 (select (store (arr!17848 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602999 () Bool)

(declare-fun e!344924 () Bool)

(assert (=> b!602999 (= e!344924 (arrayContainsKey!0 lt!274707 (select (arr!17848 a!2986) j!136) index!984))))

(declare-fun b!603000 () Bool)

(assert (=> b!603000 (= e!344923 (arrayContainsKey!0 lt!274707 (select (arr!17848 a!2986) j!136) index!984))))

(declare-fun b!603001 () Bool)

(declare-fun res!387181 () Bool)

(declare-fun e!344917 () Bool)

(assert (=> b!603001 (=> (not res!387181) (not e!344917))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!603001 (= res!387181 (and (= (size!18212 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18212 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18212 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603002 () Bool)

(declare-fun e!344918 () Bool)

(assert (=> b!603002 (= e!344918 e!344924)))

(declare-fun res!387178 () Bool)

(assert (=> b!603002 (=> (not res!387178) (not e!344924))))

(assert (=> b!603002 (= res!387178 (arrayContainsKey!0 lt!274707 (select (arr!17848 a!2986) j!136) j!136))))

(declare-fun b!603003 () Bool)

(declare-fun e!344916 () Bool)

(assert (=> b!603003 (= e!344916 (not e!344920))))

(declare-fun res!387183 () Bool)

(assert (=> b!603003 (=> res!387183 e!344920)))

(declare-datatypes ((SeekEntryResult!6288 0))(
  ( (MissingZero!6288 (index!27415 (_ BitVec 32))) (Found!6288 (index!27416 (_ BitVec 32))) (Intermediate!6288 (undefined!7100 Bool) (index!27417 (_ BitVec 32)) (x!56217 (_ BitVec 32))) (Undefined!6288) (MissingVacant!6288 (index!27418 (_ BitVec 32))) )
))
(declare-fun lt!274703 () SeekEntryResult!6288)

(assert (=> b!603003 (= res!387183 (not (= lt!274703 (Found!6288 index!984))))))

(declare-fun lt!274713 () Unit!19108)

(declare-fun e!344922 () Unit!19108)

(assert (=> b!603003 (= lt!274713 e!344922)))

(declare-fun c!68282 () Bool)

(assert (=> b!603003 (= c!68282 (= lt!274703 Undefined!6288))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37183 (_ BitVec 32)) SeekEntryResult!6288)

(assert (=> b!603003 (= lt!274703 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274717 lt!274707 mask!3053))))

(declare-fun e!344911 () Bool)

(assert (=> b!603003 e!344911))

(declare-fun res!387176 () Bool)

(assert (=> b!603003 (=> (not res!387176) (not e!344911))))

(declare-fun lt!274711 () (_ BitVec 32))

(declare-fun lt!274712 () SeekEntryResult!6288)

(assert (=> b!603003 (= res!387176 (= lt!274712 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274711 vacantSpotIndex!68 lt!274717 lt!274707 mask!3053)))))

(assert (=> b!603003 (= lt!274712 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274711 vacantSpotIndex!68 (select (arr!17848 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603003 (= lt!274717 (select (store (arr!17848 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274716 () Unit!19108)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37183 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19108)

(assert (=> b!603003 (= lt!274716 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274711 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603003 (= lt!274711 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603004 () Bool)

(declare-fun lt!274705 () SeekEntryResult!6288)

(assert (=> b!603004 (= e!344911 (= lt!274705 lt!274712))))

(declare-fun b!602995 () Bool)

(declare-fun e!344921 () Bool)

(assert (=> b!602995 (= e!344921 e!344916)))

(declare-fun res!387179 () Bool)

(assert (=> b!602995 (=> (not res!387179) (not e!344916))))

(assert (=> b!602995 (= res!387179 (and (= lt!274705 (Found!6288 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17848 a!2986) index!984) (select (arr!17848 a!2986) j!136))) (not (= (select (arr!17848 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!602995 (= lt!274705 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17848 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!387174 () Bool)

(assert (=> start!55110 (=> (not res!387174) (not e!344917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55110 (= res!387174 (validMask!0 mask!3053))))

(assert (=> start!55110 e!344917))

(assert (=> start!55110 true))

(declare-fun array_inv!13644 (array!37183) Bool)

(assert (=> start!55110 (array_inv!13644 a!2986)))

(declare-fun b!603005 () Bool)

(declare-fun res!387185 () Bool)

(assert (=> b!603005 (=> (not res!387185) (not e!344917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603005 (= res!387185 (validKeyInArray!0 (select (arr!17848 a!2986) j!136)))))

(declare-fun b!603006 () Bool)

(declare-fun Unit!19111 () Unit!19108)

(assert (=> b!603006 (= e!344922 Unit!19111)))

(assert (=> b!603006 false))

(declare-fun b!603007 () Bool)

(declare-fun Unit!19112 () Unit!19108)

(assert (=> b!603007 (= e!344922 Unit!19112)))

(declare-fun b!603008 () Bool)

(declare-fun res!387170 () Bool)

(assert (=> b!603008 (=> (not res!387170) (not e!344917))))

(assert (=> b!603008 (= res!387170 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603009 () Bool)

(assert (=> b!603009 (= e!344919 e!344918)))

(declare-fun res!387169 () Bool)

(assert (=> b!603009 (=> res!387169 e!344918)))

(assert (=> b!603009 (= res!387169 (or (not (= (select (arr!17848 a!2986) j!136) lt!274717)) (not (= (select (arr!17848 a!2986) j!136) lt!274706)) (bvsge j!136 index!984)))))

(declare-fun b!603010 () Bool)

(declare-fun res!387184 () Bool)

(assert (=> b!603010 (=> (not res!387184) (not e!344917))))

(assert (=> b!603010 (= res!387184 (validKeyInArray!0 k0!1786))))

(declare-fun b!603011 () Bool)

(declare-fun Unit!19113 () Unit!19108)

(assert (=> b!603011 (= e!344913 Unit!19113)))

(declare-fun b!603012 () Bool)

(declare-fun res!387175 () Bool)

(declare-fun e!344925 () Bool)

(assert (=> b!603012 (=> (not res!387175) (not e!344925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37183 (_ BitVec 32)) Bool)

(assert (=> b!603012 (= res!387175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603013 () Bool)

(assert (=> b!603013 (= e!344914 e!344915)))

(declare-fun res!387171 () Bool)

(assert (=> b!603013 (=> res!387171 e!344915)))

(assert (=> b!603013 (= res!387171 (bvsge index!984 j!136))))

(declare-fun lt!274709 () Unit!19108)

(assert (=> b!603013 (= lt!274709 e!344913)))

(declare-fun c!68281 () Bool)

(assert (=> b!603013 (= c!68281 (bvslt j!136 index!984))))

(declare-fun b!603014 () Bool)

(assert (=> b!603014 (= e!344925 e!344921)))

(declare-fun res!387177 () Bool)

(assert (=> b!603014 (=> (not res!387177) (not e!344921))))

(assert (=> b!603014 (= res!387177 (= (select (store (arr!17848 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603014 (= lt!274707 (array!37184 (store (arr!17848 a!2986) i!1108 k0!1786) (size!18212 a!2986)))))

(declare-fun b!603015 () Bool)

(assert (=> b!603015 (= e!344917 e!344925)))

(declare-fun res!387172 () Bool)

(assert (=> b!603015 (=> (not res!387172) (not e!344925))))

(declare-fun lt!274708 () SeekEntryResult!6288)

(assert (=> b!603015 (= res!387172 (or (= lt!274708 (MissingZero!6288 i!1108)) (= lt!274708 (MissingVacant!6288 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37183 (_ BitVec 32)) SeekEntryResult!6288)

(assert (=> b!603015 (= lt!274708 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603016 () Bool)

(declare-fun res!387182 () Bool)

(assert (=> b!603016 (=> (not res!387182) (not e!344925))))

(assert (=> b!603016 (= res!387182 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11886))))

(declare-fun b!603017 () Bool)

(declare-fun res!387167 () Bool)

(assert (=> b!603017 (=> (not res!387167) (not e!344925))))

(assert (=> b!603017 (= res!387167 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17848 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!55110 res!387174) b!603001))

(assert (= (and b!603001 res!387181) b!603005))

(assert (= (and b!603005 res!387185) b!603010))

(assert (= (and b!603010 res!387184) b!603008))

(assert (= (and b!603008 res!387170) b!603015))

(assert (= (and b!603015 res!387172) b!603012))

(assert (= (and b!603012 res!387175) b!603016))

(assert (= (and b!603016 res!387182) b!603017))

(assert (= (and b!603017 res!387167) b!603014))

(assert (= (and b!603014 res!387177) b!602995))

(assert (= (and b!602995 res!387179) b!603003))

(assert (= (and b!603003 res!387176) b!603004))

(assert (= (and b!603003 c!68282) b!603006))

(assert (= (and b!603003 (not c!68282)) b!603007))

(assert (= (and b!603003 (not res!387183)) b!602998))

(assert (= (and b!602998 res!387168) b!603009))

(assert (= (and b!603009 (not res!387169)) b!603002))

(assert (= (and b!603002 res!387178) b!602999))

(assert (= (and b!602998 (not res!387173)) b!603013))

(assert (= (and b!603013 c!68281) b!602997))

(assert (= (and b!603013 (not c!68281)) b!603011))

(assert (= (and b!603013 (not res!387171)) b!602996))

(assert (= (and b!602996 res!387180) b!603000))

(declare-fun m!580073 () Bool)

(assert (=> b!603009 m!580073))

(declare-fun m!580075 () Bool)

(assert (=> start!55110 m!580075))

(declare-fun m!580077 () Bool)

(assert (=> start!55110 m!580077))

(declare-fun m!580079 () Bool)

(assert (=> b!602995 m!580079))

(assert (=> b!602995 m!580073))

(assert (=> b!602995 m!580073))

(declare-fun m!580081 () Bool)

(assert (=> b!602995 m!580081))

(declare-fun m!580083 () Bool)

(assert (=> b!603016 m!580083))

(assert (=> b!602996 m!580073))

(assert (=> b!602996 m!580073))

(declare-fun m!580085 () Bool)

(assert (=> b!602996 m!580085))

(declare-fun m!580087 () Bool)

(assert (=> b!603017 m!580087))

(assert (=> b!602997 m!580073))

(declare-fun m!580089 () Bool)

(assert (=> b!602997 m!580089))

(assert (=> b!602997 m!580073))

(assert (=> b!602997 m!580073))

(declare-fun m!580091 () Bool)

(assert (=> b!602997 m!580091))

(declare-fun m!580093 () Bool)

(assert (=> b!602997 m!580093))

(declare-fun m!580095 () Bool)

(assert (=> b!602997 m!580095))

(declare-fun m!580097 () Bool)

(assert (=> b!602997 m!580097))

(assert (=> b!602997 m!580073))

(declare-fun m!580099 () Bool)

(assert (=> b!602997 m!580099))

(declare-fun m!580101 () Bool)

(assert (=> b!602997 m!580101))

(assert (=> b!602999 m!580073))

(assert (=> b!602999 m!580073))

(declare-fun m!580103 () Bool)

(assert (=> b!602999 m!580103))

(assert (=> b!603002 m!580073))

(assert (=> b!603002 m!580073))

(assert (=> b!603002 m!580085))

(declare-fun m!580105 () Bool)

(assert (=> b!603008 m!580105))

(assert (=> b!603000 m!580073))

(assert (=> b!603000 m!580073))

(assert (=> b!603000 m!580103))

(declare-fun m!580107 () Bool)

(assert (=> b!603014 m!580107))

(declare-fun m!580109 () Bool)

(assert (=> b!603014 m!580109))

(assert (=> b!603005 m!580073))

(assert (=> b!603005 m!580073))

(declare-fun m!580111 () Bool)

(assert (=> b!603005 m!580111))

(declare-fun m!580113 () Bool)

(assert (=> b!603012 m!580113))

(declare-fun m!580115 () Bool)

(assert (=> b!603003 m!580115))

(declare-fun m!580117 () Bool)

(assert (=> b!603003 m!580117))

(assert (=> b!603003 m!580073))

(assert (=> b!603003 m!580107))

(declare-fun m!580119 () Bool)

(assert (=> b!603003 m!580119))

(declare-fun m!580121 () Bool)

(assert (=> b!603003 m!580121))

(declare-fun m!580123 () Bool)

(assert (=> b!603003 m!580123))

(assert (=> b!603003 m!580073))

(declare-fun m!580125 () Bool)

(assert (=> b!603003 m!580125))

(declare-fun m!580127 () Bool)

(assert (=> b!603015 m!580127))

(declare-fun m!580129 () Bool)

(assert (=> b!603010 m!580129))

(assert (=> b!602998 m!580073))

(assert (=> b!602998 m!580107))

(declare-fun m!580131 () Bool)

(assert (=> b!602998 m!580131))

(check-sat (not b!603016) (not b!603002) (not b!602999) (not b!603010) (not b!603000) (not b!603005) (not b!603003) (not start!55110) (not b!603012) (not b!602997) (not b!602995) (not b!602996) (not b!603015) (not b!603008))
(check-sat)
