; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58884 () Bool)

(assert start!58884)

(declare-fun b!649751 () Bool)

(declare-fun e!372708 () Bool)

(declare-datatypes ((SeekEntryResult!6919 0))(
  ( (MissingZero!6919 (index!30023 (_ BitVec 32))) (Found!6919 (index!30024 (_ BitVec 32))) (Intermediate!6919 (undefined!7731 Bool) (index!30025 (_ BitVec 32)) (x!58804 (_ BitVec 32))) (Undefined!6919) (MissingVacant!6919 (index!30026 (_ BitVec 32))) )
))
(declare-fun lt!301790 () SeekEntryResult!6919)

(declare-fun lt!301792 () SeekEntryResult!6919)

(assert (=> b!649751 (= e!372708 (= lt!301790 lt!301792))))

(declare-fun b!649752 () Bool)

(declare-fun e!372701 () Bool)

(declare-fun e!372707 () Bool)

(assert (=> b!649752 (= e!372701 e!372707)))

(declare-fun res!421206 () Bool)

(assert (=> b!649752 (=> res!421206 e!372707)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!301800 () (_ BitVec 64))

(declare-fun lt!301798 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38546 0))(
  ( (array!38547 (arr!18479 (Array (_ BitVec 32) (_ BitVec 64))) (size!18843 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38546)

(assert (=> b!649752 (= res!421206 (or (not (= (select (arr!18479 a!2986) j!136) lt!301798)) (not (= (select (arr!18479 a!2986) j!136) lt!301800)) (bvsge j!136 index!984)))))

(declare-fun b!649753 () Bool)

(declare-fun e!372704 () Bool)

(declare-fun e!372699 () Bool)

(assert (=> b!649753 (= e!372704 e!372699)))

(declare-fun res!421214 () Bool)

(assert (=> b!649753 (=> (not res!421214) (not e!372699))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!649753 (= res!421214 (and (= lt!301790 (Found!6919 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18479 a!2986) index!984) (select (arr!18479 a!2986) j!136))) (not (= (select (arr!18479 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38546 (_ BitVec 32)) SeekEntryResult!6919)

(assert (=> b!649753 (= lt!301790 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18479 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649754 () Bool)

(declare-fun e!372705 () Bool)

(assert (=> b!649754 (= e!372699 (not e!372705))))

(declare-fun res!421201 () Bool)

(assert (=> b!649754 (=> res!421201 e!372705)))

(declare-fun lt!301793 () SeekEntryResult!6919)

(assert (=> b!649754 (= res!421201 (not (= lt!301793 (Found!6919 index!984))))))

(declare-datatypes ((Unit!22140 0))(
  ( (Unit!22141) )
))
(declare-fun lt!301796 () Unit!22140)

(declare-fun e!372702 () Unit!22140)

(assert (=> b!649754 (= lt!301796 e!372702)))

(declare-fun c!74645 () Bool)

(assert (=> b!649754 (= c!74645 (= lt!301793 Undefined!6919))))

(declare-fun lt!301797 () array!38546)

(assert (=> b!649754 (= lt!301793 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301798 lt!301797 mask!3053))))

(assert (=> b!649754 e!372708))

(declare-fun res!421202 () Bool)

(assert (=> b!649754 (=> (not res!421202) (not e!372708))))

(declare-fun lt!301786 () (_ BitVec 32))

(assert (=> b!649754 (= res!421202 (= lt!301792 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301786 vacantSpotIndex!68 lt!301798 lt!301797 mask!3053)))))

(assert (=> b!649754 (= lt!301792 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301786 vacantSpotIndex!68 (select (arr!18479 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!649754 (= lt!301798 (select (store (arr!18479 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301788 () Unit!22140)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38546 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22140)

(assert (=> b!649754 (= lt!301788 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301786 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649754 (= lt!301786 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649755 () Bool)

(declare-fun e!372706 () Unit!22140)

(declare-fun Unit!22142 () Unit!22140)

(assert (=> b!649755 (= e!372706 Unit!22142)))

(declare-fun b!649756 () Bool)

(declare-fun Unit!22143 () Unit!22140)

(assert (=> b!649756 (= e!372706 Unit!22143)))

(declare-fun lt!301801 () Unit!22140)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38546 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22140)

(assert (=> b!649756 (= lt!301801 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301797 (select (arr!18479 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649756 (arrayContainsKey!0 lt!301797 (select (arr!18479 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301795 () Unit!22140)

(declare-datatypes ((List!12520 0))(
  ( (Nil!12517) (Cons!12516 (h!13561 (_ BitVec 64)) (t!18748 List!12520)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38546 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12520) Unit!22140)

(assert (=> b!649756 (= lt!301795 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12517))))

(declare-fun arrayNoDuplicates!0 (array!38546 (_ BitVec 32) List!12520) Bool)

(assert (=> b!649756 (arrayNoDuplicates!0 lt!301797 #b00000000000000000000000000000000 Nil!12517)))

(declare-fun lt!301791 () Unit!22140)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38546 (_ BitVec 32) (_ BitVec 32)) Unit!22140)

(assert (=> b!649756 (= lt!301791 (lemmaNoDuplicateFromThenFromBigger!0 lt!301797 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649756 (arrayNoDuplicates!0 lt!301797 j!136 Nil!12517)))

(declare-fun lt!301794 () Unit!22140)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38546 (_ BitVec 64) (_ BitVec 32) List!12520) Unit!22140)

(assert (=> b!649756 (= lt!301794 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301797 (select (arr!18479 a!2986) j!136) j!136 Nil!12517))))

(assert (=> b!649756 false))

(declare-fun b!649757 () Bool)

(declare-fun res!421210 () Bool)

(declare-fun e!372698 () Bool)

(assert (=> b!649757 (=> (not res!421210) (not e!372698))))

(assert (=> b!649757 (= res!421210 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649758 () Bool)

(declare-fun e!372694 () Bool)

(assert (=> b!649758 (= e!372694 true)))

(assert (=> b!649758 (arrayNoDuplicates!0 lt!301797 #b00000000000000000000000000000000 Nil!12517)))

(declare-fun lt!301785 () Unit!22140)

(assert (=> b!649758 (= lt!301785 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12517))))

(assert (=> b!649758 (arrayContainsKey!0 lt!301797 (select (arr!18479 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301799 () Unit!22140)

(assert (=> b!649758 (= lt!301799 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301797 (select (arr!18479 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372696 () Bool)

(assert (=> b!649758 e!372696))

(declare-fun res!421196 () Bool)

(assert (=> b!649758 (=> (not res!421196) (not e!372696))))

(assert (=> b!649758 (= res!421196 (arrayContainsKey!0 lt!301797 (select (arr!18479 a!2986) j!136) j!136))))

(declare-fun b!649759 () Bool)

(declare-fun res!421213 () Bool)

(declare-fun e!372695 () Bool)

(assert (=> b!649759 (=> (not res!421213) (not e!372695))))

(assert (=> b!649759 (= res!421213 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12517))))

(declare-fun b!649760 () Bool)

(declare-fun Unit!22144 () Unit!22140)

(assert (=> b!649760 (= e!372702 Unit!22144)))

(assert (=> b!649760 false))

(declare-fun b!649761 () Bool)

(declare-fun e!372703 () Bool)

(assert (=> b!649761 (= e!372703 e!372694)))

(declare-fun res!421197 () Bool)

(assert (=> b!649761 (=> res!421197 e!372694)))

(assert (=> b!649761 (= res!421197 (bvsge index!984 j!136))))

(declare-fun lt!301787 () Unit!22140)

(assert (=> b!649761 (= lt!301787 e!372706)))

(declare-fun c!74644 () Bool)

(assert (=> b!649761 (= c!74644 (bvslt j!136 index!984))))

(declare-fun b!649762 () Bool)

(assert (=> b!649762 (= e!372705 e!372703)))

(declare-fun res!421205 () Bool)

(assert (=> b!649762 (=> res!421205 e!372703)))

(assert (=> b!649762 (= res!421205 (or (not (= (select (arr!18479 a!2986) j!136) lt!301798)) (not (= (select (arr!18479 a!2986) j!136) lt!301800))))))

(assert (=> b!649762 e!372701))

(declare-fun res!421207 () Bool)

(assert (=> b!649762 (=> (not res!421207) (not e!372701))))

(assert (=> b!649762 (= res!421207 (= lt!301800 (select (arr!18479 a!2986) j!136)))))

(assert (=> b!649762 (= lt!301800 (select (store (arr!18479 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649750 () Bool)

(declare-fun e!372700 () Bool)

(assert (=> b!649750 (= e!372707 e!372700)))

(declare-fun res!421199 () Bool)

(assert (=> b!649750 (=> (not res!421199) (not e!372700))))

(assert (=> b!649750 (= res!421199 (arrayContainsKey!0 lt!301797 (select (arr!18479 a!2986) j!136) j!136))))

(declare-fun res!421208 () Bool)

(assert (=> start!58884 (=> (not res!421208) (not e!372698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58884 (= res!421208 (validMask!0 mask!3053))))

(assert (=> start!58884 e!372698))

(assert (=> start!58884 true))

(declare-fun array_inv!14275 (array!38546) Bool)

(assert (=> start!58884 (array_inv!14275 a!2986)))

(declare-fun b!649763 () Bool)

(declare-fun res!421203 () Bool)

(assert (=> b!649763 (=> (not res!421203) (not e!372695))))

(assert (=> b!649763 (= res!421203 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18479 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649764 () Bool)

(assert (=> b!649764 (= e!372698 e!372695)))

(declare-fun res!421209 () Bool)

(assert (=> b!649764 (=> (not res!421209) (not e!372695))))

(declare-fun lt!301789 () SeekEntryResult!6919)

(assert (=> b!649764 (= res!421209 (or (= lt!301789 (MissingZero!6919 i!1108)) (= lt!301789 (MissingVacant!6919 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38546 (_ BitVec 32)) SeekEntryResult!6919)

(assert (=> b!649764 (= lt!301789 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649765 () Bool)

(declare-fun Unit!22145 () Unit!22140)

(assert (=> b!649765 (= e!372702 Unit!22145)))

(declare-fun b!649766 () Bool)

(declare-fun res!421211 () Bool)

(assert (=> b!649766 (=> (not res!421211) (not e!372698))))

(assert (=> b!649766 (= res!421211 (and (= (size!18843 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18843 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18843 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649767 () Bool)

(assert (=> b!649767 (= e!372700 (arrayContainsKey!0 lt!301797 (select (arr!18479 a!2986) j!136) index!984))))

(declare-fun b!649768 () Bool)

(declare-fun res!421212 () Bool)

(assert (=> b!649768 (=> (not res!421212) (not e!372698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649768 (= res!421212 (validKeyInArray!0 (select (arr!18479 a!2986) j!136)))))

(declare-fun b!649769 () Bool)

(assert (=> b!649769 (= e!372695 e!372704)))

(declare-fun res!421198 () Bool)

(assert (=> b!649769 (=> (not res!421198) (not e!372704))))

(assert (=> b!649769 (= res!421198 (= (select (store (arr!18479 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649769 (= lt!301797 (array!38547 (store (arr!18479 a!2986) i!1108 k!1786) (size!18843 a!2986)))))

(declare-fun b!649770 () Bool)

(declare-fun res!421204 () Bool)

(assert (=> b!649770 (=> (not res!421204) (not e!372698))))

(assert (=> b!649770 (= res!421204 (validKeyInArray!0 k!1786))))

(declare-fun b!649771 () Bool)

(assert (=> b!649771 (= e!372696 (arrayContainsKey!0 lt!301797 (select (arr!18479 a!2986) j!136) index!984))))

(declare-fun b!649772 () Bool)

(declare-fun res!421200 () Bool)

(assert (=> b!649772 (=> (not res!421200) (not e!372695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38546 (_ BitVec 32)) Bool)

(assert (=> b!649772 (= res!421200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58884 res!421208) b!649766))

(assert (= (and b!649766 res!421211) b!649768))

(assert (= (and b!649768 res!421212) b!649770))

(assert (= (and b!649770 res!421204) b!649757))

(assert (= (and b!649757 res!421210) b!649764))

(assert (= (and b!649764 res!421209) b!649772))

(assert (= (and b!649772 res!421200) b!649759))

(assert (= (and b!649759 res!421213) b!649763))

(assert (= (and b!649763 res!421203) b!649769))

(assert (= (and b!649769 res!421198) b!649753))

(assert (= (and b!649753 res!421214) b!649754))

(assert (= (and b!649754 res!421202) b!649751))

(assert (= (and b!649754 c!74645) b!649760))

(assert (= (and b!649754 (not c!74645)) b!649765))

(assert (= (and b!649754 (not res!421201)) b!649762))

(assert (= (and b!649762 res!421207) b!649752))

(assert (= (and b!649752 (not res!421206)) b!649750))

(assert (= (and b!649750 res!421199) b!649767))

(assert (= (and b!649762 (not res!421205)) b!649761))

(assert (= (and b!649761 c!74644) b!649756))

(assert (= (and b!649761 (not c!74644)) b!649755))

(assert (= (and b!649761 (not res!421197)) b!649758))

(assert (= (and b!649758 res!421196) b!649771))

(declare-fun m!622981 () Bool)

(assert (=> b!649762 m!622981))

(declare-fun m!622983 () Bool)

(assert (=> b!649762 m!622983))

(declare-fun m!622985 () Bool)

(assert (=> b!649762 m!622985))

(declare-fun m!622987 () Bool)

(assert (=> b!649759 m!622987))

(declare-fun m!622989 () Bool)

(assert (=> b!649770 m!622989))

(declare-fun m!622991 () Bool)

(assert (=> b!649764 m!622991))

(declare-fun m!622993 () Bool)

(assert (=> b!649753 m!622993))

(assert (=> b!649753 m!622981))

(assert (=> b!649753 m!622981))

(declare-fun m!622995 () Bool)

(assert (=> b!649753 m!622995))

(assert (=> b!649767 m!622981))

(assert (=> b!649767 m!622981))

(declare-fun m!622997 () Bool)

(assert (=> b!649767 m!622997))

(declare-fun m!622999 () Bool)

(assert (=> start!58884 m!622999))

(declare-fun m!623001 () Bool)

(assert (=> start!58884 m!623001))

(assert (=> b!649756 m!622981))

(declare-fun m!623003 () Bool)

(assert (=> b!649756 m!623003))

(declare-fun m!623005 () Bool)

(assert (=> b!649756 m!623005))

(assert (=> b!649756 m!622981))

(declare-fun m!623007 () Bool)

(assert (=> b!649756 m!623007))

(declare-fun m!623009 () Bool)

(assert (=> b!649756 m!623009))

(declare-fun m!623011 () Bool)

(assert (=> b!649756 m!623011))

(assert (=> b!649756 m!622981))

(declare-fun m!623013 () Bool)

(assert (=> b!649756 m!623013))

(assert (=> b!649756 m!622981))

(declare-fun m!623015 () Bool)

(assert (=> b!649756 m!623015))

(declare-fun m!623017 () Bool)

(assert (=> b!649757 m!623017))

(assert (=> b!649752 m!622981))

(declare-fun m!623019 () Bool)

(assert (=> b!649763 m!623019))

(assert (=> b!649758 m!622981))

(assert (=> b!649758 m!622981))

(declare-fun m!623021 () Bool)

(assert (=> b!649758 m!623021))

(assert (=> b!649758 m!622981))

(declare-fun m!623023 () Bool)

(assert (=> b!649758 m!623023))

(assert (=> b!649758 m!623009))

(assert (=> b!649758 m!622981))

(declare-fun m!623025 () Bool)

(assert (=> b!649758 m!623025))

(assert (=> b!649758 m!623011))

(declare-fun m!623027 () Bool)

(assert (=> b!649754 m!623027))

(declare-fun m!623029 () Bool)

(assert (=> b!649754 m!623029))

(assert (=> b!649754 m!622981))

(assert (=> b!649754 m!622983))

(declare-fun m!623031 () Bool)

(assert (=> b!649754 m!623031))

(assert (=> b!649754 m!622981))

(declare-fun m!623033 () Bool)

(assert (=> b!649754 m!623033))

(declare-fun m!623035 () Bool)

(assert (=> b!649754 m!623035))

(declare-fun m!623037 () Bool)

(assert (=> b!649754 m!623037))

(assert (=> b!649771 m!622981))

(assert (=> b!649771 m!622981))

(assert (=> b!649771 m!622997))

(assert (=> b!649750 m!622981))

(assert (=> b!649750 m!622981))

(assert (=> b!649750 m!623023))

(assert (=> b!649769 m!622983))

(declare-fun m!623039 () Bool)

(assert (=> b!649769 m!623039))

(declare-fun m!623041 () Bool)

(assert (=> b!649772 m!623041))

(assert (=> b!649768 m!622981))

(assert (=> b!649768 m!622981))

(declare-fun m!623043 () Bool)

(assert (=> b!649768 m!623043))

(push 1)

