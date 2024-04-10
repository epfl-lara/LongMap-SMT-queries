; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59340 () Bool)

(assert start!59340)

(declare-fun b!654813 () Bool)

(declare-fun res!424766 () Bool)

(declare-fun e!376045 () Bool)

(assert (=> b!654813 (=> (not res!424766) (not e!376045))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38660 0))(
  ( (array!38661 (arr!18530 (Array (_ BitVec 32) (_ BitVec 64))) (size!18894 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38660)

(assert (=> b!654813 (= res!424766 (and (= (size!18894 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18894 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18894 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654814 () Bool)

(declare-fun e!376049 () Bool)

(declare-fun e!376055 () Bool)

(assert (=> b!654814 (= e!376049 e!376055)))

(declare-fun res!424757 () Bool)

(assert (=> b!654814 (=> (not res!424757) (not e!376055))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!654814 (= res!424757 (= (select (store (arr!18530 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!305178 () array!38660)

(assert (=> b!654814 (= lt!305178 (array!38661 (store (arr!18530 a!2986) i!1108 k!1786) (size!18894 a!2986)))))

(declare-fun b!654815 () Bool)

(declare-fun e!376047 () Bool)

(assert (=> b!654815 (= e!376055 e!376047)))

(declare-fun res!424767 () Bool)

(assert (=> b!654815 (=> (not res!424767) (not e!376047))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6970 0))(
  ( (MissingZero!6970 (index!30239 (_ BitVec 32))) (Found!6970 (index!30240 (_ BitVec 32))) (Intermediate!6970 (undefined!7782 Bool) (index!30241 (_ BitVec 32)) (x!59027 (_ BitVec 32))) (Undefined!6970) (MissingVacant!6970 (index!30242 (_ BitVec 32))) )
))
(declare-fun lt!305163 () SeekEntryResult!6970)

(assert (=> b!654815 (= res!424767 (and (= lt!305163 (Found!6970 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18530 a!2986) index!984) (select (arr!18530 a!2986) j!136))) (not (= (select (arr!18530 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38660 (_ BitVec 32)) SeekEntryResult!6970)

(assert (=> b!654815 (= lt!305163 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18530 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654816 () Bool)

(declare-fun res!424758 () Bool)

(assert (=> b!654816 (=> (not res!424758) (not e!376045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654816 (= res!424758 (validKeyInArray!0 (select (arr!18530 a!2986) j!136)))))

(declare-fun b!654817 () Bool)

(declare-fun e!376048 () Bool)

(declare-fun arrayContainsKey!0 (array!38660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654817 (= e!376048 (arrayContainsKey!0 lt!305178 (select (arr!18530 a!2986) j!136) index!984))))

(declare-fun b!654818 () Bool)

(assert (=> b!654818 (= e!376045 e!376049)))

(declare-fun res!424762 () Bool)

(assert (=> b!654818 (=> (not res!424762) (not e!376049))))

(declare-fun lt!305165 () SeekEntryResult!6970)

(assert (=> b!654818 (= res!424762 (or (= lt!305165 (MissingZero!6970 i!1108)) (= lt!305165 (MissingVacant!6970 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38660 (_ BitVec 32)) SeekEntryResult!6970)

(assert (=> b!654818 (= lt!305165 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!654819 () Bool)

(declare-fun e!376042 () Bool)

(declare-fun lt!305173 () SeekEntryResult!6970)

(assert (=> b!654819 (= e!376042 (= lt!305163 lt!305173))))

(declare-fun b!654820 () Bool)

(declare-fun e!376051 () Bool)

(declare-fun e!376044 () Bool)

(assert (=> b!654820 (= e!376051 e!376044)))

(declare-fun res!424759 () Bool)

(assert (=> b!654820 (=> res!424759 e!376044)))

(declare-fun lt!305180 () (_ BitVec 64))

(declare-fun lt!305174 () (_ BitVec 64))

(assert (=> b!654820 (= res!424759 (or (not (= (select (arr!18530 a!2986) j!136) lt!305180)) (not (= (select (arr!18530 a!2986) j!136) lt!305174))))))

(declare-fun e!376050 () Bool)

(assert (=> b!654820 e!376050))

(declare-fun res!424756 () Bool)

(assert (=> b!654820 (=> (not res!424756) (not e!376050))))

(assert (=> b!654820 (= res!424756 (= lt!305174 (select (arr!18530 a!2986) j!136)))))

(assert (=> b!654820 (= lt!305174 (select (store (arr!18530 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!654821 () Bool)

(declare-fun e!376052 () Bool)

(assert (=> b!654821 (= e!376050 e!376052)))

(declare-fun res!424772 () Bool)

(assert (=> b!654821 (=> res!424772 e!376052)))

(assert (=> b!654821 (= res!424772 (or (not (= (select (arr!18530 a!2986) j!136) lt!305180)) (not (= (select (arr!18530 a!2986) j!136) lt!305174)) (bvsge j!136 index!984)))))

(declare-fun res!424763 () Bool)

(assert (=> start!59340 (=> (not res!424763) (not e!376045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59340 (= res!424763 (validMask!0 mask!3053))))

(assert (=> start!59340 e!376045))

(assert (=> start!59340 true))

(declare-fun array_inv!14326 (array!38660) Bool)

(assert (=> start!59340 (array_inv!14326 a!2986)))

(declare-fun b!654822 () Bool)

(declare-fun res!424764 () Bool)

(assert (=> b!654822 (=> (not res!424764) (not e!376049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38660 (_ BitVec 32)) Bool)

(assert (=> b!654822 (= res!424764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654823 () Bool)

(declare-datatypes ((Unit!22456 0))(
  ( (Unit!22457) )
))
(declare-fun e!376054 () Unit!22456)

(declare-fun Unit!22458 () Unit!22456)

(assert (=> b!654823 (= e!376054 Unit!22458)))

(declare-fun b!654824 () Bool)

(declare-fun res!424755 () Bool)

(assert (=> b!654824 (=> (not res!424755) (not e!376045))))

(assert (=> b!654824 (= res!424755 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654825 () Bool)

(declare-fun e!376043 () Bool)

(assert (=> b!654825 (= e!376043 (arrayContainsKey!0 lt!305178 (select (arr!18530 a!2986) j!136) index!984))))

(declare-fun b!654826 () Bool)

(assert (=> b!654826 (= e!376047 (not e!376051))))

(declare-fun res!424770 () Bool)

(assert (=> b!654826 (=> res!424770 e!376051)))

(declare-fun lt!305179 () SeekEntryResult!6970)

(assert (=> b!654826 (= res!424770 (not (= lt!305179 (Found!6970 index!984))))))

(declare-fun lt!305169 () Unit!22456)

(declare-fun e!376056 () Unit!22456)

(assert (=> b!654826 (= lt!305169 e!376056)))

(declare-fun c!75397 () Bool)

(assert (=> b!654826 (= c!75397 (= lt!305179 Undefined!6970))))

(assert (=> b!654826 (= lt!305179 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305180 lt!305178 mask!3053))))

(assert (=> b!654826 e!376042))

(declare-fun res!424769 () Bool)

(assert (=> b!654826 (=> (not res!424769) (not e!376042))))

(declare-fun lt!305176 () (_ BitVec 32))

(assert (=> b!654826 (= res!424769 (= lt!305173 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305176 vacantSpotIndex!68 lt!305180 lt!305178 mask!3053)))))

(assert (=> b!654826 (= lt!305173 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305176 vacantSpotIndex!68 (select (arr!18530 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654826 (= lt!305180 (select (store (arr!18530 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305167 () Unit!22456)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38660 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22456)

(assert (=> b!654826 (= lt!305167 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305176 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654826 (= lt!305176 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654827 () Bool)

(declare-fun e!376053 () Unit!22456)

(declare-fun Unit!22459 () Unit!22456)

(assert (=> b!654827 (= e!376053 Unit!22459)))

(declare-fun b!654828 () Bool)

(declare-fun res!424765 () Bool)

(assert (=> b!654828 (=> (not res!424765) (not e!376049))))

(assert (=> b!654828 (= res!424765 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18530 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654829 () Bool)

(declare-fun Unit!22460 () Unit!22456)

(assert (=> b!654829 (= e!376053 Unit!22460)))

(declare-fun lt!305177 () Unit!22456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22456)

(assert (=> b!654829 (= lt!305177 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305178 (select (arr!18530 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654829 (arrayContainsKey!0 lt!305178 (select (arr!18530 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305171 () Unit!22456)

(declare-datatypes ((List!12571 0))(
  ( (Nil!12568) (Cons!12567 (h!13612 (_ BitVec 64)) (t!18799 List!12571)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12571) Unit!22456)

(assert (=> b!654829 (= lt!305171 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12568))))

(declare-fun arrayNoDuplicates!0 (array!38660 (_ BitVec 32) List!12571) Bool)

(assert (=> b!654829 (arrayNoDuplicates!0 lt!305178 #b00000000000000000000000000000000 Nil!12568)))

(declare-fun lt!305166 () Unit!22456)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38660 (_ BitVec 32) (_ BitVec 32)) Unit!22456)

(assert (=> b!654829 (= lt!305166 (lemmaNoDuplicateFromThenFromBigger!0 lt!305178 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654829 (arrayNoDuplicates!0 lt!305178 j!136 Nil!12568)))

(declare-fun lt!305175 () Unit!22456)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38660 (_ BitVec 64) (_ BitVec 32) List!12571) Unit!22456)

(assert (=> b!654829 (= lt!305175 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305178 (select (arr!18530 a!2986) j!136) j!136 Nil!12568))))

(assert (=> b!654829 false))

(declare-fun b!654830 () Bool)

(declare-fun Unit!22461 () Unit!22456)

(assert (=> b!654830 (= e!376056 Unit!22461)))

(assert (=> b!654830 false))

(declare-fun b!654831 () Bool)

(declare-fun Unit!22462 () Unit!22456)

(assert (=> b!654831 (= e!376054 Unit!22462)))

(declare-fun res!424768 () Bool)

(assert (=> b!654831 (= res!424768 (arrayContainsKey!0 lt!305178 (select (arr!18530 a!2986) j!136) j!136))))

(assert (=> b!654831 (=> (not res!424768) (not e!376048))))

(assert (=> b!654831 e!376048))

(declare-fun lt!305168 () Unit!22456)

(assert (=> b!654831 (= lt!305168 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305178 (select (arr!18530 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654831 (arrayContainsKey!0 lt!305178 (select (arr!18530 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305172 () Unit!22456)

(assert (=> b!654831 (= lt!305172 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12568))))

(assert (=> b!654831 (arrayNoDuplicates!0 lt!305178 #b00000000000000000000000000000000 Nil!12568)))

(declare-fun lt!305170 () Unit!22456)

(assert (=> b!654831 (= lt!305170 (lemmaNoDuplicateFromThenFromBigger!0 lt!305178 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654831 (arrayNoDuplicates!0 lt!305178 index!984 Nil!12568)))

(declare-fun lt!305181 () Unit!22456)

(assert (=> b!654831 (= lt!305181 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305178 (select (arr!18530 a!2986) j!136) index!984 Nil!12568))))

(assert (=> b!654831 false))

(declare-fun b!654832 () Bool)

(assert (=> b!654832 (= e!376052 e!376043)))

(declare-fun res!424771 () Bool)

(assert (=> b!654832 (=> (not res!424771) (not e!376043))))

(assert (=> b!654832 (= res!424771 (arrayContainsKey!0 lt!305178 (select (arr!18530 a!2986) j!136) j!136))))

(declare-fun b!654833 () Bool)

(declare-fun Unit!22463 () Unit!22456)

(assert (=> b!654833 (= e!376056 Unit!22463)))

(declare-fun b!654834 () Bool)

(declare-fun res!424760 () Bool)

(assert (=> b!654834 (=> (not res!424760) (not e!376045))))

(assert (=> b!654834 (= res!424760 (validKeyInArray!0 k!1786))))

(declare-fun b!654835 () Bool)

(assert (=> b!654835 (= e!376044 true)))

(assert (=> b!654835 false))

(declare-fun lt!305164 () Unit!22456)

(assert (=> b!654835 (= lt!305164 e!376054)))

(declare-fun c!75398 () Bool)

(assert (=> b!654835 (= c!75398 (bvslt index!984 j!136))))

(declare-fun lt!305182 () Unit!22456)

(assert (=> b!654835 (= lt!305182 e!376053)))

(declare-fun c!75396 () Bool)

(assert (=> b!654835 (= c!75396 (bvslt j!136 index!984))))

(declare-fun b!654836 () Bool)

(declare-fun res!424761 () Bool)

(assert (=> b!654836 (=> (not res!424761) (not e!376049))))

(assert (=> b!654836 (= res!424761 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12568))))

(assert (= (and start!59340 res!424763) b!654813))

(assert (= (and b!654813 res!424766) b!654816))

(assert (= (and b!654816 res!424758) b!654834))

(assert (= (and b!654834 res!424760) b!654824))

(assert (= (and b!654824 res!424755) b!654818))

(assert (= (and b!654818 res!424762) b!654822))

(assert (= (and b!654822 res!424764) b!654836))

(assert (= (and b!654836 res!424761) b!654828))

(assert (= (and b!654828 res!424765) b!654814))

(assert (= (and b!654814 res!424757) b!654815))

(assert (= (and b!654815 res!424767) b!654826))

(assert (= (and b!654826 res!424769) b!654819))

(assert (= (and b!654826 c!75397) b!654830))

(assert (= (and b!654826 (not c!75397)) b!654833))

(assert (= (and b!654826 (not res!424770)) b!654820))

(assert (= (and b!654820 res!424756) b!654821))

(assert (= (and b!654821 (not res!424772)) b!654832))

(assert (= (and b!654832 res!424771) b!654825))

(assert (= (and b!654820 (not res!424759)) b!654835))

(assert (= (and b!654835 c!75396) b!654829))

(assert (= (and b!654835 (not c!75396)) b!654827))

(assert (= (and b!654835 c!75398) b!654831))

(assert (= (and b!654835 (not c!75398)) b!654823))

(assert (= (and b!654831 res!424768) b!654817))

(declare-fun m!627907 () Bool)

(assert (=> b!654814 m!627907))

(declare-fun m!627909 () Bool)

(assert (=> b!654814 m!627909))

(declare-fun m!627911 () Bool)

(assert (=> b!654829 m!627911))

(declare-fun m!627913 () Bool)

(assert (=> b!654829 m!627913))

(declare-fun m!627915 () Bool)

(assert (=> b!654829 m!627915))

(assert (=> b!654829 m!627911))

(assert (=> b!654829 m!627911))

(declare-fun m!627917 () Bool)

(assert (=> b!654829 m!627917))

(declare-fun m!627919 () Bool)

(assert (=> b!654829 m!627919))

(assert (=> b!654829 m!627911))

(declare-fun m!627921 () Bool)

(assert (=> b!654829 m!627921))

(declare-fun m!627923 () Bool)

(assert (=> b!654829 m!627923))

(declare-fun m!627925 () Bool)

(assert (=> b!654829 m!627925))

(declare-fun m!627927 () Bool)

(assert (=> b!654834 m!627927))

(declare-fun m!627929 () Bool)

(assert (=> b!654831 m!627929))

(assert (=> b!654831 m!627911))

(declare-fun m!627931 () Bool)

(assert (=> b!654831 m!627931))

(declare-fun m!627933 () Bool)

(assert (=> b!654831 m!627933))

(assert (=> b!654831 m!627919))

(assert (=> b!654831 m!627911))

(declare-fun m!627935 () Bool)

(assert (=> b!654831 m!627935))

(assert (=> b!654831 m!627911))

(declare-fun m!627937 () Bool)

(assert (=> b!654831 m!627937))

(assert (=> b!654831 m!627925))

(assert (=> b!654831 m!627911))

(assert (=> b!654831 m!627911))

(declare-fun m!627939 () Bool)

(assert (=> b!654831 m!627939))

(declare-fun m!627941 () Bool)

(assert (=> b!654828 m!627941))

(assert (=> b!654820 m!627911))

(assert (=> b!654820 m!627907))

(declare-fun m!627943 () Bool)

(assert (=> b!654820 m!627943))

(declare-fun m!627945 () Bool)

(assert (=> b!654822 m!627945))

(declare-fun m!627947 () Bool)

(assert (=> b!654836 m!627947))

(assert (=> b!654825 m!627911))

(assert (=> b!654825 m!627911))

(declare-fun m!627949 () Bool)

(assert (=> b!654825 m!627949))

(declare-fun m!627951 () Bool)

(assert (=> start!59340 m!627951))

(declare-fun m!627953 () Bool)

(assert (=> start!59340 m!627953))

(assert (=> b!654817 m!627911))

(assert (=> b!654817 m!627911))

(assert (=> b!654817 m!627949))

(declare-fun m!627955 () Bool)

(assert (=> b!654818 m!627955))

(declare-fun m!627957 () Bool)

(assert (=> b!654826 m!627957))

(declare-fun m!627959 () Bool)

(assert (=> b!654826 m!627959))

(declare-fun m!627961 () Bool)

(assert (=> b!654826 m!627961))

(assert (=> b!654826 m!627911))

(declare-fun m!627963 () Bool)

(assert (=> b!654826 m!627963))

(assert (=> b!654826 m!627907))

(declare-fun m!627965 () Bool)

(assert (=> b!654826 m!627965))

(assert (=> b!654826 m!627911))

(declare-fun m!627967 () Bool)

(assert (=> b!654826 m!627967))

(assert (=> b!654832 m!627911))

(assert (=> b!654832 m!627911))

(assert (=> b!654832 m!627935))

(assert (=> b!654821 m!627911))

(assert (=> b!654816 m!627911))

(assert (=> b!654816 m!627911))

(declare-fun m!627969 () Bool)

(assert (=> b!654816 m!627969))

(declare-fun m!627971 () Bool)

(assert (=> b!654824 m!627971))

(declare-fun m!627973 () Bool)

(assert (=> b!654815 m!627973))

(assert (=> b!654815 m!627911))

(assert (=> b!654815 m!627911))

(declare-fun m!627975 () Bool)

(assert (=> b!654815 m!627975))

(push 1)

