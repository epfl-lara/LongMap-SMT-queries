; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57932 () Bool)

(assert start!57932)

(declare-fun res!415172 () Bool)

(declare-fun e!366927 () Bool)

(assert (=> start!57932 (=> (not res!415172) (not e!366927))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57932 (= res!415172 (validMask!0 mask!3053))))

(assert (=> start!57932 e!366927))

(assert (=> start!57932 true))

(declare-datatypes ((array!38359 0))(
  ( (array!38360 (arr!18399 (Array (_ BitVec 32) (_ BitVec 64))) (size!18763 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38359)

(declare-fun array_inv!14195 (array!38359) Bool)

(assert (=> start!57932 (array_inv!14195 a!2986)))

(declare-fun b!640945 () Bool)

(declare-fun e!366930 () Bool)

(declare-fun e!366936 () Bool)

(assert (=> b!640945 (= e!366930 e!366936)))

(declare-fun res!415170 () Bool)

(assert (=> b!640945 (=> (not res!415170) (not e!366936))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296743 () array!38359)

(declare-fun arrayContainsKey!0 (array!38359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640945 (= res!415170 (arrayContainsKey!0 lt!296743 (select (arr!18399 a!2986) j!136) j!136))))

(declare-fun b!640946 () Bool)

(declare-datatypes ((Unit!21690 0))(
  ( (Unit!21691) )
))
(declare-fun e!366932 () Unit!21690)

(declare-fun Unit!21692 () Unit!21690)

(assert (=> b!640946 (= e!366932 Unit!21692)))

(declare-fun b!640947 () Bool)

(declare-fun res!415163 () Bool)

(declare-fun e!366933 () Bool)

(assert (=> b!640947 (=> (not res!415163) (not e!366933))))

(declare-datatypes ((List!12440 0))(
  ( (Nil!12437) (Cons!12436 (h!13481 (_ BitVec 64)) (t!18668 List!12440)) )
))
(declare-fun arrayNoDuplicates!0 (array!38359 (_ BitVec 32) List!12440) Bool)

(assert (=> b!640947 (= res!415163 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12437))))

(declare-fun b!640948 () Bool)

(assert (=> b!640948 (= e!366927 e!366933)))

(declare-fun res!415158 () Bool)

(assert (=> b!640948 (=> (not res!415158) (not e!366933))))

(declare-datatypes ((SeekEntryResult!6839 0))(
  ( (MissingZero!6839 (index!29676 (_ BitVec 32))) (Found!6839 (index!29677 (_ BitVec 32))) (Intermediate!6839 (undefined!7651 Bool) (index!29678 (_ BitVec 32)) (x!58435 (_ BitVec 32))) (Undefined!6839) (MissingVacant!6839 (index!29679 (_ BitVec 32))) )
))
(declare-fun lt!296742 () SeekEntryResult!6839)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!640948 (= res!415158 (or (= lt!296742 (MissingZero!6839 i!1108)) (= lt!296742 (MissingVacant!6839 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38359 (_ BitVec 32)) SeekEntryResult!6839)

(assert (=> b!640948 (= lt!296742 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640949 () Bool)

(declare-fun res!415159 () Bool)

(assert (=> b!640949 (=> (not res!415159) (not e!366927))))

(assert (=> b!640949 (= res!415159 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640950 () Bool)

(declare-fun e!366934 () Bool)

(declare-fun e!366938 () Bool)

(assert (=> b!640950 (= e!366934 e!366938)))

(declare-fun res!415166 () Bool)

(assert (=> b!640950 (=> res!415166 e!366938)))

(assert (=> b!640950 (= res!415166 (or (bvsge (size!18763 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18763 a!2986))))))

(assert (=> b!640950 (arrayNoDuplicates!0 lt!296743 j!136 Nil!12437)))

(declare-fun lt!296739 () Unit!21690)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38359 (_ BitVec 32) (_ BitVec 32)) Unit!21690)

(assert (=> b!640950 (= lt!296739 (lemmaNoDuplicateFromThenFromBigger!0 lt!296743 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640950 (arrayNoDuplicates!0 lt!296743 #b00000000000000000000000000000000 Nil!12437)))

(declare-fun lt!296741 () Unit!21690)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12440) Unit!21690)

(assert (=> b!640950 (= lt!296741 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12437))))

(assert (=> b!640950 (arrayContainsKey!0 lt!296743 (select (arr!18399 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296747 () Unit!21690)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21690)

(assert (=> b!640950 (= lt!296747 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296743 (select (arr!18399 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640951 () Bool)

(declare-fun res!415162 () Bool)

(assert (=> b!640951 (=> (not res!415162) (not e!366927))))

(assert (=> b!640951 (= res!415162 (and (= (size!18763 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18763 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18763 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640952 () Bool)

(assert (=> b!640952 (= e!366936 (arrayContainsKey!0 lt!296743 (select (arr!18399 a!2986) j!136) index!984))))

(declare-fun b!640953 () Bool)

(declare-fun e!366928 () Bool)

(assert (=> b!640953 (= e!366928 e!366934)))

(declare-fun res!415171 () Bool)

(assert (=> b!640953 (=> res!415171 e!366934)))

(declare-fun lt!296744 () (_ BitVec 64))

(declare-fun lt!296738 () (_ BitVec 64))

(assert (=> b!640953 (= res!415171 (or (not (= (select (arr!18399 a!2986) j!136) lt!296738)) (not (= (select (arr!18399 a!2986) j!136) lt!296744)) (bvsge j!136 index!984)))))

(declare-fun e!366939 () Bool)

(assert (=> b!640953 e!366939))

(declare-fun res!415161 () Bool)

(assert (=> b!640953 (=> (not res!415161) (not e!366939))))

(assert (=> b!640953 (= res!415161 (= lt!296744 (select (arr!18399 a!2986) j!136)))))

(assert (=> b!640953 (= lt!296744 (select (store (arr!18399 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!640954 () Bool)

(declare-fun e!366937 () Bool)

(declare-fun lt!296746 () SeekEntryResult!6839)

(declare-fun lt!296748 () SeekEntryResult!6839)

(assert (=> b!640954 (= e!366937 (= lt!296746 lt!296748))))

(declare-fun b!640955 () Bool)

(declare-fun e!366931 () Bool)

(assert (=> b!640955 (= e!366933 e!366931)))

(declare-fun res!415156 () Bool)

(assert (=> b!640955 (=> (not res!415156) (not e!366931))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!640955 (= res!415156 (= (select (store (arr!18399 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640955 (= lt!296743 (array!38360 (store (arr!18399 a!2986) i!1108 k!1786) (size!18763 a!2986)))))

(declare-fun b!640956 () Bool)

(assert (=> b!640956 (= e!366939 e!366930)))

(declare-fun res!415167 () Bool)

(assert (=> b!640956 (=> res!415167 e!366930)))

(assert (=> b!640956 (= res!415167 (or (not (= (select (arr!18399 a!2986) j!136) lt!296738)) (not (= (select (arr!18399 a!2986) j!136) lt!296744)) (bvsge j!136 index!984)))))

(declare-fun b!640957 () Bool)

(declare-fun e!366929 () Bool)

(assert (=> b!640957 (= e!366931 e!366929)))

(declare-fun res!415169 () Bool)

(assert (=> b!640957 (=> (not res!415169) (not e!366929))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!640957 (= res!415169 (and (= lt!296746 (Found!6839 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18399 a!2986) index!984) (select (arr!18399 a!2986) j!136))) (not (= (select (arr!18399 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38359 (_ BitVec 32)) SeekEntryResult!6839)

(assert (=> b!640957 (= lt!296746 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18399 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640958 () Bool)

(declare-fun res!415165 () Bool)

(assert (=> b!640958 (=> (not res!415165) (not e!366927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640958 (= res!415165 (validKeyInArray!0 k!1786))))

(declare-fun b!640959 () Bool)

(declare-fun res!415164 () Bool)

(assert (=> b!640959 (=> (not res!415164) (not e!366927))))

(assert (=> b!640959 (= res!415164 (validKeyInArray!0 (select (arr!18399 a!2986) j!136)))))

(declare-fun b!640960 () Bool)

(assert (=> b!640960 (= e!366929 (not e!366928))))

(declare-fun res!415157 () Bool)

(assert (=> b!640960 (=> res!415157 e!366928)))

(declare-fun lt!296740 () SeekEntryResult!6839)

(assert (=> b!640960 (= res!415157 (not (= lt!296740 (Found!6839 index!984))))))

(declare-fun lt!296737 () Unit!21690)

(assert (=> b!640960 (= lt!296737 e!366932)))

(declare-fun c!73262 () Bool)

(assert (=> b!640960 (= c!73262 (= lt!296740 Undefined!6839))))

(assert (=> b!640960 (= lt!296740 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296738 lt!296743 mask!3053))))

(assert (=> b!640960 e!366937))

(declare-fun res!415168 () Bool)

(assert (=> b!640960 (=> (not res!415168) (not e!366937))))

(declare-fun lt!296745 () (_ BitVec 32))

(assert (=> b!640960 (= res!415168 (= lt!296748 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 lt!296738 lt!296743 mask!3053)))))

(assert (=> b!640960 (= lt!296748 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 (select (arr!18399 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640960 (= lt!296738 (select (store (arr!18399 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296749 () Unit!21690)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21690)

(assert (=> b!640960 (= lt!296749 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640960 (= lt!296745 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640961 () Bool)

(declare-fun Unit!21693 () Unit!21690)

(assert (=> b!640961 (= e!366932 Unit!21693)))

(assert (=> b!640961 false))

(declare-fun b!640962 () Bool)

(declare-fun res!415160 () Bool)

(assert (=> b!640962 (=> (not res!415160) (not e!366933))))

(assert (=> b!640962 (= res!415160 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18399 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640963 () Bool)

(declare-fun res!415155 () Bool)

(assert (=> b!640963 (=> (not res!415155) (not e!366933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38359 (_ BitVec 32)) Bool)

(assert (=> b!640963 (= res!415155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640964 () Bool)

(declare-fun noDuplicate!399 (List!12440) Bool)

(assert (=> b!640964 (= e!366938 (noDuplicate!399 Nil!12437))))

(assert (= (and start!57932 res!415172) b!640951))

(assert (= (and b!640951 res!415162) b!640959))

(assert (= (and b!640959 res!415164) b!640958))

(assert (= (and b!640958 res!415165) b!640949))

(assert (= (and b!640949 res!415159) b!640948))

(assert (= (and b!640948 res!415158) b!640963))

(assert (= (and b!640963 res!415155) b!640947))

(assert (= (and b!640947 res!415163) b!640962))

(assert (= (and b!640962 res!415160) b!640955))

(assert (= (and b!640955 res!415156) b!640957))

(assert (= (and b!640957 res!415169) b!640960))

(assert (= (and b!640960 res!415168) b!640954))

(assert (= (and b!640960 c!73262) b!640961))

(assert (= (and b!640960 (not c!73262)) b!640946))

(assert (= (and b!640960 (not res!415157)) b!640953))

(assert (= (and b!640953 res!415161) b!640956))

(assert (= (and b!640956 (not res!415167)) b!640945))

(assert (= (and b!640945 res!415170) b!640952))

(assert (= (and b!640953 (not res!415171)) b!640950))

(assert (= (and b!640950 (not res!415166)) b!640964))

(declare-fun m!614783 () Bool)

(assert (=> b!640947 m!614783))

(declare-fun m!614785 () Bool)

(assert (=> b!640953 m!614785))

(declare-fun m!614787 () Bool)

(assert (=> b!640953 m!614787))

(declare-fun m!614789 () Bool)

(assert (=> b!640953 m!614789))

(assert (=> b!640959 m!614785))

(assert (=> b!640959 m!614785))

(declare-fun m!614791 () Bool)

(assert (=> b!640959 m!614791))

(declare-fun m!614793 () Bool)

(assert (=> b!640949 m!614793))

(declare-fun m!614795 () Bool)

(assert (=> b!640964 m!614795))

(assert (=> b!640955 m!614787))

(declare-fun m!614797 () Bool)

(assert (=> b!640955 m!614797))

(assert (=> b!640952 m!614785))

(assert (=> b!640952 m!614785))

(declare-fun m!614799 () Bool)

(assert (=> b!640952 m!614799))

(declare-fun m!614801 () Bool)

(assert (=> b!640962 m!614801))

(declare-fun m!614803 () Bool)

(assert (=> b!640957 m!614803))

(assert (=> b!640957 m!614785))

(assert (=> b!640957 m!614785))

(declare-fun m!614805 () Bool)

(assert (=> b!640957 m!614805))

(declare-fun m!614807 () Bool)

(assert (=> b!640963 m!614807))

(declare-fun m!614809 () Bool)

(assert (=> start!57932 m!614809))

(declare-fun m!614811 () Bool)

(assert (=> start!57932 m!614811))

(declare-fun m!614813 () Bool)

(assert (=> b!640948 m!614813))

(declare-fun m!614815 () Bool)

(assert (=> b!640958 m!614815))

(assert (=> b!640950 m!614785))

(declare-fun m!614817 () Bool)

(assert (=> b!640950 m!614817))

(declare-fun m!614819 () Bool)

(assert (=> b!640950 m!614819))

(assert (=> b!640950 m!614785))

(declare-fun m!614821 () Bool)

(assert (=> b!640950 m!614821))

(declare-fun m!614823 () Bool)

(assert (=> b!640950 m!614823))

(assert (=> b!640950 m!614785))

(declare-fun m!614825 () Bool)

(assert (=> b!640950 m!614825))

(declare-fun m!614827 () Bool)

(assert (=> b!640950 m!614827))

(assert (=> b!640945 m!614785))

(assert (=> b!640945 m!614785))

(declare-fun m!614829 () Bool)

(assert (=> b!640945 m!614829))

(assert (=> b!640956 m!614785))

(declare-fun m!614831 () Bool)

(assert (=> b!640960 m!614831))

(declare-fun m!614833 () Bool)

(assert (=> b!640960 m!614833))

(assert (=> b!640960 m!614785))

(assert (=> b!640960 m!614787))

(declare-fun m!614835 () Bool)

(assert (=> b!640960 m!614835))

(declare-fun m!614837 () Bool)

(assert (=> b!640960 m!614837))

(declare-fun m!614839 () Bool)

(assert (=> b!640960 m!614839))

(assert (=> b!640960 m!614785))

(declare-fun m!614841 () Bool)

(assert (=> b!640960 m!614841))

(push 1)

(assert (not b!640945))

(assert (not b!640947))

(assert (not b!640963))

(assert (not b!640959))

(assert (not b!640948))

(assert (not b!640957))

(assert (not b!640949))

(assert (not b!640950))

(assert (not b!640958))

(assert (not b!640952))

(assert (not start!57932))

(assert (not b!640964))

(assert (not b!640960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90505 () Bool)

(declare-fun res!415320 () Bool)

(declare-fun e!367064 () Bool)

(assert (=> d!90505 (=> res!415320 e!367064)))

(assert (=> d!90505 (= res!415320 (is-Nil!12437 Nil!12437))))

(assert (=> d!90505 (= (noDuplicate!399 Nil!12437) e!367064)))

(declare-fun b!641138 () Bool)

(declare-fun e!367065 () Bool)

(assert (=> b!641138 (= e!367064 e!367065)))

(declare-fun res!415321 () Bool)

(assert (=> b!641138 (=> (not res!415321) (not e!367065))))

(declare-fun contains!3128 (List!12440 (_ BitVec 64)) Bool)

(assert (=> b!641138 (= res!415321 (not (contains!3128 (t!18668 Nil!12437) (h!13481 Nil!12437))))))

(declare-fun b!641139 () Bool)

(assert (=> b!641139 (= e!367065 (noDuplicate!399 (t!18668 Nil!12437)))))

(assert (= (and d!90505 (not res!415320)) b!641138))

(assert (= (and b!641138 res!415321) b!641139))

(declare-fun m!615009 () Bool)

(assert (=> b!641138 m!615009))

(declare-fun m!615011 () Bool)

(assert (=> b!641139 m!615011))

(assert (=> b!640964 d!90505))

(declare-fun b!641168 () Bool)

(declare-fun e!367086 () Bool)

(declare-fun e!367083 () Bool)

(assert (=> b!641168 (= e!367086 e!367083)))

(declare-fun c!73287 () Bool)

(assert (=> b!641168 (= c!73287 (validKeyInArray!0 (select (arr!18399 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90507 () Bool)

(declare-fun res!415329 () Bool)

(declare-fun e!367084 () Bool)

(assert (=> d!90507 (=> res!415329 e!367084)))

(assert (=> d!90507 (= res!415329 (bvsge #b00000000000000000000000000000000 (size!18763 a!2986)))))

(assert (=> d!90507 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12437) e!367084)))

(declare-fun bm!33519 () Bool)

(declare-fun call!33522 () Bool)

(assert (=> bm!33519 (= call!33522 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73287 (Cons!12436 (select (arr!18399 a!2986) #b00000000000000000000000000000000) Nil!12437) Nil!12437)))))

(declare-fun b!641169 () Bool)

(assert (=> b!641169 (= e!367083 call!33522)))

(declare-fun b!641170 () Bool)

(assert (=> b!641170 (= e!367083 call!33522)))

(declare-fun b!641171 () Bool)

(assert (=> b!641171 (= e!367084 e!367086)))

(declare-fun res!415328 () Bool)

(assert (=> b!641171 (=> (not res!415328) (not e!367086))))

(declare-fun e!367085 () Bool)

(assert (=> b!641171 (= res!415328 (not e!367085))))

(declare-fun res!415330 () Bool)

(assert (=> b!641171 (=> (not res!415330) (not e!367085))))

(assert (=> b!641171 (= res!415330 (validKeyInArray!0 (select (arr!18399 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641172 () Bool)

(assert (=> b!641172 (= e!367085 (contains!3128 Nil!12437 (select (arr!18399 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90507 (not res!415329)) b!641171))

(assert (= (and b!641171 res!415330) b!641172))

(assert (= (and b!641171 res!415328) b!641168))

(assert (= (and b!641168 c!73287) b!641169))

(assert (= (and b!641168 (not c!73287)) b!641170))

(assert (= (or b!641169 b!641170) bm!33519))

(declare-fun m!615019 () Bool)

(assert (=> b!641168 m!615019))

(assert (=> b!641168 m!615019))

(declare-fun m!615021 () Bool)

(assert (=> b!641168 m!615021))

(assert (=> bm!33519 m!615019))

(declare-fun m!615023 () Bool)

(assert (=> bm!33519 m!615023))

(assert (=> b!641171 m!615019))

(assert (=> b!641171 m!615019))

(assert (=> b!641171 m!615021))

(assert (=> b!641172 m!615019))

(assert (=> b!641172 m!615019))

(declare-fun m!615025 () Bool)

(assert (=> b!641172 m!615025))

(assert (=> b!640947 d!90507))

(declare-fun d!90511 () Bool)

(assert (=> d!90511 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!640958 d!90511))

(declare-fun b!641192 () Bool)

(declare-fun e!367099 () SeekEntryResult!6839)

(assert (=> b!641192 (= e!367099 (MissingVacant!6839 vacantSpotIndex!68))))

(declare-fun b!641193 () Bool)

(assert (=> b!641193 (= e!367099 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18399 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!296857 () SeekEntryResult!6839)

(declare-fun d!90513 () Bool)

(assert (=> d!90513 (and (or (is-Undefined!6839 lt!296857) (not (is-Found!6839 lt!296857)) (and (bvsge (index!29677 lt!296857) #b00000000000000000000000000000000) (bvslt (index!29677 lt!296857) (size!18763 a!2986)))) (or (is-Undefined!6839 lt!296857) (is-Found!6839 lt!296857) (not (is-MissingVacant!6839 lt!296857)) (not (= (index!29679 lt!296857) vacantSpotIndex!68)) (and (bvsge (index!29679 lt!296857) #b00000000000000000000000000000000) (bvslt (index!29679 lt!296857) (size!18763 a!2986)))) (or (is-Undefined!6839 lt!296857) (ite (is-Found!6839 lt!296857) (= (select (arr!18399 a!2986) (index!29677 lt!296857)) (select (arr!18399 a!2986) j!136)) (and (is-MissingVacant!6839 lt!296857) (= (index!29679 lt!296857) vacantSpotIndex!68) (= (select (arr!18399 a!2986) (index!29679 lt!296857)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!367100 () SeekEntryResult!6839)

(assert (=> d!90513 (= lt!296857 e!367100)))

(declare-fun c!73295 () Bool)

(assert (=> d!90513 (= c!73295 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!296856 () (_ BitVec 64))

(assert (=> d!90513 (= lt!296856 (select (arr!18399 a!2986) index!984))))

(assert (=> d!90513 (validMask!0 mask!3053)))

(assert (=> d!90513 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18399 a!2986) j!136) a!2986 mask!3053) lt!296857)))

(declare-fun b!641194 () Bool)

(assert (=> b!641194 (= e!367100 Undefined!6839)))

(declare-fun b!641195 () Bool)

(declare-fun e!367101 () SeekEntryResult!6839)

(assert (=> b!641195 (= e!367101 (Found!6839 index!984))))

(declare-fun b!641196 () Bool)

(assert (=> b!641196 (= e!367100 e!367101)))

(declare-fun c!73296 () Bool)

(assert (=> b!641196 (= c!73296 (= lt!296856 (select (arr!18399 a!2986) j!136)))))

(declare-fun b!641197 () Bool)

(declare-fun c!73297 () Bool)

(assert (=> b!641197 (= c!73297 (= lt!296856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641197 (= e!367101 e!367099)))

(assert (= (and d!90513 c!73295) b!641194))

(assert (= (and d!90513 (not c!73295)) b!641196))

(assert (= (and b!641196 c!73296) b!641195))

(assert (= (and b!641196 (not c!73296)) b!641197))

(assert (= (and b!641197 c!73297) b!641192))

(assert (= (and b!641197 (not c!73297)) b!641193))

(assert (=> b!641193 m!614839))

(assert (=> b!641193 m!614839))

(assert (=> b!641193 m!614785))

(declare-fun m!615033 () Bool)

(assert (=> b!641193 m!615033))

(declare-fun m!615035 () Bool)

(assert (=> d!90513 m!615035))

(declare-fun m!615037 () Bool)

(assert (=> d!90513 m!615037))

(assert (=> d!90513 m!614803))

(assert (=> d!90513 m!614809))

(assert (=> b!640957 d!90513))

(declare-fun d!90529 () Bool)

(declare-fun res!415340 () Bool)

(declare-fun e!367106 () Bool)

(assert (=> d!90529 (=> res!415340 e!367106)))

(assert (=> d!90529 (= res!415340 (= (select (arr!18399 lt!296743) j!136) (select (arr!18399 a!2986) j!136)))))

(assert (=> d!90529 (= (arrayContainsKey!0 lt!296743 (select (arr!18399 a!2986) j!136) j!136) e!367106)))

(declare-fun b!641202 () Bool)

(declare-fun e!367107 () Bool)

(assert (=> b!641202 (= e!367106 e!367107)))

(declare-fun res!415341 () Bool)

(assert (=> b!641202 (=> (not res!415341) (not e!367107))))

(assert (=> b!641202 (= res!415341 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18763 lt!296743)))))

(declare-fun b!641203 () Bool)

(assert (=> b!641203 (= e!367107 (arrayContainsKey!0 lt!296743 (select (arr!18399 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90529 (not res!415340)) b!641202))

(assert (= (and b!641202 res!415341) b!641203))

(declare-fun m!615039 () Bool)

(assert (=> d!90529 m!615039))

(assert (=> b!641203 m!614785))

(declare-fun m!615041 () Bool)

(assert (=> b!641203 m!615041))

(assert (=> b!640945 d!90529))

(declare-fun d!90531 () Bool)

(assert (=> d!90531 (arrayNoDuplicates!0 lt!296743 j!136 Nil!12437)))

(declare-fun lt!296860 () Unit!21690)

(declare-fun choose!39 (array!38359 (_ BitVec 32) (_ BitVec 32)) Unit!21690)

(assert (=> d!90531 (= lt!296860 (choose!39 lt!296743 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90531 (bvslt (size!18763 lt!296743) #b01111111111111111111111111111111)))

(assert (=> d!90531 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!296743 #b00000000000000000000000000000000 j!136) lt!296860)))

(declare-fun bs!19197 () Bool)

(assert (= bs!19197 d!90531))

(assert (=> bs!19197 m!614827))

(declare-fun m!615043 () Bool)

(assert (=> bs!19197 m!615043))

(assert (=> b!640950 d!90531))

(declare-fun b!641204 () Bool)

(declare-fun e!367111 () Bool)

(declare-fun e!367108 () Bool)

(assert (=> b!641204 (= e!367111 e!367108)))

(declare-fun c!73298 () Bool)

(assert (=> b!641204 (= c!73298 (validKeyInArray!0 (select (arr!18399 lt!296743) j!136)))))

(declare-fun d!90533 () Bool)

(declare-fun res!415343 () Bool)

(declare-fun e!367109 () Bool)

(assert (=> d!90533 (=> res!415343 e!367109)))

(assert (=> d!90533 (= res!415343 (bvsge j!136 (size!18763 lt!296743)))))

(assert (=> d!90533 (= (arrayNoDuplicates!0 lt!296743 j!136 Nil!12437) e!367109)))

(declare-fun call!33524 () Bool)

(declare-fun bm!33521 () Bool)

(assert (=> bm!33521 (= call!33524 (arrayNoDuplicates!0 lt!296743 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73298 (Cons!12436 (select (arr!18399 lt!296743) j!136) Nil!12437) Nil!12437)))))

(declare-fun b!641205 () Bool)

(assert (=> b!641205 (= e!367108 call!33524)))

(declare-fun b!641206 () Bool)

(assert (=> b!641206 (= e!367108 call!33524)))

(declare-fun b!641207 () Bool)

(assert (=> b!641207 (= e!367109 e!367111)))

(declare-fun res!415342 () Bool)

(assert (=> b!641207 (=> (not res!415342) (not e!367111))))

(declare-fun e!367110 () Bool)

(assert (=> b!641207 (= res!415342 (not e!367110))))

(declare-fun res!415344 () Bool)

(assert (=> b!641207 (=> (not res!415344) (not e!367110))))

(assert (=> b!641207 (= res!415344 (validKeyInArray!0 (select (arr!18399 lt!296743) j!136)))))

(declare-fun b!641208 () Bool)

(assert (=> b!641208 (= e!367110 (contains!3128 Nil!12437 (select (arr!18399 lt!296743) j!136)))))

(assert (= (and d!90533 (not res!415343)) b!641207))

(assert (= (and b!641207 res!415344) b!641208))

(assert (= (and b!641207 res!415342) b!641204))

(assert (= (and b!641204 c!73298) b!641205))

(assert (= (and b!641204 (not c!73298)) b!641206))

(assert (= (or b!641205 b!641206) bm!33521))

(assert (=> b!641204 m!615039))

(assert (=> b!641204 m!615039))

(declare-fun m!615045 () Bool)

(assert (=> b!641204 m!615045))

(assert (=> bm!33521 m!615039))

(declare-fun m!615047 () Bool)

(assert (=> bm!33521 m!615047))

(assert (=> b!641207 m!615039))

(assert (=> b!641207 m!615039))

(assert (=> b!641207 m!615045))

(assert (=> b!641208 m!615039))

(assert (=> b!641208 m!615039))

(declare-fun m!615049 () Bool)

(assert (=> b!641208 m!615049))

(assert (=> b!640950 d!90533))

(declare-fun d!90535 () Bool)

(declare-fun res!415345 () Bool)

(declare-fun e!367112 () Bool)

(assert (=> d!90535 (=> res!415345 e!367112)))

(assert (=> d!90535 (= res!415345 (= (select (arr!18399 lt!296743) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18399 a!2986) j!136)))))

(assert (=> d!90535 (= (arrayContainsKey!0 lt!296743 (select (arr!18399 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!367112)))

(declare-fun b!641209 () Bool)

(declare-fun e!367113 () Bool)

(assert (=> b!641209 (= e!367112 e!367113)))

(declare-fun res!415346 () Bool)

(assert (=> b!641209 (=> (not res!415346) (not e!367113))))

(assert (=> b!641209 (= res!415346 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18763 lt!296743)))))

(declare-fun b!641210 () Bool)

(assert (=> b!641210 (= e!367113 (arrayContainsKey!0 lt!296743 (select (arr!18399 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90535 (not res!415345)) b!641209))

(assert (= (and b!641209 res!415346) b!641210))

(declare-fun m!615051 () Bool)

(assert (=> d!90535 m!615051))

(assert (=> b!641210 m!614785))

(declare-fun m!615053 () Bool)

(assert (=> b!641210 m!615053))

(assert (=> b!640950 d!90535))

(declare-fun d!90537 () Bool)

(declare-fun e!367122 () Bool)

(assert (=> d!90537 e!367122))

(declare-fun res!415349 () Bool)

(assert (=> d!90537 (=> (not res!415349) (not e!367122))))

(assert (=> d!90537 (= res!415349 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18763 a!2986))))))

(declare-fun lt!296869 () Unit!21690)

(declare-fun choose!41 (array!38359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12440) Unit!21690)

(assert (=> d!90537 (= lt!296869 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12437))))

(assert (=> d!90537 (bvslt (size!18763 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90537 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12437) lt!296869)))

(declare-fun b!641225 () Bool)

(assert (=> b!641225 (= e!367122 (arrayNoDuplicates!0 (array!38360 (store (arr!18399 a!2986) i!1108 k!1786) (size!18763 a!2986)) #b00000000000000000000000000000000 Nil!12437))))

(assert (= (and d!90537 res!415349) b!641225))

(declare-fun m!615055 () Bool)

(assert (=> d!90537 m!615055))

(assert (=> b!641225 m!614787))

(declare-fun m!615057 () Bool)

(assert (=> b!641225 m!615057))

(assert (=> b!640950 d!90537))

(declare-fun b!641226 () Bool)

(declare-fun e!367126 () Bool)

(declare-fun e!367123 () Bool)

(assert (=> b!641226 (= e!367126 e!367123)))

(declare-fun c!73305 () Bool)

(assert (=> b!641226 (= c!73305 (validKeyInArray!0 (select (arr!18399 lt!296743) #b00000000000000000000000000000000)))))

(declare-fun d!90539 () Bool)

(declare-fun res!415351 () Bool)

(declare-fun e!367124 () Bool)

(assert (=> d!90539 (=> res!415351 e!367124)))

(assert (=> d!90539 (= res!415351 (bvsge #b00000000000000000000000000000000 (size!18763 lt!296743)))))

(assert (=> d!90539 (= (arrayNoDuplicates!0 lt!296743 #b00000000000000000000000000000000 Nil!12437) e!367124)))

(declare-fun bm!33522 () Bool)

(declare-fun call!33525 () Bool)

(assert (=> bm!33522 (= call!33525 (arrayNoDuplicates!0 lt!296743 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73305 (Cons!12436 (select (arr!18399 lt!296743) #b00000000000000000000000000000000) Nil!12437) Nil!12437)))))

(declare-fun b!641227 () Bool)

(assert (=> b!641227 (= e!367123 call!33525)))

(declare-fun b!641228 () Bool)

(assert (=> b!641228 (= e!367123 call!33525)))

(declare-fun b!641229 () Bool)

(assert (=> b!641229 (= e!367124 e!367126)))

(declare-fun res!415350 () Bool)

(assert (=> b!641229 (=> (not res!415350) (not e!367126))))

(declare-fun e!367125 () Bool)

(assert (=> b!641229 (= res!415350 (not e!367125))))

(declare-fun res!415352 () Bool)

(assert (=> b!641229 (=> (not res!415352) (not e!367125))))

(assert (=> b!641229 (= res!415352 (validKeyInArray!0 (select (arr!18399 lt!296743) #b00000000000000000000000000000000)))))

(declare-fun b!641230 () Bool)

(assert (=> b!641230 (= e!367125 (contains!3128 Nil!12437 (select (arr!18399 lt!296743) #b00000000000000000000000000000000)))))

(assert (= (and d!90539 (not res!415351)) b!641229))

(assert (= (and b!641229 res!415352) b!641230))

(assert (= (and b!641229 res!415350) b!641226))

(assert (= (and b!641226 c!73305) b!641227))

(assert (= (and b!641226 (not c!73305)) b!641228))

(assert (= (or b!641227 b!641228) bm!33522))

(declare-fun m!615059 () Bool)

(assert (=> b!641226 m!615059))

(assert (=> b!641226 m!615059))

(declare-fun m!615061 () Bool)

(assert (=> b!641226 m!615061))

(assert (=> bm!33522 m!615059))

(declare-fun m!615063 () Bool)

(assert (=> bm!33522 m!615063))

(assert (=> b!641229 m!615059))

(assert (=> b!641229 m!615059))

(assert (=> b!641229 m!615061))

(assert (=> b!641230 m!615059))

(assert (=> b!641230 m!615059))

(declare-fun m!615065 () Bool)

(assert (=> b!641230 m!615065))

(assert (=> b!640950 d!90539))

(declare-fun d!90541 () Bool)

(assert (=> d!90541 (arrayContainsKey!0 lt!296743 (select (arr!18399 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296875 () Unit!21690)

(declare-fun choose!114 (array!38359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21690)

(assert (=> d!90541 (= lt!296875 (choose!114 lt!296743 (select (arr!18399 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90541 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90541 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296743 (select (arr!18399 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!296875)))

(declare-fun bs!19198 () Bool)

(assert (= bs!19198 d!90541))

(assert (=> bs!19198 m!614785))

(assert (=> bs!19198 m!614817))

(assert (=> bs!19198 m!614785))

(declare-fun m!615067 () Bool)

(assert (=> bs!19198 m!615067))

(assert (=> b!640950 d!90541))

(declare-fun d!90543 () Bool)

(declare-fun res!415353 () Bool)

(declare-fun e!367130 () Bool)

(assert (=> d!90543 (=> res!415353 e!367130)))

(assert (=> d!90543 (= res!415353 (= (select (arr!18399 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!90543 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!367130)))

(declare-fun b!641237 () Bool)

(declare-fun e!367131 () Bool)

(assert (=> b!641237 (= e!367130 e!367131)))

(declare-fun res!415354 () Bool)

(assert (=> b!641237 (=> (not res!415354) (not e!367131))))

(assert (=> b!641237 (= res!415354 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18763 a!2986)))))

(declare-fun b!641238 () Bool)

(assert (=> b!641238 (= e!367131 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90543 (not res!415353)) b!641237))

(assert (= (and b!641237 res!415354) b!641238))

(assert (=> d!90543 m!615019))

(declare-fun m!615083 () Bool)

(assert (=> b!641238 m!615083))

(assert (=> b!640949 d!90543))

(declare-fun d!90547 () Bool)

(declare-fun e!367144 () Bool)

(assert (=> d!90547 e!367144))

(declare-fun res!415361 () Bool)

(assert (=> d!90547 (=> (not res!415361) (not e!367144))))

(assert (=> d!90547 (= res!415361 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18763 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18763 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18763 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18763 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18763 a!2986))))))

(declare-fun lt!296886 () Unit!21690)

(declare-fun choose!9 (array!38359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21690)

(assert (=> d!90547 (= lt!296886 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90547 (validMask!0 mask!3053)))

(assert (=> d!90547 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 mask!3053) lt!296886)))

(declare-fun b!641257 () Bool)

(assert (=> b!641257 (= e!367144 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 (select (arr!18399 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 (select (store (arr!18399 a!2986) i!1108 k!1786) j!136) (array!38360 (store (arr!18399 a!2986) i!1108 k!1786) (size!18763 a!2986)) mask!3053)))))

(assert (= (and d!90547 res!415361) b!641257))

(declare-fun m!615091 () Bool)

(assert (=> d!90547 m!615091))

(assert (=> d!90547 m!614809))

(assert (=> b!641257 m!614831))

(assert (=> b!641257 m!614787))

(assert (=> b!641257 m!614831))

(declare-fun m!615093 () Bool)

(assert (=> b!641257 m!615093))

(assert (=> b!641257 m!614785))

(assert (=> b!641257 m!614841))

(assert (=> b!641257 m!614785))

(assert (=> b!640960 d!90547))

(declare-fun d!90551 () Bool)

(declare-fun lt!296895 () (_ BitVec 32))

(assert (=> d!90551 (and (bvsge lt!296895 #b00000000000000000000000000000000) (bvslt lt!296895 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90551 (= lt!296895 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90551 (validMask!0 mask!3053)))

(assert (=> d!90551 (= (nextIndex!0 index!984 x!910 mask!3053) lt!296895)))

(declare-fun bs!19199 () Bool)

(assert (= bs!19199 d!90551))

(declare-fun m!615121 () Bool)

(assert (=> bs!19199 m!615121))

(assert (=> bs!19199 m!614809))

(assert (=> b!640960 d!90551))

(declare-fun b!641271 () Bool)

(declare-fun e!367152 () SeekEntryResult!6839)

(assert (=> b!641271 (= e!367152 (MissingVacant!6839 vacantSpotIndex!68))))

(declare-fun b!641272 () Bool)

(assert (=> b!641272 (= e!367152 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296745 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18399 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!90559 () Bool)

(declare-fun lt!296899 () SeekEntryResult!6839)

(assert (=> d!90559 (and (or (is-Undefined!6839 lt!296899) (not (is-Found!6839 lt!296899)) (and (bvsge (index!29677 lt!296899) #b00000000000000000000000000000000) (bvslt (index!29677 lt!296899) (size!18763 a!2986)))) (or (is-Undefined!6839 lt!296899) (is-Found!6839 lt!296899) (not (is-MissingVacant!6839 lt!296899)) (not (= (index!29679 lt!296899) vacantSpotIndex!68)) (and (bvsge (index!29679 lt!296899) #b00000000000000000000000000000000) (bvslt (index!29679 lt!296899) (size!18763 a!2986)))) (or (is-Undefined!6839 lt!296899) (ite (is-Found!6839 lt!296899) (= (select (arr!18399 a!2986) (index!29677 lt!296899)) (select (arr!18399 a!2986) j!136)) (and (is-MissingVacant!6839 lt!296899) (= (index!29679 lt!296899) vacantSpotIndex!68) (= (select (arr!18399 a!2986) (index!29679 lt!296899)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!367153 () SeekEntryResult!6839)

(assert (=> d!90559 (= lt!296899 e!367153)))

(declare-fun c!73321 () Bool)

(assert (=> d!90559 (= c!73321 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!296898 () (_ BitVec 64))

(assert (=> d!90559 (= lt!296898 (select (arr!18399 a!2986) lt!296745))))

(assert (=> d!90559 (validMask!0 mask!3053)))

(assert (=> d!90559 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 (select (arr!18399 a!2986) j!136) a!2986 mask!3053) lt!296899)))

(declare-fun b!641273 () Bool)

(assert (=> b!641273 (= e!367153 Undefined!6839)))

(declare-fun b!641274 () Bool)

(declare-fun e!367154 () SeekEntryResult!6839)

(assert (=> b!641274 (= e!367154 (Found!6839 lt!296745))))

(declare-fun b!641275 () Bool)

(assert (=> b!641275 (= e!367153 e!367154)))

(declare-fun c!73322 () Bool)

(assert (=> b!641275 (= c!73322 (= lt!296898 (select (arr!18399 a!2986) j!136)))))

(declare-fun b!641276 () Bool)

(declare-fun c!73323 () Bool)

(assert (=> b!641276 (= c!73323 (= lt!296898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641276 (= e!367154 e!367152)))

(assert (= (and d!90559 c!73321) b!641273))

(assert (= (and d!90559 (not c!73321)) b!641275))

(assert (= (and b!641275 c!73322) b!641274))

(assert (= (and b!641275 (not c!73322)) b!641276))

(assert (= (and b!641276 c!73323) b!641271))

(assert (= (and b!641276 (not c!73323)) b!641272))

(declare-fun m!615125 () Bool)

(assert (=> b!641272 m!615125))

(assert (=> b!641272 m!615125))

(assert (=> b!641272 m!614785))

(declare-fun m!615127 () Bool)

(assert (=> b!641272 m!615127))

(declare-fun m!615129 () Bool)

(assert (=> d!90559 m!615129))

(declare-fun m!615131 () Bool)

(assert (=> d!90559 m!615131))

(declare-fun m!615133 () Bool)

(assert (=> d!90559 m!615133))

(assert (=> d!90559 m!614809))

(assert (=> b!640960 d!90559))

(declare-fun b!641283 () Bool)

(declare-fun e!367158 () SeekEntryResult!6839)

(assert (=> b!641283 (= e!367158 (MissingVacant!6839 vacantSpotIndex!68))))

(declare-fun b!641284 () Bool)

(assert (=> b!641284 (= e!367158 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296745 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!296738 lt!296743 mask!3053))))

(declare-fun d!90563 () Bool)

(declare-fun lt!296904 () SeekEntryResult!6839)

(assert (=> d!90563 (and (or (is-Undefined!6839 lt!296904) (not (is-Found!6839 lt!296904)) (and (bvsge (index!29677 lt!296904) #b00000000000000000000000000000000) (bvslt (index!29677 lt!296904) (size!18763 lt!296743)))) (or (is-Undefined!6839 lt!296904) (is-Found!6839 lt!296904) (not (is-MissingVacant!6839 lt!296904)) (not (= (index!29679 lt!296904) vacantSpotIndex!68)) (and (bvsge (index!29679 lt!296904) #b00000000000000000000000000000000) (bvslt (index!29679 lt!296904) (size!18763 lt!296743)))) (or (is-Undefined!6839 lt!296904) (ite (is-Found!6839 lt!296904) (= (select (arr!18399 lt!296743) (index!29677 lt!296904)) lt!296738) (and (is-MissingVacant!6839 lt!296904) (= (index!29679 lt!296904) vacantSpotIndex!68) (= (select (arr!18399 lt!296743) (index!29679 lt!296904)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!367159 () SeekEntryResult!6839)

(assert (=> d!90563 (= lt!296904 e!367159)))

(declare-fun c!73327 () Bool)

(assert (=> d!90563 (= c!73327 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!296903 () (_ BitVec 64))

(assert (=> d!90563 (= lt!296903 (select (arr!18399 lt!296743) lt!296745))))

(assert (=> d!90563 (validMask!0 mask!3053)))

(assert (=> d!90563 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296745 vacantSpotIndex!68 lt!296738 lt!296743 mask!3053) lt!296904)))

(declare-fun b!641285 () Bool)

(assert (=> b!641285 (= e!367159 Undefined!6839)))

(declare-fun b!641286 () Bool)

(declare-fun e!367160 () SeekEntryResult!6839)

(assert (=> b!641286 (= e!367160 (Found!6839 lt!296745))))

(declare-fun b!641287 () Bool)

(assert (=> b!641287 (= e!367159 e!367160)))

(declare-fun c!73328 () Bool)

(assert (=> b!641287 (= c!73328 (= lt!296903 lt!296738))))

(declare-fun b!641288 () Bool)

(declare-fun c!73329 () Bool)

(assert (=> b!641288 (= c!73329 (= lt!296903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641288 (= e!367160 e!367158)))

(assert (= (and d!90563 c!73327) b!641285))

(assert (= (and d!90563 (not c!73327)) b!641287))

(assert (= (and b!641287 c!73328) b!641286))

(assert (= (and b!641287 (not c!73328)) b!641288))

(assert (= (and b!641288 c!73329) b!641283))

(assert (= (and b!641288 (not c!73329)) b!641284))

(assert (=> b!641284 m!615125))

(assert (=> b!641284 m!615125))

(declare-fun m!615141 () Bool)

(assert (=> b!641284 m!615141))

(declare-fun m!615143 () Bool)

(assert (=> d!90563 m!615143))

(declare-fun m!615145 () Bool)

(assert (=> d!90563 m!615145))

(declare-fun m!615147 () Bool)

(assert (=> d!90563 m!615147))

(assert (=> d!90563 m!614809))

(assert (=> b!640960 d!90563))

(declare-fun b!641295 () Bool)

(declare-fun e!367164 () SeekEntryResult!6839)

(assert (=> b!641295 (= e!367164 (MissingVacant!6839 vacantSpotIndex!68))))

(declare-fun b!641296 () Bool)

(assert (=> b!641296 (= e!367164 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!296738 lt!296743 mask!3053))))

(declare-fun lt!296908 () SeekEntryResult!6839)

(declare-fun d!90567 () Bool)

(assert (=> d!90567 (and (or (is-Undefined!6839 lt!296908) (not (is-Found!6839 lt!296908)) (and (bvsge (index!29677 lt!296908) #b00000000000000000000000000000000) (bvslt (index!29677 lt!296908) (size!18763 lt!296743)))) (or (is-Undefined!6839 lt!296908) (is-Found!6839 lt!296908) (not (is-MissingVacant!6839 lt!296908)) (not (= (index!29679 lt!296908) vacantSpotIndex!68)) (and (bvsge (index!29679 lt!296908) #b00000000000000000000000000000000) (bvslt (index!29679 lt!296908) (size!18763 lt!296743)))) (or (is-Undefined!6839 lt!296908) (ite (is-Found!6839 lt!296908) (= (select (arr!18399 lt!296743) (index!29677 lt!296908)) lt!296738) (and (is-MissingVacant!6839 lt!296908) (= (index!29679 lt!296908) vacantSpotIndex!68) (= (select (arr!18399 lt!296743) (index!29679 lt!296908)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!367165 () SeekEntryResult!6839)

(assert (=> d!90567 (= lt!296908 e!367165)))

(declare-fun c!73333 () Bool)

(assert (=> d!90567 (= c!73333 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!296907 () (_ BitVec 64))

(assert (=> d!90567 (= lt!296907 (select (arr!18399 lt!296743) index!984))))

(assert (=> d!90567 (validMask!0 mask!3053)))

(assert (=> d!90567 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296738 lt!296743 mask!3053) lt!296908)))

(declare-fun b!641297 () Bool)

(assert (=> b!641297 (= e!367165 Undefined!6839)))

(declare-fun b!641298 () Bool)

(declare-fun e!367166 () SeekEntryResult!6839)

(assert (=> b!641298 (= e!367166 (Found!6839 index!984))))

(declare-fun b!641299 () Bool)

(assert (=> b!641299 (= e!367165 e!367166)))

(declare-fun c!73334 () Bool)

(assert (=> b!641299 (= c!73334 (= lt!296907 lt!296738))))

(declare-fun b!641300 () Bool)

(declare-fun c!73335 () Bool)

(assert (=> b!641300 (= c!73335 (= lt!296907 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641300 (= e!367166 e!367164)))

(assert (= (and d!90567 c!73333) b!641297))

(assert (= (and d!90567 (not c!73333)) b!641299))

(assert (= (and b!641299 c!73334) b!641298))

(assert (= (and b!641299 (not c!73334)) b!641300))

(assert (= (and b!641300 c!73335) b!641295))

(assert (= (and b!641300 (not c!73335)) b!641296))

(assert (=> b!641296 m!614839))

(assert (=> b!641296 m!614839))

(declare-fun m!615157 () Bool)

(assert (=> b!641296 m!615157))

(declare-fun m!615159 () Bool)

(assert (=> d!90567 m!615159))

(declare-fun m!615161 () Bool)

(assert (=> d!90567 m!615161))

(declare-fun m!615163 () Bool)

(assert (=> d!90567 m!615163))

(assert (=> d!90567 m!614809))

(assert (=> b!640960 d!90567))

(declare-fun d!90569 () Bool)

(assert (=> d!90569 (= (validKeyInArray!0 (select (arr!18399 a!2986) j!136)) (and (not (= (select (arr!18399 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18399 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!640959 d!90569))

(declare-fun e!367174 () SeekEntryResult!6839)

(declare-fun b!641313 () Bool)

(declare-fun lt!296916 () SeekEntryResult!6839)

(assert (=> b!641313 (= e!367174 (seekKeyOrZeroReturnVacant!0 (x!58435 lt!296916) (index!29678 lt!296916) (index!29678 lt!296916) k!1786 a!2986 mask!3053))))

(declare-fun b!641314 () Bool)

(declare-fun e!367173 () SeekEntryResult!6839)

(assert (=> b!641314 (= e!367173 (Found!6839 (index!29678 lt!296916)))))

(declare-fun b!641315 () Bool)

(assert (=> b!641315 (= e!367174 (MissingZero!6839 (index!29678 lt!296916)))))

(declare-fun b!641317 () Bool)

(declare-fun e!367175 () SeekEntryResult!6839)

(assert (=> b!641317 (= e!367175 e!367173)))

(declare-fun lt!296917 () (_ BitVec 64))

(assert (=> b!641317 (= lt!296917 (select (arr!18399 a!2986) (index!29678 lt!296916)))))

(declare-fun c!73342 () Bool)

(assert (=> b!641317 (= c!73342 (= lt!296917 k!1786))))

