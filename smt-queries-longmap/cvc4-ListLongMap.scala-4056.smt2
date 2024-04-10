; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55568 () Bool)

(assert start!55568)

(declare-fun b!608187 () Bool)

(declare-fun e!348298 () Bool)

(declare-fun e!348305 () Bool)

(assert (=> b!608187 (= e!348298 e!348305)))

(declare-fun res!390901 () Bool)

(assert (=> b!608187 (=> (not res!390901) (not e!348305))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37299 0))(
  ( (array!37300 (arr!17900 (Array (_ BitVec 32) (_ BitVec 64))) (size!18264 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37299)

(declare-fun lt!277805 () array!37299)

(declare-fun arrayContainsKey!0 (array!37299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608187 (= res!390901 (arrayContainsKey!0 lt!277805 (select (arr!17900 a!2986) j!136) j!136))))

(declare-fun b!608188 () Bool)

(declare-fun e!348301 () Bool)

(declare-fun e!348300 () Bool)

(assert (=> b!608188 (= e!348301 e!348300)))

(declare-fun res!390906 () Bool)

(assert (=> b!608188 (=> res!390906 e!348300)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!608188 (= res!390906 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19420 0))(
  ( (Unit!19421) )
))
(declare-fun lt!277795 () Unit!19420)

(declare-fun e!348303 () Unit!19420)

(assert (=> b!608188 (= lt!277795 e!348303)))

(declare-fun c!69014 () Bool)

(assert (=> b!608188 (= c!69014 (bvslt j!136 index!984))))

(declare-fun b!608189 () Bool)

(declare-fun res!390912 () Bool)

(declare-fun e!348297 () Bool)

(assert (=> b!608189 (=> (not res!390912) (not e!348297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608189 (= res!390912 (validKeyInArray!0 (select (arr!17900 a!2986) j!136)))))

(declare-fun b!608190 () Bool)

(declare-fun e!348302 () Bool)

(assert (=> b!608190 (= e!348302 e!348298)))

(declare-fun res!390897 () Bool)

(assert (=> b!608190 (=> res!390897 e!348298)))

(declare-fun lt!277810 () (_ BitVec 64))

(declare-fun lt!277799 () (_ BitVec 64))

(assert (=> b!608190 (= res!390897 (or (not (= (select (arr!17900 a!2986) j!136) lt!277799)) (not (= (select (arr!17900 a!2986) j!136) lt!277810)) (bvsge j!136 index!984)))))

(declare-fun b!608191 () Bool)

(declare-fun e!348294 () Bool)

(assert (=> b!608191 (= e!348297 e!348294)))

(declare-fun res!390911 () Bool)

(assert (=> b!608191 (=> (not res!390911) (not e!348294))))

(declare-datatypes ((SeekEntryResult!6340 0))(
  ( (MissingZero!6340 (index!27635 (_ BitVec 32))) (Found!6340 (index!27636 (_ BitVec 32))) (Intermediate!6340 (undefined!7152 Bool) (index!27637 (_ BitVec 32)) (x!56441 (_ BitVec 32))) (Undefined!6340) (MissingVacant!6340 (index!27638 (_ BitVec 32))) )
))
(declare-fun lt!277798 () SeekEntryResult!6340)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608191 (= res!390911 (or (= lt!277798 (MissingZero!6340 i!1108)) (= lt!277798 (MissingVacant!6340 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37299 (_ BitVec 32)) SeekEntryResult!6340)

(assert (=> b!608191 (= lt!277798 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!608192 () Bool)

(declare-fun e!348307 () Bool)

(assert (=> b!608192 (= e!348307 (arrayContainsKey!0 lt!277805 (select (arr!17900 a!2986) j!136) index!984))))

(declare-fun b!608193 () Bool)

(declare-fun res!390909 () Bool)

(assert (=> b!608193 (=> (not res!390909) (not e!348297))))

(assert (=> b!608193 (= res!390909 (and (= (size!18264 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18264 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18264 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608194 () Bool)

(declare-fun res!390910 () Bool)

(declare-fun e!348309 () Bool)

(assert (=> b!608194 (=> res!390910 e!348309)))

(declare-datatypes ((List!11941 0))(
  ( (Nil!11938) (Cons!11937 (h!12982 (_ BitVec 64)) (t!18169 List!11941)) )
))
(declare-fun contains!3017 (List!11941 (_ BitVec 64)) Bool)

(assert (=> b!608194 (= res!390910 (contains!3017 Nil!11938 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608195 () Bool)

(declare-fun e!348296 () Unit!19420)

(declare-fun Unit!19422 () Unit!19420)

(assert (=> b!608195 (= e!348296 Unit!19422)))

(declare-fun b!608196 () Bool)

(assert (=> b!608196 (= e!348305 (arrayContainsKey!0 lt!277805 (select (arr!17900 a!2986) j!136) index!984))))

(declare-fun b!608197 () Bool)

(declare-fun res!390915 () Bool)

(assert (=> b!608197 (=> (not res!390915) (not e!348294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37299 (_ BitVec 32)) Bool)

(assert (=> b!608197 (= res!390915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608198 () Bool)

(declare-fun res!390908 () Bool)

(assert (=> b!608198 (=> (not res!390908) (not e!348297))))

(assert (=> b!608198 (= res!390908 (validKeyInArray!0 k!1786))))

(declare-fun b!608199 () Bool)

(assert (=> b!608199 (= e!348309 true)))

(declare-fun lt!277802 () Bool)

(assert (=> b!608199 (= lt!277802 (contains!3017 Nil!11938 k!1786))))

(declare-fun b!608200 () Bool)

(declare-fun e!348306 () Bool)

(declare-fun e!348308 () Bool)

(assert (=> b!608200 (= e!348306 (not e!348308))))

(declare-fun res!390905 () Bool)

(assert (=> b!608200 (=> res!390905 e!348308)))

(declare-fun lt!277800 () SeekEntryResult!6340)

(assert (=> b!608200 (= res!390905 (not (= lt!277800 (Found!6340 index!984))))))

(declare-fun lt!277794 () Unit!19420)

(assert (=> b!608200 (= lt!277794 e!348296)))

(declare-fun c!69013 () Bool)

(assert (=> b!608200 (= c!69013 (= lt!277800 Undefined!6340))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37299 (_ BitVec 32)) SeekEntryResult!6340)

(assert (=> b!608200 (= lt!277800 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277799 lt!277805 mask!3053))))

(declare-fun e!348304 () Bool)

(assert (=> b!608200 e!348304))

(declare-fun res!390914 () Bool)

(assert (=> b!608200 (=> (not res!390914) (not e!348304))))

(declare-fun lt!277801 () (_ BitVec 32))

(declare-fun lt!277809 () SeekEntryResult!6340)

(assert (=> b!608200 (= res!390914 (= lt!277809 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277801 vacantSpotIndex!68 lt!277799 lt!277805 mask!3053)))))

(assert (=> b!608200 (= lt!277809 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277801 vacantSpotIndex!68 (select (arr!17900 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608200 (= lt!277799 (select (store (arr!17900 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277796 () Unit!19420)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19420)

(assert (=> b!608200 (= lt!277796 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277801 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608200 (= lt!277801 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608201 () Bool)

(declare-fun res!390907 () Bool)

(assert (=> b!608201 (=> res!390907 e!348309)))

(declare-fun noDuplicate!323 (List!11941) Bool)

(assert (=> b!608201 (= res!390907 (not (noDuplicate!323 Nil!11938)))))

(declare-fun b!608202 () Bool)

(declare-fun Unit!19423 () Unit!19420)

(assert (=> b!608202 (= e!348296 Unit!19423)))

(assert (=> b!608202 false))

(declare-fun b!608203 () Bool)

(assert (=> b!608203 (= e!348300 e!348309)))

(declare-fun res!390903 () Bool)

(assert (=> b!608203 (=> res!390903 e!348309)))

(assert (=> b!608203 (= res!390903 (or (bvsge (size!18264 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18264 a!2986))))))

(assert (=> b!608203 (arrayContainsKey!0 lt!277805 (select (arr!17900 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277807 () Unit!19420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19420)

(assert (=> b!608203 (= lt!277807 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277805 (select (arr!17900 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608203 e!348307))

(declare-fun res!390904 () Bool)

(assert (=> b!608203 (=> (not res!390904) (not e!348307))))

(assert (=> b!608203 (= res!390904 (arrayContainsKey!0 lt!277805 (select (arr!17900 a!2986) j!136) j!136))))

(declare-fun res!390900 () Bool)

(assert (=> start!55568 (=> (not res!390900) (not e!348297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55568 (= res!390900 (validMask!0 mask!3053))))

(assert (=> start!55568 e!348297))

(assert (=> start!55568 true))

(declare-fun array_inv!13696 (array!37299) Bool)

(assert (=> start!55568 (array_inv!13696 a!2986)))

(declare-fun b!608204 () Bool)

(assert (=> b!608204 (= e!348308 e!348301)))

(declare-fun res!390917 () Bool)

(assert (=> b!608204 (=> res!390917 e!348301)))

(assert (=> b!608204 (= res!390917 (or (not (= (select (arr!17900 a!2986) j!136) lt!277799)) (not (= (select (arr!17900 a!2986) j!136) lt!277810))))))

(assert (=> b!608204 e!348302))

(declare-fun res!390913 () Bool)

(assert (=> b!608204 (=> (not res!390913) (not e!348302))))

(assert (=> b!608204 (= res!390913 (= lt!277810 (select (arr!17900 a!2986) j!136)))))

(assert (=> b!608204 (= lt!277810 (select (store (arr!17900 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!608205 () Bool)

(declare-fun res!390895 () Bool)

(assert (=> b!608205 (=> (not res!390895) (not e!348294))))

(assert (=> b!608205 (= res!390895 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17900 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608206 () Bool)

(declare-fun Unit!19424 () Unit!19420)

(assert (=> b!608206 (= e!348303 Unit!19424)))

(declare-fun b!608207 () Bool)

(declare-fun Unit!19425 () Unit!19420)

(assert (=> b!608207 (= e!348303 Unit!19425)))

(declare-fun lt!277806 () Unit!19420)

(assert (=> b!608207 (= lt!277806 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277805 (select (arr!17900 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608207 (arrayContainsKey!0 lt!277805 (select (arr!17900 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277804 () Unit!19420)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11941) Unit!19420)

(assert (=> b!608207 (= lt!277804 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11938))))

(declare-fun arrayNoDuplicates!0 (array!37299 (_ BitVec 32) List!11941) Bool)

(assert (=> b!608207 (arrayNoDuplicates!0 lt!277805 #b00000000000000000000000000000000 Nil!11938)))

(declare-fun lt!277803 () Unit!19420)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37299 (_ BitVec 32) (_ BitVec 32)) Unit!19420)

(assert (=> b!608207 (= lt!277803 (lemmaNoDuplicateFromThenFromBigger!0 lt!277805 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608207 (arrayNoDuplicates!0 lt!277805 j!136 Nil!11938)))

(declare-fun lt!277797 () Unit!19420)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37299 (_ BitVec 64) (_ BitVec 32) List!11941) Unit!19420)

(assert (=> b!608207 (= lt!277797 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277805 (select (arr!17900 a!2986) j!136) j!136 Nil!11938))))

(assert (=> b!608207 false))

(declare-fun b!608208 () Bool)

(declare-fun res!390899 () Bool)

(assert (=> b!608208 (=> res!390899 e!348309)))

(assert (=> b!608208 (= res!390899 (contains!3017 Nil!11938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608209 () Bool)

(declare-fun e!348299 () Bool)

(assert (=> b!608209 (= e!348294 e!348299)))

(declare-fun res!390916 () Bool)

(assert (=> b!608209 (=> (not res!390916) (not e!348299))))

(assert (=> b!608209 (= res!390916 (= (select (store (arr!17900 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608209 (= lt!277805 (array!37300 (store (arr!17900 a!2986) i!1108 k!1786) (size!18264 a!2986)))))

(declare-fun b!608210 () Bool)

(assert (=> b!608210 (= e!348299 e!348306)))

(declare-fun res!390896 () Bool)

(assert (=> b!608210 (=> (not res!390896) (not e!348306))))

(declare-fun lt!277808 () SeekEntryResult!6340)

(assert (=> b!608210 (= res!390896 (and (= lt!277808 (Found!6340 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17900 a!2986) index!984) (select (arr!17900 a!2986) j!136))) (not (= (select (arr!17900 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608210 (= lt!277808 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17900 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608211 () Bool)

(declare-fun res!390902 () Bool)

(assert (=> b!608211 (=> (not res!390902) (not e!348294))))

(assert (=> b!608211 (= res!390902 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11938))))

(declare-fun b!608212 () Bool)

(declare-fun res!390898 () Bool)

(assert (=> b!608212 (=> (not res!390898) (not e!348297))))

(assert (=> b!608212 (= res!390898 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608213 () Bool)

(assert (=> b!608213 (= e!348304 (= lt!277808 lt!277809))))

(assert (= (and start!55568 res!390900) b!608193))

(assert (= (and b!608193 res!390909) b!608189))

(assert (= (and b!608189 res!390912) b!608198))

(assert (= (and b!608198 res!390908) b!608212))

(assert (= (and b!608212 res!390898) b!608191))

(assert (= (and b!608191 res!390911) b!608197))

(assert (= (and b!608197 res!390915) b!608211))

(assert (= (and b!608211 res!390902) b!608205))

(assert (= (and b!608205 res!390895) b!608209))

(assert (= (and b!608209 res!390916) b!608210))

(assert (= (and b!608210 res!390896) b!608200))

(assert (= (and b!608200 res!390914) b!608213))

(assert (= (and b!608200 c!69013) b!608202))

(assert (= (and b!608200 (not c!69013)) b!608195))

(assert (= (and b!608200 (not res!390905)) b!608204))

(assert (= (and b!608204 res!390913) b!608190))

(assert (= (and b!608190 (not res!390897)) b!608187))

(assert (= (and b!608187 res!390901) b!608196))

(assert (= (and b!608204 (not res!390917)) b!608188))

(assert (= (and b!608188 c!69014) b!608207))

(assert (= (and b!608188 (not c!69014)) b!608206))

(assert (= (and b!608188 (not res!390906)) b!608203))

(assert (= (and b!608203 res!390904) b!608192))

(assert (= (and b!608203 (not res!390903)) b!608201))

(assert (= (and b!608201 (not res!390907)) b!608208))

(assert (= (and b!608208 (not res!390899)) b!608194))

(assert (= (and b!608194 (not res!390910)) b!608199))

(declare-fun m!584843 () Bool)

(assert (=> b!608208 m!584843))

(declare-fun m!584845 () Bool)

(assert (=> b!608212 m!584845))

(declare-fun m!584847 () Bool)

(assert (=> b!608197 m!584847))

(declare-fun m!584849 () Bool)

(assert (=> b!608199 m!584849))

(declare-fun m!584851 () Bool)

(assert (=> b!608203 m!584851))

(assert (=> b!608203 m!584851))

(declare-fun m!584853 () Bool)

(assert (=> b!608203 m!584853))

(assert (=> b!608203 m!584851))

(declare-fun m!584855 () Bool)

(assert (=> b!608203 m!584855))

(assert (=> b!608203 m!584851))

(declare-fun m!584857 () Bool)

(assert (=> b!608203 m!584857))

(declare-fun m!584859 () Bool)

(assert (=> b!608211 m!584859))

(assert (=> b!608190 m!584851))

(declare-fun m!584861 () Bool)

(assert (=> b!608210 m!584861))

(assert (=> b!608210 m!584851))

(assert (=> b!608210 m!584851))

(declare-fun m!584863 () Bool)

(assert (=> b!608210 m!584863))

(assert (=> b!608187 m!584851))

(assert (=> b!608187 m!584851))

(assert (=> b!608187 m!584857))

(declare-fun m!584865 () Bool)

(assert (=> b!608209 m!584865))

(declare-fun m!584867 () Bool)

(assert (=> b!608209 m!584867))

(declare-fun m!584869 () Bool)

(assert (=> b!608201 m!584869))

(declare-fun m!584871 () Bool)

(assert (=> start!55568 m!584871))

(declare-fun m!584873 () Bool)

(assert (=> start!55568 m!584873))

(declare-fun m!584875 () Bool)

(assert (=> b!608198 m!584875))

(declare-fun m!584877 () Bool)

(assert (=> b!608205 m!584877))

(assert (=> b!608196 m!584851))

(assert (=> b!608196 m!584851))

(declare-fun m!584879 () Bool)

(assert (=> b!608196 m!584879))

(assert (=> b!608192 m!584851))

(assert (=> b!608192 m!584851))

(assert (=> b!608192 m!584879))

(declare-fun m!584881 () Bool)

(assert (=> b!608194 m!584881))

(assert (=> b!608189 m!584851))

(assert (=> b!608189 m!584851))

(declare-fun m!584883 () Bool)

(assert (=> b!608189 m!584883))

(declare-fun m!584885 () Bool)

(assert (=> b!608191 m!584885))

(declare-fun m!584887 () Bool)

(assert (=> b!608200 m!584887))

(declare-fun m!584889 () Bool)

(assert (=> b!608200 m!584889))

(assert (=> b!608200 m!584851))

(assert (=> b!608200 m!584865))

(assert (=> b!608200 m!584851))

(declare-fun m!584891 () Bool)

(assert (=> b!608200 m!584891))

(declare-fun m!584893 () Bool)

(assert (=> b!608200 m!584893))

(declare-fun m!584895 () Bool)

(assert (=> b!608200 m!584895))

(declare-fun m!584897 () Bool)

(assert (=> b!608200 m!584897))

(assert (=> b!608207 m!584851))

(declare-fun m!584899 () Bool)

(assert (=> b!608207 m!584899))

(assert (=> b!608207 m!584851))

(declare-fun m!584901 () Bool)

(assert (=> b!608207 m!584901))

(declare-fun m!584903 () Bool)

(assert (=> b!608207 m!584903))

(assert (=> b!608207 m!584851))

(declare-fun m!584905 () Bool)

(assert (=> b!608207 m!584905))

(declare-fun m!584907 () Bool)

(assert (=> b!608207 m!584907))

(declare-fun m!584909 () Bool)

(assert (=> b!608207 m!584909))

(declare-fun m!584911 () Bool)

(assert (=> b!608207 m!584911))

(assert (=> b!608207 m!584851))

(assert (=> b!608204 m!584851))

(assert (=> b!608204 m!584865))

(declare-fun m!584913 () Bool)

(assert (=> b!608204 m!584913))

(push 1)

