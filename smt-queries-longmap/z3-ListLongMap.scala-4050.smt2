; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55344 () Bool)

(assert start!55344)

(declare-fun b!605943 () Bool)

(declare-fun e!346863 () Bool)

(declare-datatypes ((List!11922 0))(
  ( (Nil!11919) (Cons!11918 (h!12963 (_ BitVec 64)) (t!18150 List!11922)) )
))
(declare-fun noDuplicate!304 (List!11922) Bool)

(assert (=> b!605943 (= e!346863 (noDuplicate!304 Nil!11919))))

(declare-fun b!605944 () Bool)

(declare-datatypes ((Unit!19306 0))(
  ( (Unit!19307) )
))
(declare-fun e!346858 () Unit!19306)

(declare-fun Unit!19308 () Unit!19306)

(assert (=> b!605944 (= e!346858 Unit!19308)))

(assert (=> b!605944 false))

(declare-fun b!605945 () Bool)

(declare-fun e!346869 () Bool)

(declare-fun e!346857 () Bool)

(assert (=> b!605945 (= e!346869 e!346857)))

(declare-fun res!389303 () Bool)

(assert (=> b!605945 (=> (not res!389303) (not e!346857))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37255 0))(
  ( (array!37256 (arr!17881 (Array (_ BitVec 32) (_ BitVec 64))) (size!18245 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37255)

(assert (=> b!605945 (= res!389303 (= (select (store (arr!17881 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!276534 () array!37255)

(assert (=> b!605945 (= lt!276534 (array!37256 (store (arr!17881 a!2986) i!1108 k0!1786) (size!18245 a!2986)))))

(declare-fun b!605946 () Bool)

(declare-fun res!389301 () Bool)

(declare-fun e!346868 () Bool)

(assert (=> b!605946 (=> (not res!389301) (not e!346868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605946 (= res!389301 (validKeyInArray!0 k0!1786))))

(declare-fun b!605947 () Bool)

(declare-fun e!346872 () Unit!19306)

(declare-fun Unit!19309 () Unit!19306)

(assert (=> b!605947 (= e!346872 Unit!19309)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!276536 () Unit!19306)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19306)

(assert (=> b!605947 (= lt!276536 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276534 (select (arr!17881 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605947 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276535 () Unit!19306)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11922) Unit!19306)

(assert (=> b!605947 (= lt!276535 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11919))))

(declare-fun arrayNoDuplicates!0 (array!37255 (_ BitVec 32) List!11922) Bool)

(assert (=> b!605947 (arrayNoDuplicates!0 lt!276534 #b00000000000000000000000000000000 Nil!11919)))

(declare-fun lt!276539 () Unit!19306)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37255 (_ BitVec 32) (_ BitVec 32)) Unit!19306)

(assert (=> b!605947 (= lt!276539 (lemmaNoDuplicateFromThenFromBigger!0 lt!276534 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605947 (arrayNoDuplicates!0 lt!276534 j!136 Nil!11919)))

(declare-fun lt!276546 () Unit!19306)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37255 (_ BitVec 64) (_ BitVec 32) List!11922) Unit!19306)

(assert (=> b!605947 (= lt!276546 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276534 (select (arr!17881 a!2986) j!136) j!136 Nil!11919))))

(assert (=> b!605947 false))

(declare-fun b!605948 () Bool)

(declare-fun e!346860 () Bool)

(declare-fun e!346866 () Bool)

(assert (=> b!605948 (= e!346860 e!346866)))

(declare-fun res!389313 () Bool)

(assert (=> b!605948 (=> res!389313 e!346866)))

(declare-fun lt!276547 () (_ BitVec 64))

(declare-fun lt!276542 () (_ BitVec 64))

(assert (=> b!605948 (= res!389313 (or (not (= (select (arr!17881 a!2986) j!136) lt!276547)) (not (= (select (arr!17881 a!2986) j!136) lt!276542)) (bvsge j!136 index!984)))))

(declare-fun res!389309 () Bool)

(assert (=> start!55344 (=> (not res!389309) (not e!346868))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55344 (= res!389309 (validMask!0 mask!3053))))

(assert (=> start!55344 e!346868))

(assert (=> start!55344 true))

(declare-fun array_inv!13677 (array!37255) Bool)

(assert (=> start!55344 (array_inv!13677 a!2986)))

(declare-fun b!605949 () Bool)

(declare-fun Unit!19310 () Unit!19306)

(assert (=> b!605949 (= e!346858 Unit!19310)))

(declare-fun b!605950 () Bool)

(declare-fun e!346865 () Bool)

(declare-fun e!346861 () Bool)

(assert (=> b!605950 (= e!346865 e!346861)))

(declare-fun res!389317 () Bool)

(assert (=> b!605950 (=> res!389317 e!346861)))

(assert (=> b!605950 (= res!389317 (or (not (= (select (arr!17881 a!2986) j!136) lt!276547)) (not (= (select (arr!17881 a!2986) j!136) lt!276542))))))

(assert (=> b!605950 e!346860))

(declare-fun res!389308 () Bool)

(assert (=> b!605950 (=> (not res!389308) (not e!346860))))

(assert (=> b!605950 (= res!389308 (= lt!276542 (select (arr!17881 a!2986) j!136)))))

(assert (=> b!605950 (= lt!276542 (select (store (arr!17881 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!605951 () Bool)

(declare-fun Unit!19311 () Unit!19306)

(assert (=> b!605951 (= e!346872 Unit!19311)))

(declare-fun b!605952 () Bool)

(assert (=> b!605952 (= e!346868 e!346869)))

(declare-fun res!389312 () Bool)

(assert (=> b!605952 (=> (not res!389312) (not e!346869))))

(declare-datatypes ((SeekEntryResult!6321 0))(
  ( (MissingZero!6321 (index!27553 (_ BitVec 32))) (Found!6321 (index!27554 (_ BitVec 32))) (Intermediate!6321 (undefined!7133 Bool) (index!27555 (_ BitVec 32)) (x!56356 (_ BitVec 32))) (Undefined!6321) (MissingVacant!6321 (index!27556 (_ BitVec 32))) )
))
(declare-fun lt!276538 () SeekEntryResult!6321)

(assert (=> b!605952 (= res!389312 (or (= lt!276538 (MissingZero!6321 i!1108)) (= lt!276538 (MissingVacant!6321 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37255 (_ BitVec 32)) SeekEntryResult!6321)

(assert (=> b!605952 (= lt!276538 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!605953 () Bool)

(declare-fun res!389315 () Bool)

(assert (=> b!605953 (=> (not res!389315) (not e!346868))))

(assert (=> b!605953 (= res!389315 (validKeyInArray!0 (select (arr!17881 a!2986) j!136)))))

(declare-fun b!605954 () Bool)

(declare-fun res!389305 () Bool)

(assert (=> b!605954 (=> (not res!389305) (not e!346868))))

(assert (=> b!605954 (= res!389305 (and (= (size!18245 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18245 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18245 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605955 () Bool)

(declare-fun e!346859 () Bool)

(declare-fun lt!276533 () SeekEntryResult!6321)

(declare-fun lt!276541 () SeekEntryResult!6321)

(assert (=> b!605955 (= e!346859 (= lt!276533 lt!276541))))

(declare-fun b!605956 () Bool)

(declare-fun res!389307 () Bool)

(assert (=> b!605956 (=> (not res!389307) (not e!346869))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!605956 (= res!389307 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17881 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605957 () Bool)

(declare-fun e!346867 () Bool)

(assert (=> b!605957 (= e!346867 e!346863)))

(declare-fun res!389314 () Bool)

(assert (=> b!605957 (=> res!389314 e!346863)))

(assert (=> b!605957 (= res!389314 (or (bvsgt #b00000000000000000000000000000000 (size!18245 a!2986)) (bvsge (size!18245 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!605957 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276537 () Unit!19306)

(assert (=> b!605957 (= lt!276537 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276534 (select (arr!17881 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!346862 () Bool)

(assert (=> b!605957 e!346862))

(declare-fun res!389311 () Bool)

(assert (=> b!605957 (=> (not res!389311) (not e!346862))))

(assert (=> b!605957 (= res!389311 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) j!136))))

(declare-fun b!605958 () Bool)

(declare-fun e!346864 () Bool)

(assert (=> b!605958 (= e!346864 (not e!346865))))

(declare-fun res!389318 () Bool)

(assert (=> b!605958 (=> res!389318 e!346865)))

(declare-fun lt!276544 () SeekEntryResult!6321)

(assert (=> b!605958 (= res!389318 (not (= lt!276544 (Found!6321 index!984))))))

(declare-fun lt!276540 () Unit!19306)

(assert (=> b!605958 (= lt!276540 e!346858)))

(declare-fun c!68689 () Bool)

(assert (=> b!605958 (= c!68689 (= lt!276544 Undefined!6321))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37255 (_ BitVec 32)) SeekEntryResult!6321)

(assert (=> b!605958 (= lt!276544 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276547 lt!276534 mask!3053))))

(assert (=> b!605958 e!346859))

(declare-fun res!389302 () Bool)

(assert (=> b!605958 (=> (not res!389302) (not e!346859))))

(declare-fun lt!276545 () (_ BitVec 32))

(assert (=> b!605958 (= res!389302 (= lt!276541 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 lt!276547 lt!276534 mask!3053)))))

(assert (=> b!605958 (= lt!276541 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!605958 (= lt!276547 (select (store (arr!17881 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276532 () Unit!19306)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37255 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19306)

(assert (=> b!605958 (= lt!276532 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605958 (= lt!276545 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!605959 () Bool)

(declare-fun e!346870 () Bool)

(assert (=> b!605959 (= e!346866 e!346870)))

(declare-fun res!389299 () Bool)

(assert (=> b!605959 (=> (not res!389299) (not e!346870))))

(assert (=> b!605959 (= res!389299 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) j!136))))

(declare-fun b!605960 () Bool)

(assert (=> b!605960 (= e!346861 e!346867)))

(declare-fun res!389304 () Bool)

(assert (=> b!605960 (=> res!389304 e!346867)))

(assert (=> b!605960 (= res!389304 (bvsge index!984 j!136))))

(declare-fun lt!276543 () Unit!19306)

(assert (=> b!605960 (= lt!276543 e!346872)))

(declare-fun c!68690 () Bool)

(assert (=> b!605960 (= c!68690 (bvslt j!136 index!984))))

(declare-fun b!605961 () Bool)

(declare-fun res!389300 () Bool)

(assert (=> b!605961 (=> (not res!389300) (not e!346869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37255 (_ BitVec 32)) Bool)

(assert (=> b!605961 (= res!389300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605962 () Bool)

(declare-fun res!389306 () Bool)

(assert (=> b!605962 (=> (not res!389306) (not e!346868))))

(assert (=> b!605962 (= res!389306 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605963 () Bool)

(declare-fun res!389310 () Bool)

(assert (=> b!605963 (=> (not res!389310) (not e!346869))))

(assert (=> b!605963 (= res!389310 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11919))))

(declare-fun b!605964 () Bool)

(assert (=> b!605964 (= e!346870 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) index!984))))

(declare-fun b!605965 () Bool)

(assert (=> b!605965 (= e!346862 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) index!984))))

(declare-fun b!605966 () Bool)

(assert (=> b!605966 (= e!346857 e!346864)))

(declare-fun res!389316 () Bool)

(assert (=> b!605966 (=> (not res!389316) (not e!346864))))

(assert (=> b!605966 (= res!389316 (and (= lt!276533 (Found!6321 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17881 a!2986) index!984) (select (arr!17881 a!2986) j!136))) (not (= (select (arr!17881 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!605966 (= lt!276533 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!55344 res!389309) b!605954))

(assert (= (and b!605954 res!389305) b!605953))

(assert (= (and b!605953 res!389315) b!605946))

(assert (= (and b!605946 res!389301) b!605962))

(assert (= (and b!605962 res!389306) b!605952))

(assert (= (and b!605952 res!389312) b!605961))

(assert (= (and b!605961 res!389300) b!605963))

(assert (= (and b!605963 res!389310) b!605956))

(assert (= (and b!605956 res!389307) b!605945))

(assert (= (and b!605945 res!389303) b!605966))

(assert (= (and b!605966 res!389316) b!605958))

(assert (= (and b!605958 res!389302) b!605955))

(assert (= (and b!605958 c!68689) b!605944))

(assert (= (and b!605958 (not c!68689)) b!605949))

(assert (= (and b!605958 (not res!389318)) b!605950))

(assert (= (and b!605950 res!389308) b!605948))

(assert (= (and b!605948 (not res!389313)) b!605959))

(assert (= (and b!605959 res!389299) b!605964))

(assert (= (and b!605950 (not res!389317)) b!605960))

(assert (= (and b!605960 c!68690) b!605947))

(assert (= (and b!605960 (not c!68690)) b!605951))

(assert (= (and b!605960 (not res!389304)) b!605957))

(assert (= (and b!605957 res!389311) b!605965))

(assert (= (and b!605957 (not res!389314)) b!605943))

(declare-fun m!582779 () Bool)

(assert (=> b!605947 m!582779))

(declare-fun m!582781 () Bool)

(assert (=> b!605947 m!582781))

(declare-fun m!582783 () Bool)

(assert (=> b!605947 m!582783))

(declare-fun m!582785 () Bool)

(assert (=> b!605947 m!582785))

(assert (=> b!605947 m!582783))

(declare-fun m!582787 () Bool)

(assert (=> b!605947 m!582787))

(declare-fun m!582789 () Bool)

(assert (=> b!605947 m!582789))

(declare-fun m!582791 () Bool)

(assert (=> b!605947 m!582791))

(assert (=> b!605947 m!582783))

(declare-fun m!582793 () Bool)

(assert (=> b!605947 m!582793))

(assert (=> b!605947 m!582783))

(declare-fun m!582795 () Bool)

(assert (=> b!605966 m!582795))

(assert (=> b!605966 m!582783))

(assert (=> b!605966 m!582783))

(declare-fun m!582797 () Bool)

(assert (=> b!605966 m!582797))

(assert (=> b!605964 m!582783))

(assert (=> b!605964 m!582783))

(declare-fun m!582799 () Bool)

(assert (=> b!605964 m!582799))

(declare-fun m!582801 () Bool)

(assert (=> b!605962 m!582801))

(assert (=> b!605948 m!582783))

(assert (=> b!605957 m!582783))

(assert (=> b!605957 m!582783))

(declare-fun m!582803 () Bool)

(assert (=> b!605957 m!582803))

(assert (=> b!605957 m!582783))

(declare-fun m!582805 () Bool)

(assert (=> b!605957 m!582805))

(assert (=> b!605957 m!582783))

(declare-fun m!582807 () Bool)

(assert (=> b!605957 m!582807))

(assert (=> b!605950 m!582783))

(declare-fun m!582809 () Bool)

(assert (=> b!605950 m!582809))

(declare-fun m!582811 () Bool)

(assert (=> b!605950 m!582811))

(assert (=> b!605965 m!582783))

(assert (=> b!605965 m!582783))

(assert (=> b!605965 m!582799))

(assert (=> b!605953 m!582783))

(assert (=> b!605953 m!582783))

(declare-fun m!582813 () Bool)

(assert (=> b!605953 m!582813))

(declare-fun m!582815 () Bool)

(assert (=> b!605943 m!582815))

(declare-fun m!582817 () Bool)

(assert (=> start!55344 m!582817))

(declare-fun m!582819 () Bool)

(assert (=> start!55344 m!582819))

(assert (=> b!605959 m!582783))

(assert (=> b!605959 m!582783))

(assert (=> b!605959 m!582807))

(declare-fun m!582821 () Bool)

(assert (=> b!605952 m!582821))

(declare-fun m!582823 () Bool)

(assert (=> b!605961 m!582823))

(assert (=> b!605945 m!582809))

(declare-fun m!582825 () Bool)

(assert (=> b!605945 m!582825))

(declare-fun m!582827 () Bool)

(assert (=> b!605963 m!582827))

(declare-fun m!582829 () Bool)

(assert (=> b!605956 m!582829))

(declare-fun m!582831 () Bool)

(assert (=> b!605946 m!582831))

(declare-fun m!582833 () Bool)

(assert (=> b!605958 m!582833))

(declare-fun m!582835 () Bool)

(assert (=> b!605958 m!582835))

(assert (=> b!605958 m!582783))

(declare-fun m!582837 () Bool)

(assert (=> b!605958 m!582837))

(assert (=> b!605958 m!582809))

(assert (=> b!605958 m!582783))

(declare-fun m!582839 () Bool)

(assert (=> b!605958 m!582839))

(declare-fun m!582841 () Bool)

(assert (=> b!605958 m!582841))

(declare-fun m!582843 () Bool)

(assert (=> b!605958 m!582843))

(check-sat (not b!605953) (not b!605966) (not b!605957) (not start!55344) (not b!605964) (not b!605958) (not b!605952) (not b!605962) (not b!605943) (not b!605965) (not b!605947) (not b!605946) (not b!605963) (not b!605961) (not b!605959))
(check-sat)
(get-model)

(declare-fun d!87743 () Bool)

(declare-fun res!389383 () Bool)

(declare-fun e!346925 () Bool)

(assert (=> d!87743 (=> res!389383 e!346925)))

(assert (=> d!87743 (= res!389383 (= (select (arr!17881 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87743 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!346925)))

(declare-fun b!606043 () Bool)

(declare-fun e!346926 () Bool)

(assert (=> b!606043 (= e!346925 e!346926)))

(declare-fun res!389384 () Bool)

(assert (=> b!606043 (=> (not res!389384) (not e!346926))))

(assert (=> b!606043 (= res!389384 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18245 a!2986)))))

(declare-fun b!606044 () Bool)

(assert (=> b!606044 (= e!346926 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87743 (not res!389383)) b!606043))

(assert (= (and b!606043 res!389384) b!606044))

(declare-fun m!582911 () Bool)

(assert (=> d!87743 m!582911))

(declare-fun m!582913 () Bool)

(assert (=> b!606044 m!582913))

(assert (=> b!605962 d!87743))

(declare-fun b!606053 () Bool)

(declare-fun e!346934 () Bool)

(declare-fun call!33065 () Bool)

(assert (=> b!606053 (= e!346934 call!33065)))

(declare-fun b!606054 () Bool)

(declare-fun e!346933 () Bool)

(assert (=> b!606054 (= e!346933 call!33065)))

(declare-fun b!606055 () Bool)

(assert (=> b!606055 (= e!346934 e!346933)))

(declare-fun lt!276602 () (_ BitVec 64))

(assert (=> b!606055 (= lt!276602 (select (arr!17881 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276603 () Unit!19306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37255 (_ BitVec 64) (_ BitVec 32)) Unit!19306)

(assert (=> b!606055 (= lt!276603 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276602 #b00000000000000000000000000000000))))

(assert (=> b!606055 (arrayContainsKey!0 a!2986 lt!276602 #b00000000000000000000000000000000)))

(declare-fun lt!276604 () Unit!19306)

(assert (=> b!606055 (= lt!276604 lt!276603)))

(declare-fun res!389389 () Bool)

(assert (=> b!606055 (= res!389389 (= (seekEntryOrOpen!0 (select (arr!17881 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6321 #b00000000000000000000000000000000)))))

(assert (=> b!606055 (=> (not res!389389) (not e!346933))))

(declare-fun d!87745 () Bool)

(declare-fun res!389390 () Bool)

(declare-fun e!346935 () Bool)

(assert (=> d!87745 (=> res!389390 e!346935)))

(assert (=> d!87745 (= res!389390 (bvsge #b00000000000000000000000000000000 (size!18245 a!2986)))))

(assert (=> d!87745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346935)))

(declare-fun bm!33062 () Bool)

(assert (=> bm!33062 (= call!33065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!606056 () Bool)

(assert (=> b!606056 (= e!346935 e!346934)))

(declare-fun c!68699 () Bool)

(assert (=> b!606056 (= c!68699 (validKeyInArray!0 (select (arr!17881 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87745 (not res!389390)) b!606056))

(assert (= (and b!606056 c!68699) b!606055))

(assert (= (and b!606056 (not c!68699)) b!606053))

(assert (= (and b!606055 res!389389) b!606054))

(assert (= (or b!606054 b!606053) bm!33062))

(assert (=> b!606055 m!582911))

(declare-fun m!582915 () Bool)

(assert (=> b!606055 m!582915))

(declare-fun m!582917 () Bool)

(assert (=> b!606055 m!582917))

(assert (=> b!606055 m!582911))

(declare-fun m!582919 () Bool)

(assert (=> b!606055 m!582919))

(declare-fun m!582921 () Bool)

(assert (=> bm!33062 m!582921))

(assert (=> b!606056 m!582911))

(assert (=> b!606056 m!582911))

(declare-fun m!582923 () Bool)

(assert (=> b!606056 m!582923))

(assert (=> b!605961 d!87745))

(declare-fun d!87747 () Bool)

(declare-fun res!389391 () Bool)

(declare-fun e!346936 () Bool)

(assert (=> d!87747 (=> res!389391 e!346936)))

(assert (=> d!87747 (= res!389391 (= (select (arr!17881 lt!276534) index!984) (select (arr!17881 a!2986) j!136)))))

(assert (=> d!87747 (= (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) index!984) e!346936)))

(declare-fun b!606057 () Bool)

(declare-fun e!346937 () Bool)

(assert (=> b!606057 (= e!346936 e!346937)))

(declare-fun res!389392 () Bool)

(assert (=> b!606057 (=> (not res!389392) (not e!346937))))

(assert (=> b!606057 (= res!389392 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18245 lt!276534)))))

(declare-fun b!606058 () Bool)

(assert (=> b!606058 (= e!346937 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87747 (not res!389391)) b!606057))

(assert (= (and b!606057 res!389392) b!606058))

(declare-fun m!582925 () Bool)

(assert (=> d!87747 m!582925))

(assert (=> b!606058 m!582783))

(declare-fun m!582927 () Bool)

(assert (=> b!606058 m!582927))

(assert (=> b!605964 d!87747))

(declare-fun d!87749 () Bool)

(declare-fun res!389397 () Bool)

(declare-fun e!346942 () Bool)

(assert (=> d!87749 (=> res!389397 e!346942)))

(get-info :version)

(assert (=> d!87749 (= res!389397 ((_ is Nil!11919) Nil!11919))))

(assert (=> d!87749 (= (noDuplicate!304 Nil!11919) e!346942)))

(declare-fun b!606063 () Bool)

(declare-fun e!346943 () Bool)

(assert (=> b!606063 (= e!346942 e!346943)))

(declare-fun res!389398 () Bool)

(assert (=> b!606063 (=> (not res!389398) (not e!346943))))

(declare-fun contains!2997 (List!11922 (_ BitVec 64)) Bool)

(assert (=> b!606063 (= res!389398 (not (contains!2997 (t!18150 Nil!11919) (h!12963 Nil!11919))))))

(declare-fun b!606064 () Bool)

(assert (=> b!606064 (= e!346943 (noDuplicate!304 (t!18150 Nil!11919)))))

(assert (= (and d!87749 (not res!389397)) b!606063))

(assert (= (and b!606063 res!389398) b!606064))

(declare-fun m!582929 () Bool)

(assert (=> b!606063 m!582929))

(declare-fun m!582931 () Bool)

(assert (=> b!606064 m!582931))

(assert (=> b!605943 d!87749))

(assert (=> b!605965 d!87747))

(declare-fun b!606077 () Bool)

(declare-fun e!346952 () SeekEntryResult!6321)

(declare-fun lt!276612 () SeekEntryResult!6321)

(assert (=> b!606077 (= e!346952 (MissingZero!6321 (index!27555 lt!276612)))))

(declare-fun b!606078 () Bool)

(declare-fun c!68708 () Bool)

(declare-fun lt!276611 () (_ BitVec 64))

(assert (=> b!606078 (= c!68708 (= lt!276611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346950 () SeekEntryResult!6321)

(assert (=> b!606078 (= e!346950 e!346952)))

(declare-fun b!606079 () Bool)

(assert (=> b!606079 (= e!346950 (Found!6321 (index!27555 lt!276612)))))

(declare-fun b!606080 () Bool)

(declare-fun e!346951 () SeekEntryResult!6321)

(assert (=> b!606080 (= e!346951 e!346950)))

(assert (=> b!606080 (= lt!276611 (select (arr!17881 a!2986) (index!27555 lt!276612)))))

(declare-fun c!68707 () Bool)

(assert (=> b!606080 (= c!68707 (= lt!276611 k0!1786))))

(declare-fun b!606081 () Bool)

(assert (=> b!606081 (= e!346952 (seekKeyOrZeroReturnVacant!0 (x!56356 lt!276612) (index!27555 lt!276612) (index!27555 lt!276612) k0!1786 a!2986 mask!3053))))

(declare-fun b!606082 () Bool)

(assert (=> b!606082 (= e!346951 Undefined!6321)))

(declare-fun d!87751 () Bool)

(declare-fun lt!276613 () SeekEntryResult!6321)

(assert (=> d!87751 (and (or ((_ is Undefined!6321) lt!276613) (not ((_ is Found!6321) lt!276613)) (and (bvsge (index!27554 lt!276613) #b00000000000000000000000000000000) (bvslt (index!27554 lt!276613) (size!18245 a!2986)))) (or ((_ is Undefined!6321) lt!276613) ((_ is Found!6321) lt!276613) (not ((_ is MissingZero!6321) lt!276613)) (and (bvsge (index!27553 lt!276613) #b00000000000000000000000000000000) (bvslt (index!27553 lt!276613) (size!18245 a!2986)))) (or ((_ is Undefined!6321) lt!276613) ((_ is Found!6321) lt!276613) ((_ is MissingZero!6321) lt!276613) (not ((_ is MissingVacant!6321) lt!276613)) (and (bvsge (index!27556 lt!276613) #b00000000000000000000000000000000) (bvslt (index!27556 lt!276613) (size!18245 a!2986)))) (or ((_ is Undefined!6321) lt!276613) (ite ((_ is Found!6321) lt!276613) (= (select (arr!17881 a!2986) (index!27554 lt!276613)) k0!1786) (ite ((_ is MissingZero!6321) lt!276613) (= (select (arr!17881 a!2986) (index!27553 lt!276613)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6321) lt!276613) (= (select (arr!17881 a!2986) (index!27556 lt!276613)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87751 (= lt!276613 e!346951)))

(declare-fun c!68706 () Bool)

(assert (=> d!87751 (= c!68706 (and ((_ is Intermediate!6321) lt!276612) (undefined!7133 lt!276612)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37255 (_ BitVec 32)) SeekEntryResult!6321)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87751 (= lt!276612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87751 (validMask!0 mask!3053)))

(assert (=> d!87751 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276613)))

(assert (= (and d!87751 c!68706) b!606082))

(assert (= (and d!87751 (not c!68706)) b!606080))

(assert (= (and b!606080 c!68707) b!606079))

(assert (= (and b!606080 (not c!68707)) b!606078))

(assert (= (and b!606078 c!68708) b!606077))

(assert (= (and b!606078 (not c!68708)) b!606081))

(declare-fun m!582933 () Bool)

(assert (=> b!606080 m!582933))

(declare-fun m!582935 () Bool)

(assert (=> b!606081 m!582935))

(declare-fun m!582937 () Bool)

(assert (=> d!87751 m!582937))

(declare-fun m!582939 () Bool)

(assert (=> d!87751 m!582939))

(declare-fun m!582941 () Bool)

(assert (=> d!87751 m!582941))

(declare-fun m!582943 () Bool)

(assert (=> d!87751 m!582943))

(assert (=> d!87751 m!582817))

(assert (=> d!87751 m!582943))

(declare-fun m!582945 () Bool)

(assert (=> d!87751 m!582945))

(assert (=> b!605952 d!87751))

(declare-fun b!606107 () Bool)

(declare-fun e!346975 () Bool)

(declare-fun e!346977 () Bool)

(assert (=> b!606107 (= e!346975 e!346977)))

(declare-fun res!389420 () Bool)

(assert (=> b!606107 (=> (not res!389420) (not e!346977))))

(declare-fun e!346978 () Bool)

(assert (=> b!606107 (= res!389420 (not e!346978))))

(declare-fun res!389419 () Bool)

(assert (=> b!606107 (=> (not res!389419) (not e!346978))))

(assert (=> b!606107 (= res!389419 (validKeyInArray!0 (select (arr!17881 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606108 () Bool)

(declare-fun e!346976 () Bool)

(declare-fun call!33068 () Bool)

(assert (=> b!606108 (= e!346976 call!33068)))

(declare-fun b!606109 () Bool)

(assert (=> b!606109 (= e!346977 e!346976)))

(declare-fun c!68711 () Bool)

(assert (=> b!606109 (= c!68711 (validKeyInArray!0 (select (arr!17881 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87755 () Bool)

(declare-fun res!389421 () Bool)

(assert (=> d!87755 (=> res!389421 e!346975)))

(assert (=> d!87755 (= res!389421 (bvsge #b00000000000000000000000000000000 (size!18245 a!2986)))))

(assert (=> d!87755 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11919) e!346975)))

(declare-fun b!606110 () Bool)

(assert (=> b!606110 (= e!346978 (contains!2997 Nil!11919 (select (arr!17881 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606111 () Bool)

(assert (=> b!606111 (= e!346976 call!33068)))

(declare-fun bm!33065 () Bool)

(assert (=> bm!33065 (= call!33068 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68711 (Cons!11918 (select (arr!17881 a!2986) #b00000000000000000000000000000000) Nil!11919) Nil!11919)))))

(assert (= (and d!87755 (not res!389421)) b!606107))

(assert (= (and b!606107 res!389419) b!606110))

(assert (= (and b!606107 res!389420) b!606109))

(assert (= (and b!606109 c!68711) b!606111))

(assert (= (and b!606109 (not c!68711)) b!606108))

(assert (= (or b!606111 b!606108) bm!33065))

(assert (=> b!606107 m!582911))

(assert (=> b!606107 m!582911))

(assert (=> b!606107 m!582923))

(assert (=> b!606109 m!582911))

(assert (=> b!606109 m!582911))

(assert (=> b!606109 m!582923))

(assert (=> b!606110 m!582911))

(assert (=> b!606110 m!582911))

(declare-fun m!582961 () Bool)

(assert (=> b!606110 m!582961))

(assert (=> bm!33065 m!582911))

(declare-fun m!582963 () Bool)

(assert (=> bm!33065 m!582963))

(assert (=> b!605963 d!87755))

(declare-fun d!87765 () Bool)

(assert (=> d!87765 (= (validKeyInArray!0 (select (arr!17881 a!2986) j!136)) (and (not (= (select (arr!17881 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17881 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605953 d!87765))

(declare-fun d!87769 () Bool)

(assert (=> d!87769 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55344 d!87769))

(declare-fun d!87777 () Bool)

(assert (=> d!87777 (= (array_inv!13677 a!2986) (bvsge (size!18245 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55344 d!87777))

(declare-fun d!87779 () Bool)

(assert (=> d!87779 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605946 d!87779))

(declare-fun d!87781 () Bool)

(declare-fun res!389430 () Bool)

(declare-fun e!346987 () Bool)

(assert (=> d!87781 (=> res!389430 e!346987)))

(assert (=> d!87781 (= res!389430 (= (select (arr!17881 lt!276534) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17881 a!2986) j!136)))))

(assert (=> d!87781 (= (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346987)))

(declare-fun b!606120 () Bool)

(declare-fun e!346988 () Bool)

(assert (=> b!606120 (= e!346987 e!346988)))

(declare-fun res!389431 () Bool)

(assert (=> b!606120 (=> (not res!389431) (not e!346988))))

(assert (=> b!606120 (= res!389431 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18245 lt!276534)))))

(declare-fun b!606121 () Bool)

(assert (=> b!606121 (= e!346988 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87781 (not res!389430)) b!606120))

(assert (= (and b!606120 res!389431) b!606121))

(declare-fun m!582973 () Bool)

(assert (=> d!87781 m!582973))

(assert (=> b!606121 m!582783))

(declare-fun m!582975 () Bool)

(assert (=> b!606121 m!582975))

(assert (=> b!605957 d!87781))

(declare-fun d!87787 () Bool)

(assert (=> d!87787 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276619 () Unit!19306)

(declare-fun choose!114 (array!37255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19306)

(assert (=> d!87787 (= lt!276619 (choose!114 lt!276534 (select (arr!17881 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87787 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87787 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276534 (select (arr!17881 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276619)))

(declare-fun bs!18539 () Bool)

(assert (= bs!18539 d!87787))

(assert (=> bs!18539 m!582783))

(assert (=> bs!18539 m!582803))

(assert (=> bs!18539 m!582783))

(declare-fun m!582977 () Bool)

(assert (=> bs!18539 m!582977))

(assert (=> b!605957 d!87787))

(declare-fun d!87789 () Bool)

(declare-fun res!389432 () Bool)

(declare-fun e!346989 () Bool)

(assert (=> d!87789 (=> res!389432 e!346989)))

(assert (=> d!87789 (= res!389432 (= (select (arr!17881 lt!276534) j!136) (select (arr!17881 a!2986) j!136)))))

(assert (=> d!87789 (= (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) j!136) e!346989)))

(declare-fun b!606122 () Bool)

(declare-fun e!346990 () Bool)

(assert (=> b!606122 (= e!346989 e!346990)))

(declare-fun res!389433 () Bool)

(assert (=> b!606122 (=> (not res!389433) (not e!346990))))

(assert (=> b!606122 (= res!389433 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18245 lt!276534)))))

(declare-fun b!606123 () Bool)

(assert (=> b!606123 (= e!346990 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87789 (not res!389432)) b!606122))

(assert (= (and b!606122 res!389433) b!606123))

(declare-fun m!582979 () Bool)

(assert (=> d!87789 m!582979))

(assert (=> b!606123 m!582783))

(declare-fun m!582981 () Bool)

(assert (=> b!606123 m!582981))

(assert (=> b!605957 d!87789))

(declare-fun b!606196 () Bool)

(declare-fun c!68737 () Bool)

(declare-fun lt!276639 () (_ BitVec 64))

(assert (=> b!606196 (= c!68737 (= lt!276639 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347042 () SeekEntryResult!6321)

(declare-fun e!347041 () SeekEntryResult!6321)

(assert (=> b!606196 (= e!347042 e!347041)))

(declare-fun b!606197 () Bool)

(assert (=> b!606197 (= e!347041 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!276640 () SeekEntryResult!6321)

(declare-fun d!87791 () Bool)

(assert (=> d!87791 (and (or ((_ is Undefined!6321) lt!276640) (not ((_ is Found!6321) lt!276640)) (and (bvsge (index!27554 lt!276640) #b00000000000000000000000000000000) (bvslt (index!27554 lt!276640) (size!18245 a!2986)))) (or ((_ is Undefined!6321) lt!276640) ((_ is Found!6321) lt!276640) (not ((_ is MissingVacant!6321) lt!276640)) (not (= (index!27556 lt!276640) vacantSpotIndex!68)) (and (bvsge (index!27556 lt!276640) #b00000000000000000000000000000000) (bvslt (index!27556 lt!276640) (size!18245 a!2986)))) (or ((_ is Undefined!6321) lt!276640) (ite ((_ is Found!6321) lt!276640) (= (select (arr!17881 a!2986) (index!27554 lt!276640)) (select (arr!17881 a!2986) j!136)) (and ((_ is MissingVacant!6321) lt!276640) (= (index!27556 lt!276640) vacantSpotIndex!68) (= (select (arr!17881 a!2986) (index!27556 lt!276640)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!347040 () SeekEntryResult!6321)

(assert (=> d!87791 (= lt!276640 e!347040)))

(declare-fun c!68736 () Bool)

(assert (=> d!87791 (= c!68736 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87791 (= lt!276639 (select (arr!17881 a!2986) index!984))))

(assert (=> d!87791 (validMask!0 mask!3053)))

(assert (=> d!87791 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053) lt!276640)))

(declare-fun b!606198 () Bool)

(assert (=> b!606198 (= e!347040 Undefined!6321)))

(declare-fun b!606199 () Bool)

(assert (=> b!606199 (= e!347041 (MissingVacant!6321 vacantSpotIndex!68))))

(declare-fun b!606200 () Bool)

(assert (=> b!606200 (= e!347040 e!347042)))

(declare-fun c!68735 () Bool)

(assert (=> b!606200 (= c!68735 (= lt!276639 (select (arr!17881 a!2986) j!136)))))

(declare-fun b!606201 () Bool)

(assert (=> b!606201 (= e!347042 (Found!6321 index!984))))

(assert (= (and d!87791 c!68736) b!606198))

(assert (= (and d!87791 (not c!68736)) b!606200))

(assert (= (and b!606200 c!68735) b!606201))

(assert (= (and b!606200 (not c!68735)) b!606196))

(assert (= (and b!606196 c!68737) b!606199))

(assert (= (and b!606196 (not c!68737)) b!606197))

(assert (=> b!606197 m!582833))

(assert (=> b!606197 m!582833))

(assert (=> b!606197 m!582783))

(declare-fun m!583033 () Bool)

(assert (=> b!606197 m!583033))

(declare-fun m!583035 () Bool)

(assert (=> d!87791 m!583035))

(declare-fun m!583037 () Bool)

(assert (=> d!87791 m!583037))

(assert (=> d!87791 m!582795))

(assert (=> d!87791 m!582817))

(assert (=> b!605966 d!87791))

(assert (=> b!605959 d!87789))

(declare-fun d!87813 () Bool)

(assert (=> d!87813 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18245 lt!276534)) (not (= (select (arr!17881 lt!276534) j!136) (select (arr!17881 a!2986) j!136))))))

(declare-fun lt!276648 () Unit!19306)

(declare-fun choose!21 (array!37255 (_ BitVec 64) (_ BitVec 32) List!11922) Unit!19306)

(assert (=> d!87813 (= lt!276648 (choose!21 lt!276534 (select (arr!17881 a!2986) j!136) j!136 Nil!11919))))

(assert (=> d!87813 (bvslt (size!18245 lt!276534) #b01111111111111111111111111111111)))

(assert (=> d!87813 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276534 (select (arr!17881 a!2986) j!136) j!136 Nil!11919) lt!276648)))

(declare-fun bs!18544 () Bool)

(assert (= bs!18544 d!87813))

(assert (=> bs!18544 m!582979))

(assert (=> bs!18544 m!582783))

(declare-fun m!583041 () Bool)

(assert (=> bs!18544 m!583041))

(assert (=> b!605947 d!87813))

(declare-fun d!87817 () Bool)

(declare-fun res!389464 () Bool)

(declare-fun e!347047 () Bool)

(assert (=> d!87817 (=> res!389464 e!347047)))

(assert (=> d!87817 (= res!389464 (= (select (arr!17881 lt!276534) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17881 a!2986) j!136)))))

(assert (=> d!87817 (= (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347047)))

(declare-fun b!606206 () Bool)

(declare-fun e!347048 () Bool)

(assert (=> b!606206 (= e!347047 e!347048)))

(declare-fun res!389465 () Bool)

(assert (=> b!606206 (=> (not res!389465) (not e!347048))))

(assert (=> b!606206 (= res!389465 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18245 lt!276534)))))

(declare-fun b!606207 () Bool)

(assert (=> b!606207 (= e!347048 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87817 (not res!389464)) b!606206))

(assert (= (and b!606206 res!389465) b!606207))

(declare-fun m!583043 () Bool)

(assert (=> d!87817 m!583043))

(assert (=> b!606207 m!582783))

(declare-fun m!583045 () Bool)

(assert (=> b!606207 m!583045))

(assert (=> b!605947 d!87817))

(declare-fun d!87819 () Bool)

(assert (=> d!87819 (arrayContainsKey!0 lt!276534 (select (arr!17881 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276649 () Unit!19306)

(assert (=> d!87819 (= lt!276649 (choose!114 lt!276534 (select (arr!17881 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87819 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87819 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276534 (select (arr!17881 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276649)))

(declare-fun bs!18545 () Bool)

(assert (= bs!18545 d!87819))

(assert (=> bs!18545 m!582783))

(assert (=> bs!18545 m!582793))

(assert (=> bs!18545 m!582783))

(declare-fun m!583047 () Bool)

(assert (=> bs!18545 m!583047))

(assert (=> b!605947 d!87819))

(declare-fun d!87821 () Bool)

(assert (=> d!87821 (arrayNoDuplicates!0 lt!276534 j!136 Nil!11919)))

(declare-fun lt!276657 () Unit!19306)

(declare-fun choose!39 (array!37255 (_ BitVec 32) (_ BitVec 32)) Unit!19306)

(assert (=> d!87821 (= lt!276657 (choose!39 lt!276534 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87821 (bvslt (size!18245 lt!276534) #b01111111111111111111111111111111)))

(assert (=> d!87821 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276534 #b00000000000000000000000000000000 j!136) lt!276657)))

(declare-fun bs!18548 () Bool)

(assert (= bs!18548 d!87821))

(assert (=> bs!18548 m!582779))

(declare-fun m!583057 () Bool)

(assert (=> bs!18548 m!583057))

(assert (=> b!605947 d!87821))

(declare-fun b!606209 () Bool)

(declare-fun e!347050 () Bool)

(declare-fun e!347052 () Bool)

(assert (=> b!606209 (= e!347050 e!347052)))

(declare-fun res!389468 () Bool)

(assert (=> b!606209 (=> (not res!389468) (not e!347052))))

(declare-fun e!347053 () Bool)

(assert (=> b!606209 (= res!389468 (not e!347053))))

(declare-fun res!389467 () Bool)

(assert (=> b!606209 (=> (not res!389467) (not e!347053))))

(assert (=> b!606209 (= res!389467 (validKeyInArray!0 (select (arr!17881 lt!276534) j!136)))))

(declare-fun b!606210 () Bool)

(declare-fun e!347051 () Bool)

(declare-fun call!33077 () Bool)

(assert (=> b!606210 (= e!347051 call!33077)))

(declare-fun b!606211 () Bool)

(assert (=> b!606211 (= e!347052 e!347051)))

(declare-fun c!68738 () Bool)

(assert (=> b!606211 (= c!68738 (validKeyInArray!0 (select (arr!17881 lt!276534) j!136)))))

(declare-fun d!87829 () Bool)

(declare-fun res!389469 () Bool)

(assert (=> d!87829 (=> res!389469 e!347050)))

(assert (=> d!87829 (= res!389469 (bvsge j!136 (size!18245 lt!276534)))))

(assert (=> d!87829 (= (arrayNoDuplicates!0 lt!276534 j!136 Nil!11919) e!347050)))

(declare-fun b!606212 () Bool)

(assert (=> b!606212 (= e!347053 (contains!2997 Nil!11919 (select (arr!17881 lt!276534) j!136)))))

(declare-fun b!606213 () Bool)

(assert (=> b!606213 (= e!347051 call!33077)))

(declare-fun bm!33074 () Bool)

(assert (=> bm!33074 (= call!33077 (arrayNoDuplicates!0 lt!276534 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68738 (Cons!11918 (select (arr!17881 lt!276534) j!136) Nil!11919) Nil!11919)))))

(assert (= (and d!87829 (not res!389469)) b!606209))

(assert (= (and b!606209 res!389467) b!606212))

(assert (= (and b!606209 res!389468) b!606211))

(assert (= (and b!606211 c!68738) b!606213))

(assert (= (and b!606211 (not c!68738)) b!606210))

(assert (= (or b!606213 b!606210) bm!33074))

(assert (=> b!606209 m!582979))

(assert (=> b!606209 m!582979))

(declare-fun m!583059 () Bool)

(assert (=> b!606209 m!583059))

(assert (=> b!606211 m!582979))

(assert (=> b!606211 m!582979))

(assert (=> b!606211 m!583059))

(assert (=> b!606212 m!582979))

(assert (=> b!606212 m!582979))

(declare-fun m!583061 () Bool)

(assert (=> b!606212 m!583061))

(assert (=> bm!33074 m!582979))

(declare-fun m!583063 () Bool)

(assert (=> bm!33074 m!583063))

(assert (=> b!605947 d!87829))

(declare-fun d!87831 () Bool)

(declare-fun e!347059 () Bool)

(assert (=> d!87831 e!347059))

(declare-fun res!389475 () Bool)

(assert (=> d!87831 (=> (not res!389475) (not e!347059))))

(assert (=> d!87831 (= res!389475 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18245 a!2986))))))

(declare-fun lt!276663 () Unit!19306)

(declare-fun choose!41 (array!37255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11922) Unit!19306)

(assert (=> d!87831 (= lt!276663 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11919))))

(assert (=> d!87831 (bvslt (size!18245 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87831 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11919) lt!276663)))

(declare-fun b!606219 () Bool)

(assert (=> b!606219 (= e!347059 (arrayNoDuplicates!0 (array!37256 (store (arr!17881 a!2986) i!1108 k0!1786) (size!18245 a!2986)) #b00000000000000000000000000000000 Nil!11919))))

(assert (= (and d!87831 res!389475) b!606219))

(declare-fun m!583069 () Bool)

(assert (=> d!87831 m!583069))

(assert (=> b!606219 m!582809))

(declare-fun m!583071 () Bool)

(assert (=> b!606219 m!583071))

(assert (=> b!605947 d!87831))

(declare-fun b!606220 () Bool)

(declare-fun e!347060 () Bool)

(declare-fun e!347062 () Bool)

(assert (=> b!606220 (= e!347060 e!347062)))

(declare-fun res!389477 () Bool)

(assert (=> b!606220 (=> (not res!389477) (not e!347062))))

(declare-fun e!347063 () Bool)

(assert (=> b!606220 (= res!389477 (not e!347063))))

(declare-fun res!389476 () Bool)

(assert (=> b!606220 (=> (not res!389476) (not e!347063))))

(assert (=> b!606220 (= res!389476 (validKeyInArray!0 (select (arr!17881 lt!276534) #b00000000000000000000000000000000)))))

(declare-fun b!606221 () Bool)

(declare-fun e!347061 () Bool)

(declare-fun call!33078 () Bool)

(assert (=> b!606221 (= e!347061 call!33078)))

(declare-fun b!606222 () Bool)

(assert (=> b!606222 (= e!347062 e!347061)))

(declare-fun c!68739 () Bool)

(assert (=> b!606222 (= c!68739 (validKeyInArray!0 (select (arr!17881 lt!276534) #b00000000000000000000000000000000)))))

(declare-fun d!87835 () Bool)

(declare-fun res!389478 () Bool)

(assert (=> d!87835 (=> res!389478 e!347060)))

(assert (=> d!87835 (= res!389478 (bvsge #b00000000000000000000000000000000 (size!18245 lt!276534)))))

(assert (=> d!87835 (= (arrayNoDuplicates!0 lt!276534 #b00000000000000000000000000000000 Nil!11919) e!347060)))

(declare-fun b!606223 () Bool)

(assert (=> b!606223 (= e!347063 (contains!2997 Nil!11919 (select (arr!17881 lt!276534) #b00000000000000000000000000000000)))))

(declare-fun b!606224 () Bool)

(assert (=> b!606224 (= e!347061 call!33078)))

(declare-fun bm!33075 () Bool)

(assert (=> bm!33075 (= call!33078 (arrayNoDuplicates!0 lt!276534 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68739 (Cons!11918 (select (arr!17881 lt!276534) #b00000000000000000000000000000000) Nil!11919) Nil!11919)))))

(assert (= (and d!87835 (not res!389478)) b!606220))

(assert (= (and b!606220 res!389476) b!606223))

(assert (= (and b!606220 res!389477) b!606222))

(assert (= (and b!606222 c!68739) b!606224))

(assert (= (and b!606222 (not c!68739)) b!606221))

(assert (= (or b!606224 b!606221) bm!33075))

(declare-fun m!583073 () Bool)

(assert (=> b!606220 m!583073))

(assert (=> b!606220 m!583073))

(declare-fun m!583075 () Bool)

(assert (=> b!606220 m!583075))

(assert (=> b!606222 m!583073))

(assert (=> b!606222 m!583073))

(assert (=> b!606222 m!583075))

(assert (=> b!606223 m!583073))

(assert (=> b!606223 m!583073))

(declare-fun m!583077 () Bool)

(assert (=> b!606223 m!583077))

(assert (=> bm!33075 m!583073))

(declare-fun m!583079 () Bool)

(assert (=> bm!33075 m!583079))

(assert (=> b!605947 d!87835))

(declare-fun b!606225 () Bool)

(declare-fun c!68742 () Bool)

(declare-fun lt!276664 () (_ BitVec 64))

(assert (=> b!606225 (= c!68742 (= lt!276664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347066 () SeekEntryResult!6321)

(declare-fun e!347065 () SeekEntryResult!6321)

(assert (=> b!606225 (= e!347066 e!347065)))

(declare-fun b!606226 () Bool)

(assert (=> b!606226 (= e!347065 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276545 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!276665 () SeekEntryResult!6321)

(declare-fun d!87837 () Bool)

(assert (=> d!87837 (and (or ((_ is Undefined!6321) lt!276665) (not ((_ is Found!6321) lt!276665)) (and (bvsge (index!27554 lt!276665) #b00000000000000000000000000000000) (bvslt (index!27554 lt!276665) (size!18245 a!2986)))) (or ((_ is Undefined!6321) lt!276665) ((_ is Found!6321) lt!276665) (not ((_ is MissingVacant!6321) lt!276665)) (not (= (index!27556 lt!276665) vacantSpotIndex!68)) (and (bvsge (index!27556 lt!276665) #b00000000000000000000000000000000) (bvslt (index!27556 lt!276665) (size!18245 a!2986)))) (or ((_ is Undefined!6321) lt!276665) (ite ((_ is Found!6321) lt!276665) (= (select (arr!17881 a!2986) (index!27554 lt!276665)) (select (arr!17881 a!2986) j!136)) (and ((_ is MissingVacant!6321) lt!276665) (= (index!27556 lt!276665) vacantSpotIndex!68) (= (select (arr!17881 a!2986) (index!27556 lt!276665)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!347064 () SeekEntryResult!6321)

(assert (=> d!87837 (= lt!276665 e!347064)))

(declare-fun c!68741 () Bool)

(assert (=> d!87837 (= c!68741 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87837 (= lt!276664 (select (arr!17881 a!2986) lt!276545))))

(assert (=> d!87837 (validMask!0 mask!3053)))

(assert (=> d!87837 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053) lt!276665)))

(declare-fun b!606227 () Bool)

(assert (=> b!606227 (= e!347064 Undefined!6321)))

(declare-fun b!606228 () Bool)

(assert (=> b!606228 (= e!347065 (MissingVacant!6321 vacantSpotIndex!68))))

(declare-fun b!606229 () Bool)

(assert (=> b!606229 (= e!347064 e!347066)))

(declare-fun c!68740 () Bool)

(assert (=> b!606229 (= c!68740 (= lt!276664 (select (arr!17881 a!2986) j!136)))))

(declare-fun b!606230 () Bool)

(assert (=> b!606230 (= e!347066 (Found!6321 lt!276545))))

(assert (= (and d!87837 c!68741) b!606227))

(assert (= (and d!87837 (not c!68741)) b!606229))

(assert (= (and b!606229 c!68740) b!606230))

(assert (= (and b!606229 (not c!68740)) b!606225))

(assert (= (and b!606225 c!68742) b!606228))

(assert (= (and b!606225 (not c!68742)) b!606226))

(declare-fun m!583081 () Bool)

(assert (=> b!606226 m!583081))

(assert (=> b!606226 m!583081))

(assert (=> b!606226 m!582783))

(declare-fun m!583083 () Bool)

(assert (=> b!606226 m!583083))

(declare-fun m!583085 () Bool)

(assert (=> d!87837 m!583085))

(declare-fun m!583087 () Bool)

(assert (=> d!87837 m!583087))

(declare-fun m!583089 () Bool)

(assert (=> d!87837 m!583089))

(assert (=> d!87837 m!582817))

(assert (=> b!605958 d!87837))

(declare-fun d!87839 () Bool)

(declare-fun lt!276672 () (_ BitVec 32))

(assert (=> d!87839 (and (bvsge lt!276672 #b00000000000000000000000000000000) (bvslt lt!276672 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87839 (= lt!276672 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87839 (validMask!0 mask!3053)))

(assert (=> d!87839 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276672)))

(declare-fun bs!18549 () Bool)

(assert (= bs!18549 d!87839))

(declare-fun m!583091 () Bool)

(assert (=> bs!18549 m!583091))

(assert (=> bs!18549 m!582817))

(assert (=> b!605958 d!87839))

(declare-fun b!606243 () Bool)

(declare-fun c!68751 () Bool)

(declare-fun lt!276673 () (_ BitVec 64))

(assert (=> b!606243 (= c!68751 (= lt!276673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347075 () SeekEntryResult!6321)

(declare-fun e!347074 () SeekEntryResult!6321)

(assert (=> b!606243 (= e!347075 e!347074)))

(declare-fun b!606244 () Bool)

(assert (=> b!606244 (= e!347074 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!276547 lt!276534 mask!3053))))

(declare-fun d!87841 () Bool)

(declare-fun lt!276674 () SeekEntryResult!6321)

(assert (=> d!87841 (and (or ((_ is Undefined!6321) lt!276674) (not ((_ is Found!6321) lt!276674)) (and (bvsge (index!27554 lt!276674) #b00000000000000000000000000000000) (bvslt (index!27554 lt!276674) (size!18245 lt!276534)))) (or ((_ is Undefined!6321) lt!276674) ((_ is Found!6321) lt!276674) (not ((_ is MissingVacant!6321) lt!276674)) (not (= (index!27556 lt!276674) vacantSpotIndex!68)) (and (bvsge (index!27556 lt!276674) #b00000000000000000000000000000000) (bvslt (index!27556 lt!276674) (size!18245 lt!276534)))) (or ((_ is Undefined!6321) lt!276674) (ite ((_ is Found!6321) lt!276674) (= (select (arr!17881 lt!276534) (index!27554 lt!276674)) lt!276547) (and ((_ is MissingVacant!6321) lt!276674) (= (index!27556 lt!276674) vacantSpotIndex!68) (= (select (arr!17881 lt!276534) (index!27556 lt!276674)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!347073 () SeekEntryResult!6321)

(assert (=> d!87841 (= lt!276674 e!347073)))

(declare-fun c!68750 () Bool)

(assert (=> d!87841 (= c!68750 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87841 (= lt!276673 (select (arr!17881 lt!276534) index!984))))

(assert (=> d!87841 (validMask!0 mask!3053)))

(assert (=> d!87841 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276547 lt!276534 mask!3053) lt!276674)))

(declare-fun b!606245 () Bool)

(assert (=> b!606245 (= e!347073 Undefined!6321)))

(declare-fun b!606246 () Bool)

(assert (=> b!606246 (= e!347074 (MissingVacant!6321 vacantSpotIndex!68))))

(declare-fun b!606247 () Bool)

(assert (=> b!606247 (= e!347073 e!347075)))

(declare-fun c!68749 () Bool)

(assert (=> b!606247 (= c!68749 (= lt!276673 lt!276547))))

(declare-fun b!606248 () Bool)

(assert (=> b!606248 (= e!347075 (Found!6321 index!984))))

(assert (= (and d!87841 c!68750) b!606245))

(assert (= (and d!87841 (not c!68750)) b!606247))

(assert (= (and b!606247 c!68749) b!606248))

(assert (= (and b!606247 (not c!68749)) b!606243))

(assert (= (and b!606243 c!68751) b!606246))

(assert (= (and b!606243 (not c!68751)) b!606244))

(assert (=> b!606244 m!582833))

(assert (=> b!606244 m!582833))

(declare-fun m!583093 () Bool)

(assert (=> b!606244 m!583093))

(declare-fun m!583095 () Bool)

(assert (=> d!87841 m!583095))

(declare-fun m!583097 () Bool)

(assert (=> d!87841 m!583097))

(assert (=> d!87841 m!582925))

(assert (=> d!87841 m!582817))

(assert (=> b!605958 d!87841))

(declare-fun b!606249 () Bool)

(declare-fun c!68754 () Bool)

(declare-fun lt!276675 () (_ BitVec 64))

(assert (=> b!606249 (= c!68754 (= lt!276675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347078 () SeekEntryResult!6321)

(declare-fun e!347077 () SeekEntryResult!6321)

(assert (=> b!606249 (= e!347078 e!347077)))

(declare-fun b!606250 () Bool)

(assert (=> b!606250 (= e!347077 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276545 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276547 lt!276534 mask!3053))))

(declare-fun lt!276676 () SeekEntryResult!6321)

(declare-fun d!87843 () Bool)

(assert (=> d!87843 (and (or ((_ is Undefined!6321) lt!276676) (not ((_ is Found!6321) lt!276676)) (and (bvsge (index!27554 lt!276676) #b00000000000000000000000000000000) (bvslt (index!27554 lt!276676) (size!18245 lt!276534)))) (or ((_ is Undefined!6321) lt!276676) ((_ is Found!6321) lt!276676) (not ((_ is MissingVacant!6321) lt!276676)) (not (= (index!27556 lt!276676) vacantSpotIndex!68)) (and (bvsge (index!27556 lt!276676) #b00000000000000000000000000000000) (bvslt (index!27556 lt!276676) (size!18245 lt!276534)))) (or ((_ is Undefined!6321) lt!276676) (ite ((_ is Found!6321) lt!276676) (= (select (arr!17881 lt!276534) (index!27554 lt!276676)) lt!276547) (and ((_ is MissingVacant!6321) lt!276676) (= (index!27556 lt!276676) vacantSpotIndex!68) (= (select (arr!17881 lt!276534) (index!27556 lt!276676)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!347076 () SeekEntryResult!6321)

(assert (=> d!87843 (= lt!276676 e!347076)))

(declare-fun c!68753 () Bool)

(assert (=> d!87843 (= c!68753 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87843 (= lt!276675 (select (arr!17881 lt!276534) lt!276545))))

(assert (=> d!87843 (validMask!0 mask!3053)))

(assert (=> d!87843 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 lt!276547 lt!276534 mask!3053) lt!276676)))

(declare-fun b!606251 () Bool)

(assert (=> b!606251 (= e!347076 Undefined!6321)))

(declare-fun b!606252 () Bool)

(assert (=> b!606252 (= e!347077 (MissingVacant!6321 vacantSpotIndex!68))))

(declare-fun b!606253 () Bool)

(assert (=> b!606253 (= e!347076 e!347078)))

(declare-fun c!68752 () Bool)

(assert (=> b!606253 (= c!68752 (= lt!276675 lt!276547))))

(declare-fun b!606254 () Bool)

(assert (=> b!606254 (= e!347078 (Found!6321 lt!276545))))

(assert (= (and d!87843 c!68753) b!606251))

(assert (= (and d!87843 (not c!68753)) b!606253))

(assert (= (and b!606253 c!68752) b!606254))

(assert (= (and b!606253 (not c!68752)) b!606249))

(assert (= (and b!606249 c!68754) b!606252))

(assert (= (and b!606249 (not c!68754)) b!606250))

(assert (=> b!606250 m!583081))

(assert (=> b!606250 m!583081))

(declare-fun m!583099 () Bool)

(assert (=> b!606250 m!583099))

(declare-fun m!583101 () Bool)

(assert (=> d!87843 m!583101))

(declare-fun m!583103 () Bool)

(assert (=> d!87843 m!583103))

(declare-fun m!583105 () Bool)

(assert (=> d!87843 m!583105))

(assert (=> d!87843 m!582817))

(assert (=> b!605958 d!87843))

(declare-fun d!87845 () Bool)

(declare-fun e!347101 () Bool)

(assert (=> d!87845 e!347101))

(declare-fun res!389488 () Bool)

(assert (=> d!87845 (=> (not res!389488) (not e!347101))))

(assert (=> d!87845 (= res!389488 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18245 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18245 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18245 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18245 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18245 a!2986))))))

(declare-fun lt!276691 () Unit!19306)

(declare-fun choose!9 (array!37255 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19306)

(assert (=> d!87845 (= lt!276691 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87845 (validMask!0 mask!3053)))

(assert (=> d!87845 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 mask!3053) lt!276691)))

(declare-fun b!606290 () Bool)

(assert (=> b!606290 (= e!347101 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 (select (arr!17881 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276545 vacantSpotIndex!68 (select (store (arr!17881 a!2986) i!1108 k0!1786) j!136) (array!37256 (store (arr!17881 a!2986) i!1108 k0!1786) (size!18245 a!2986)) mask!3053)))))

(assert (= (and d!87845 res!389488) b!606290))

(declare-fun m!583143 () Bool)

(assert (=> d!87845 m!583143))

(assert (=> d!87845 m!582817))

(assert (=> b!606290 m!582835))

(assert (=> b!606290 m!582835))

(declare-fun m!583145 () Bool)

(assert (=> b!606290 m!583145))

(assert (=> b!606290 m!582809))

(assert (=> b!606290 m!582783))

(assert (=> b!606290 m!582839))

(assert (=> b!606290 m!582783))

(assert (=> b!605958 d!87845))

(check-sat (not b!606081) (not b!606121) (not d!87839) (not bm!33062) (not b!606063) (not b!606064) (not b!606250) (not d!87821) (not b!606222) (not b!606212) (not b!606226) (not b!606197) (not bm!33075) (not b!606244) (not d!87813) (not d!87837) (not b!606207) (not b!606123) (not d!87819) (not d!87845) (not bm!33065) (not b!606058) (not d!87841) (not d!87831) (not b!606056) (not b!606209) (not bm!33074) (not b!606044) (not b!606055) (not d!87791) (not b!606107) (not b!606223) (not b!606110) (not d!87787) (not b!606290) (not b!606109) (not b!606211) (not d!87751) (not b!606219) (not d!87843) (not b!606220))
(check-sat)
