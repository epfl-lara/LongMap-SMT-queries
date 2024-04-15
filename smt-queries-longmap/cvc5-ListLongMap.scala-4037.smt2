; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55000 () Bool)

(assert start!55000)

(declare-fun b!602062 () Bool)

(declare-fun res!386648 () Bool)

(declare-fun e!344309 () Bool)

(assert (=> b!602062 (=> (not res!386648) (not e!344309))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37168 0))(
  ( (array!37169 (arr!17842 (Array (_ BitVec 32) (_ BitVec 64))) (size!18207 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37168)

(assert (=> b!602062 (= res!386648 (and (= (size!18207 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18207 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18207 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602063 () Bool)

(declare-fun res!386647 () Bool)

(declare-fun e!344301 () Bool)

(assert (=> b!602063 (=> (not res!386647) (not e!344301))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!602063 (= res!386647 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17842 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602064 () Bool)

(declare-datatypes ((Unit!19056 0))(
  ( (Unit!19057) )
))
(declare-fun e!344300 () Unit!19056)

(declare-fun Unit!19058 () Unit!19056)

(assert (=> b!602064 (= e!344300 Unit!19058)))

(declare-fun b!602065 () Bool)

(declare-fun e!344312 () Bool)

(declare-fun e!344304 () Bool)

(assert (=> b!602065 (= e!344312 e!344304)))

(declare-fun res!386654 () Bool)

(assert (=> b!602065 (=> res!386654 e!344304)))

(declare-fun lt!274100 () (_ BitVec 64))

(declare-fun lt!274109 () (_ BitVec 64))

(assert (=> b!602065 (= res!386654 (or (not (= (select (arr!17842 a!2986) j!136) lt!274100)) (not (= (select (arr!17842 a!2986) j!136) lt!274109)) (bvsge j!136 index!984)))))

(declare-fun b!602066 () Bool)

(assert (=> b!602066 (= e!344309 e!344301)))

(declare-fun res!386658 () Bool)

(assert (=> b!602066 (=> (not res!386658) (not e!344301))))

(declare-datatypes ((SeekEntryResult!6279 0))(
  ( (MissingZero!6279 (index!27376 (_ BitVec 32))) (Found!6279 (index!27377 (_ BitVec 32))) (Intermediate!6279 (undefined!7091 Bool) (index!27378 (_ BitVec 32)) (x!56178 (_ BitVec 32))) (Undefined!6279) (MissingVacant!6279 (index!27379 (_ BitVec 32))) )
))
(declare-fun lt!274106 () SeekEntryResult!6279)

(assert (=> b!602066 (= res!386658 (or (= lt!274106 (MissingZero!6279 i!1108)) (= lt!274106 (MissingVacant!6279 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37168 (_ BitVec 32)) SeekEntryResult!6279)

(assert (=> b!602066 (= lt!274106 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!602067 () Bool)

(declare-fun e!344310 () Unit!19056)

(declare-fun Unit!19059 () Unit!19056)

(assert (=> b!602067 (= e!344310 Unit!19059)))

(declare-fun lt!274112 () Unit!19056)

(declare-fun lt!274113 () array!37168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37168 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19056)

(assert (=> b!602067 (= lt!274112 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274113 (select (arr!17842 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602067 (arrayContainsKey!0 lt!274113 (select (arr!17842 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274104 () Unit!19056)

(declare-datatypes ((List!11922 0))(
  ( (Nil!11919) (Cons!11918 (h!12963 (_ BitVec 64)) (t!18141 List!11922)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37168 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11922) Unit!19056)

(assert (=> b!602067 (= lt!274104 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11919))))

(declare-fun arrayNoDuplicates!0 (array!37168 (_ BitVec 32) List!11922) Bool)

(assert (=> b!602067 (arrayNoDuplicates!0 lt!274113 #b00000000000000000000000000000000 Nil!11919)))

(declare-fun lt!274107 () Unit!19056)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37168 (_ BitVec 32) (_ BitVec 32)) Unit!19056)

(assert (=> b!602067 (= lt!274107 (lemmaNoDuplicateFromThenFromBigger!0 lt!274113 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602067 (arrayNoDuplicates!0 lt!274113 j!136 Nil!11919)))

(declare-fun lt!274105 () Unit!19056)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37168 (_ BitVec 64) (_ BitVec 32) List!11922) Unit!19056)

(assert (=> b!602067 (= lt!274105 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274113 (select (arr!17842 a!2986) j!136) j!136 Nil!11919))))

(assert (=> b!602067 false))

(declare-fun b!602068 () Bool)

(declare-fun Unit!19060 () Unit!19056)

(assert (=> b!602068 (= e!344300 Unit!19060)))

(assert (=> b!602068 false))

(declare-fun b!602069 () Bool)

(declare-fun e!344303 () Bool)

(declare-fun e!344302 () Bool)

(assert (=> b!602069 (= e!344303 e!344302)))

(declare-fun res!386662 () Bool)

(assert (=> b!602069 (=> (not res!386662) (not e!344302))))

(declare-fun lt!274114 () SeekEntryResult!6279)

(assert (=> b!602069 (= res!386662 (and (= lt!274114 (Found!6279 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17842 a!2986) index!984) (select (arr!17842 a!2986) j!136))) (not (= (select (arr!17842 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37168 (_ BitVec 32)) SeekEntryResult!6279)

(assert (=> b!602069 (= lt!274114 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17842 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!386661 () Bool)

(assert (=> start!55000 (=> (not res!386661) (not e!344309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55000 (= res!386661 (validMask!0 mask!3053))))

(assert (=> start!55000 e!344309))

(assert (=> start!55000 true))

(declare-fun array_inv!13725 (array!37168) Bool)

(assert (=> start!55000 (array_inv!13725 a!2986)))

(declare-fun b!602070 () Bool)

(declare-fun e!344305 () Bool)

(assert (=> b!602070 (= e!344302 (not e!344305))))

(declare-fun res!386650 () Bool)

(assert (=> b!602070 (=> res!386650 e!344305)))

(declare-fun lt!274110 () SeekEntryResult!6279)

(assert (=> b!602070 (= res!386650 (not (= lt!274110 (Found!6279 index!984))))))

(declare-fun lt!274102 () Unit!19056)

(assert (=> b!602070 (= lt!274102 e!344300)))

(declare-fun c!68076 () Bool)

(assert (=> b!602070 (= c!68076 (= lt!274110 Undefined!6279))))

(assert (=> b!602070 (= lt!274110 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274100 lt!274113 mask!3053))))

(declare-fun e!344306 () Bool)

(assert (=> b!602070 e!344306))

(declare-fun res!386655 () Bool)

(assert (=> b!602070 (=> (not res!386655) (not e!344306))))

(declare-fun lt!274101 () (_ BitVec 32))

(declare-fun lt!274108 () SeekEntryResult!6279)

(assert (=> b!602070 (= res!386655 (= lt!274108 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274101 vacantSpotIndex!68 lt!274100 lt!274113 mask!3053)))))

(assert (=> b!602070 (= lt!274108 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274101 vacantSpotIndex!68 (select (arr!17842 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602070 (= lt!274100 (select (store (arr!17842 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274103 () Unit!19056)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37168 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19056)

(assert (=> b!602070 (= lt!274103 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274101 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602070 (= lt!274101 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602071 () Bool)

(declare-fun res!386657 () Bool)

(assert (=> b!602071 (=> (not res!386657) (not e!344309))))

(assert (=> b!602071 (= res!386657 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602072 () Bool)

(declare-fun res!386656 () Bool)

(assert (=> b!602072 (=> (not res!386656) (not e!344301))))

(assert (=> b!602072 (= res!386656 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11919))))

(declare-fun b!602073 () Bool)

(declare-fun res!386653 () Bool)

(assert (=> b!602073 (=> (not res!386653) (not e!344309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602073 (= res!386653 (validKeyInArray!0 (select (arr!17842 a!2986) j!136)))))

(declare-fun b!602074 () Bool)

(declare-fun e!344308 () Bool)

(assert (=> b!602074 (= e!344308 (bvslt index!984 (size!18207 a!2986)))))

(assert (=> b!602074 (arrayContainsKey!0 lt!274113 (select (arr!17842 a!2986) j!136) j!136)))

(declare-fun b!602075 () Bool)

(declare-fun e!344311 () Bool)

(assert (=> b!602075 (= e!344304 e!344311)))

(declare-fun res!386651 () Bool)

(assert (=> b!602075 (=> (not res!386651) (not e!344311))))

(assert (=> b!602075 (= res!386651 (arrayContainsKey!0 lt!274113 (select (arr!17842 a!2986) j!136) j!136))))

(declare-fun b!602076 () Bool)

(assert (=> b!602076 (= e!344301 e!344303)))

(declare-fun res!386652 () Bool)

(assert (=> b!602076 (=> (not res!386652) (not e!344303))))

(assert (=> b!602076 (= res!386652 (= (select (store (arr!17842 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602076 (= lt!274113 (array!37169 (store (arr!17842 a!2986) i!1108 k!1786) (size!18207 a!2986)))))

(declare-fun b!602077 () Bool)

(assert (=> b!602077 (= e!344306 (= lt!274114 lt!274108))))

(declare-fun b!602078 () Bool)

(declare-fun res!386659 () Bool)

(assert (=> b!602078 (=> (not res!386659) (not e!344309))))

(assert (=> b!602078 (= res!386659 (validKeyInArray!0 k!1786))))

(declare-fun b!602079 () Bool)

(assert (=> b!602079 (= e!344311 (arrayContainsKey!0 lt!274113 (select (arr!17842 a!2986) j!136) index!984))))

(declare-fun b!602080 () Bool)

(declare-fun e!344313 () Bool)

(assert (=> b!602080 (= e!344305 e!344313)))

(declare-fun res!386660 () Bool)

(assert (=> b!602080 (=> res!386660 e!344313)))

(assert (=> b!602080 (= res!386660 (or (not (= (select (arr!17842 a!2986) j!136) lt!274100)) (not (= (select (arr!17842 a!2986) j!136) lt!274109))))))

(assert (=> b!602080 e!344312))

(declare-fun res!386646 () Bool)

(assert (=> b!602080 (=> (not res!386646) (not e!344312))))

(assert (=> b!602080 (= res!386646 (= lt!274109 (select (arr!17842 a!2986) j!136)))))

(assert (=> b!602080 (= lt!274109 (select (store (arr!17842 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!602081 () Bool)

(assert (=> b!602081 (= e!344313 e!344308)))

(declare-fun res!386663 () Bool)

(assert (=> b!602081 (=> res!386663 e!344308)))

(assert (=> b!602081 (= res!386663 (bvsge index!984 j!136))))

(declare-fun lt!274111 () Unit!19056)

(assert (=> b!602081 (= lt!274111 e!344310)))

(declare-fun c!68075 () Bool)

(assert (=> b!602081 (= c!68075 (bvslt j!136 index!984))))

(declare-fun b!602082 () Bool)

(declare-fun Unit!19061 () Unit!19056)

(assert (=> b!602082 (= e!344310 Unit!19061)))

(declare-fun b!602083 () Bool)

(declare-fun res!386649 () Bool)

(assert (=> b!602083 (=> (not res!386649) (not e!344301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37168 (_ BitVec 32)) Bool)

(assert (=> b!602083 (= res!386649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55000 res!386661) b!602062))

(assert (= (and b!602062 res!386648) b!602073))

(assert (= (and b!602073 res!386653) b!602078))

(assert (= (and b!602078 res!386659) b!602071))

(assert (= (and b!602071 res!386657) b!602066))

(assert (= (and b!602066 res!386658) b!602083))

(assert (= (and b!602083 res!386649) b!602072))

(assert (= (and b!602072 res!386656) b!602063))

(assert (= (and b!602063 res!386647) b!602076))

(assert (= (and b!602076 res!386652) b!602069))

(assert (= (and b!602069 res!386662) b!602070))

(assert (= (and b!602070 res!386655) b!602077))

(assert (= (and b!602070 c!68076) b!602068))

(assert (= (and b!602070 (not c!68076)) b!602064))

(assert (= (and b!602070 (not res!386650)) b!602080))

(assert (= (and b!602080 res!386646) b!602065))

(assert (= (and b!602065 (not res!386654)) b!602075))

(assert (= (and b!602075 res!386651) b!602079))

(assert (= (and b!602080 (not res!386660)) b!602081))

(assert (= (and b!602081 c!68075) b!602067))

(assert (= (and b!602081 (not c!68075)) b!602082))

(assert (= (and b!602081 (not res!386663)) b!602074))

(declare-fun m!578689 () Bool)

(assert (=> b!602080 m!578689))

(declare-fun m!578691 () Bool)

(assert (=> b!602080 m!578691))

(declare-fun m!578693 () Bool)

(assert (=> b!602080 m!578693))

(assert (=> b!602079 m!578689))

(assert (=> b!602079 m!578689))

(declare-fun m!578695 () Bool)

(assert (=> b!602079 m!578695))

(declare-fun m!578697 () Bool)

(assert (=> b!602069 m!578697))

(assert (=> b!602069 m!578689))

(assert (=> b!602069 m!578689))

(declare-fun m!578699 () Bool)

(assert (=> b!602069 m!578699))

(declare-fun m!578701 () Bool)

(assert (=> b!602067 m!578701))

(declare-fun m!578703 () Bool)

(assert (=> b!602067 m!578703))

(assert (=> b!602067 m!578689))

(assert (=> b!602067 m!578689))

(declare-fun m!578705 () Bool)

(assert (=> b!602067 m!578705))

(assert (=> b!602067 m!578689))

(declare-fun m!578707 () Bool)

(assert (=> b!602067 m!578707))

(declare-fun m!578709 () Bool)

(assert (=> b!602067 m!578709))

(assert (=> b!602067 m!578689))

(declare-fun m!578711 () Bool)

(assert (=> b!602067 m!578711))

(declare-fun m!578713 () Bool)

(assert (=> b!602067 m!578713))

(declare-fun m!578715 () Bool)

(assert (=> start!55000 m!578715))

(declare-fun m!578717 () Bool)

(assert (=> start!55000 m!578717))

(assert (=> b!602073 m!578689))

(assert (=> b!602073 m!578689))

(declare-fun m!578719 () Bool)

(assert (=> b!602073 m!578719))

(assert (=> b!602065 m!578689))

(assert (=> b!602076 m!578691))

(declare-fun m!578721 () Bool)

(assert (=> b!602076 m!578721))

(declare-fun m!578723 () Bool)

(assert (=> b!602078 m!578723))

(assert (=> b!602075 m!578689))

(assert (=> b!602075 m!578689))

(declare-fun m!578725 () Bool)

(assert (=> b!602075 m!578725))

(declare-fun m!578727 () Bool)

(assert (=> b!602083 m!578727))

(declare-fun m!578729 () Bool)

(assert (=> b!602066 m!578729))

(declare-fun m!578731 () Bool)

(assert (=> b!602072 m!578731))

(declare-fun m!578733 () Bool)

(assert (=> b!602070 m!578733))

(declare-fun m!578735 () Bool)

(assert (=> b!602070 m!578735))

(assert (=> b!602070 m!578691))

(declare-fun m!578737 () Bool)

(assert (=> b!602070 m!578737))

(declare-fun m!578739 () Bool)

(assert (=> b!602070 m!578739))

(assert (=> b!602070 m!578689))

(declare-fun m!578741 () Bool)

(assert (=> b!602070 m!578741))

(assert (=> b!602070 m!578689))

(declare-fun m!578743 () Bool)

(assert (=> b!602070 m!578743))

(assert (=> b!602074 m!578689))

(assert (=> b!602074 m!578689))

(assert (=> b!602074 m!578725))

(declare-fun m!578745 () Bool)

(assert (=> b!602063 m!578745))

(declare-fun m!578747 () Bool)

(assert (=> b!602071 m!578747))

(push 1)

(assert (not b!602072))

(assert (not b!602083))

(assert (not b!602073))

(assert (not b!602070))

(assert (not b!602078))

(assert (not start!55000))

(assert (not b!602069))

(assert (not b!602079))

(assert (not b!602074))

(assert (not b!602066))

(assert (not b!602071))

(assert (not b!602067))

(assert (not b!602075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

