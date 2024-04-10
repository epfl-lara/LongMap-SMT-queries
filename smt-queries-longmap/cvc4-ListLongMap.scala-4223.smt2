; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57936 () Bool)

(assert start!57936)

(declare-fun b!641065 () Bool)

(declare-fun e!367005 () Bool)

(declare-fun e!367015 () Bool)

(assert (=> b!641065 (= e!367005 e!367015)))

(declare-fun res!415264 () Bool)

(assert (=> b!641065 (=> res!415264 e!367015)))

(declare-datatypes ((array!38363 0))(
  ( (array!38364 (arr!18401 (Array (_ BitVec 32) (_ BitVec 64))) (size!18765 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38363)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!641065 (= res!415264 (or (bvsge (size!18765 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18765 a!2986))))))

(declare-fun lt!296819 () array!38363)

(declare-datatypes ((List!12442 0))(
  ( (Nil!12439) (Cons!12438 (h!13483 (_ BitVec 64)) (t!18670 List!12442)) )
))
(declare-fun arrayNoDuplicates!0 (array!38363 (_ BitVec 32) List!12442) Bool)

(assert (=> b!641065 (arrayNoDuplicates!0 lt!296819 j!136 Nil!12439)))

(declare-datatypes ((Unit!21698 0))(
  ( (Unit!21699) )
))
(declare-fun lt!296826 () Unit!21698)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38363 (_ BitVec 32) (_ BitVec 32)) Unit!21698)

(assert (=> b!641065 (= lt!296826 (lemmaNoDuplicateFromThenFromBigger!0 lt!296819 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641065 (arrayNoDuplicates!0 lt!296819 #b00000000000000000000000000000000 Nil!12439)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!296821 () Unit!21698)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12442) Unit!21698)

(assert (=> b!641065 (= lt!296821 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12439))))

(declare-fun arrayContainsKey!0 (array!38363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641065 (arrayContainsKey!0 lt!296819 (select (arr!18401 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296823 () Unit!21698)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21698)

(assert (=> b!641065 (= lt!296823 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296819 (select (arr!18401 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641066 () Bool)

(declare-fun res!415266 () Bool)

(declare-fun e!367017 () Bool)

(assert (=> b!641066 (=> (not res!415266) (not e!367017))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!641066 (= res!415266 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18401 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641067 () Bool)

(declare-fun e!367010 () Bool)

(assert (=> b!641067 (= e!367010 (arrayContainsKey!0 lt!296819 (select (arr!18401 a!2986) j!136) index!984))))

(declare-fun b!641068 () Bool)

(declare-fun res!415271 () Bool)

(declare-fun e!367016 () Bool)

(assert (=> b!641068 (=> (not res!415271) (not e!367016))))

(assert (=> b!641068 (= res!415271 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641069 () Bool)

(declare-fun e!367007 () Bool)

(assert (=> b!641069 (= e!367017 e!367007)))

(declare-fun res!415276 () Bool)

(assert (=> b!641069 (=> (not res!415276) (not e!367007))))

(assert (=> b!641069 (= res!415276 (= (select (store (arr!18401 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641069 (= lt!296819 (array!38364 (store (arr!18401 a!2986) i!1108 k!1786) (size!18765 a!2986)))))

(declare-fun b!641070 () Bool)

(declare-fun res!415273 () Bool)

(assert (=> b!641070 (=> (not res!415273) (not e!367016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641070 (= res!415273 (validKeyInArray!0 (select (arr!18401 a!2986) j!136)))))

(declare-fun b!641071 () Bool)

(declare-fun noDuplicate!401 (List!12442) Bool)

(assert (=> b!641071 (= e!367015 (noDuplicate!401 Nil!12439))))

(declare-fun b!641072 () Bool)

(assert (=> b!641072 (= e!367016 e!367017)))

(declare-fun res!415267 () Bool)

(assert (=> b!641072 (=> (not res!415267) (not e!367017))))

(declare-datatypes ((SeekEntryResult!6841 0))(
  ( (MissingZero!6841 (index!29684 (_ BitVec 32))) (Found!6841 (index!29685 (_ BitVec 32))) (Intermediate!6841 (undefined!7653 Bool) (index!29686 (_ BitVec 32)) (x!58437 (_ BitVec 32))) (Undefined!6841) (MissingVacant!6841 (index!29687 (_ BitVec 32))) )
))
(declare-fun lt!296817 () SeekEntryResult!6841)

(assert (=> b!641072 (= res!415267 (or (= lt!296817 (MissingZero!6841 i!1108)) (= lt!296817 (MissingVacant!6841 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38363 (_ BitVec 32)) SeekEntryResult!6841)

(assert (=> b!641072 (= lt!296817 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!641073 () Bool)

(declare-fun res!415280 () Bool)

(assert (=> b!641073 (=> (not res!415280) (not e!367017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38363 (_ BitVec 32)) Bool)

(assert (=> b!641073 (= res!415280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641074 () Bool)

(declare-fun res!415272 () Bool)

(assert (=> b!641074 (=> (not res!415272) (not e!367017))))

(assert (=> b!641074 (= res!415272 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12439))))

(declare-fun b!641075 () Bool)

(declare-fun res!415263 () Bool)

(assert (=> b!641075 (=> (not res!415263) (not e!367016))))

(assert (=> b!641075 (= res!415263 (and (= (size!18765 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18765 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18765 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641076 () Bool)

(declare-fun e!367011 () Unit!21698)

(declare-fun Unit!21700 () Unit!21698)

(assert (=> b!641076 (= e!367011 Unit!21700)))

(assert (=> b!641076 false))

(declare-fun res!415268 () Bool)

(assert (=> start!57936 (=> (not res!415268) (not e!367016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57936 (= res!415268 (validMask!0 mask!3053))))

(assert (=> start!57936 e!367016))

(assert (=> start!57936 true))

(declare-fun array_inv!14197 (array!38363) Bool)

(assert (=> start!57936 (array_inv!14197 a!2986)))

(declare-fun b!641077 () Bool)

(declare-fun e!367014 () Bool)

(assert (=> b!641077 (= e!367014 e!367005)))

(declare-fun res!415274 () Bool)

(assert (=> b!641077 (=> res!415274 e!367005)))

(declare-fun lt!296816 () (_ BitVec 64))

(declare-fun lt!296827 () (_ BitVec 64))

(assert (=> b!641077 (= res!415274 (or (not (= (select (arr!18401 a!2986) j!136) lt!296816)) (not (= (select (arr!18401 a!2986) j!136) lt!296827)) (bvsge j!136 index!984)))))

(declare-fun e!367013 () Bool)

(assert (=> b!641077 e!367013))

(declare-fun res!415275 () Bool)

(assert (=> b!641077 (=> (not res!415275) (not e!367013))))

(assert (=> b!641077 (= res!415275 (= lt!296827 (select (arr!18401 a!2986) j!136)))))

(assert (=> b!641077 (= lt!296827 (select (store (arr!18401 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!641078 () Bool)

(declare-fun e!367006 () Bool)

(assert (=> b!641078 (= e!367006 e!367010)))

(declare-fun res!415279 () Bool)

(assert (=> b!641078 (=> (not res!415279) (not e!367010))))

(assert (=> b!641078 (= res!415279 (arrayContainsKey!0 lt!296819 (select (arr!18401 a!2986) j!136) j!136))))

(declare-fun b!641079 () Bool)

(declare-fun e!367012 () Bool)

(assert (=> b!641079 (= e!367012 (not e!367014))))

(declare-fun res!415277 () Bool)

(assert (=> b!641079 (=> res!415277 e!367014)))

(declare-fun lt!296815 () SeekEntryResult!6841)

(assert (=> b!641079 (= res!415277 (not (= lt!296815 (Found!6841 index!984))))))

(declare-fun lt!296818 () Unit!21698)

(assert (=> b!641079 (= lt!296818 e!367011)))

(declare-fun c!73268 () Bool)

(assert (=> b!641079 (= c!73268 (= lt!296815 Undefined!6841))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38363 (_ BitVec 32)) SeekEntryResult!6841)

(assert (=> b!641079 (= lt!296815 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296816 lt!296819 mask!3053))))

(declare-fun e!367008 () Bool)

(assert (=> b!641079 e!367008))

(declare-fun res!415269 () Bool)

(assert (=> b!641079 (=> (not res!415269) (not e!367008))))

(declare-fun lt!296822 () (_ BitVec 32))

(declare-fun lt!296825 () SeekEntryResult!6841)

(assert (=> b!641079 (= res!415269 (= lt!296825 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296822 vacantSpotIndex!68 lt!296816 lt!296819 mask!3053)))))

(assert (=> b!641079 (= lt!296825 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296822 vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641079 (= lt!296816 (select (store (arr!18401 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296824 () Unit!21698)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21698)

(assert (=> b!641079 (= lt!296824 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296822 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641079 (= lt!296822 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!641080 () Bool)

(assert (=> b!641080 (= e!367013 e!367006)))

(declare-fun res!415270 () Bool)

(assert (=> b!641080 (=> res!415270 e!367006)))

(assert (=> b!641080 (= res!415270 (or (not (= (select (arr!18401 a!2986) j!136) lt!296816)) (not (= (select (arr!18401 a!2986) j!136) lt!296827)) (bvsge j!136 index!984)))))

(declare-fun b!641081 () Bool)

(declare-fun lt!296820 () SeekEntryResult!6841)

(assert (=> b!641081 (= e!367008 (= lt!296820 lt!296825))))

(declare-fun b!641082 () Bool)

(assert (=> b!641082 (= e!367007 e!367012)))

(declare-fun res!415265 () Bool)

(assert (=> b!641082 (=> (not res!415265) (not e!367012))))

(assert (=> b!641082 (= res!415265 (and (= lt!296820 (Found!6841 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18401 a!2986) index!984) (select (arr!18401 a!2986) j!136))) (not (= (select (arr!18401 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!641082 (= lt!296820 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641083 () Bool)

(declare-fun Unit!21701 () Unit!21698)

(assert (=> b!641083 (= e!367011 Unit!21701)))

(declare-fun b!641084 () Bool)

(declare-fun res!415278 () Bool)

(assert (=> b!641084 (=> (not res!415278) (not e!367016))))

(assert (=> b!641084 (= res!415278 (validKeyInArray!0 k!1786))))

(assert (= (and start!57936 res!415268) b!641075))

(assert (= (and b!641075 res!415263) b!641070))

(assert (= (and b!641070 res!415273) b!641084))

(assert (= (and b!641084 res!415278) b!641068))

(assert (= (and b!641068 res!415271) b!641072))

(assert (= (and b!641072 res!415267) b!641073))

(assert (= (and b!641073 res!415280) b!641074))

(assert (= (and b!641074 res!415272) b!641066))

(assert (= (and b!641066 res!415266) b!641069))

(assert (= (and b!641069 res!415276) b!641082))

(assert (= (and b!641082 res!415265) b!641079))

(assert (= (and b!641079 res!415269) b!641081))

(assert (= (and b!641079 c!73268) b!641076))

(assert (= (and b!641079 (not c!73268)) b!641083))

(assert (= (and b!641079 (not res!415277)) b!641077))

(assert (= (and b!641077 res!415275) b!641080))

(assert (= (and b!641080 (not res!415270)) b!641078))

(assert (= (and b!641078 res!415279) b!641067))

(assert (= (and b!641077 (not res!415274)) b!641065))

(assert (= (and b!641065 (not res!415264)) b!641071))

(declare-fun m!614903 () Bool)

(assert (=> b!641077 m!614903))

(declare-fun m!614905 () Bool)

(assert (=> b!641077 m!614905))

(declare-fun m!614907 () Bool)

(assert (=> b!641077 m!614907))

(assert (=> b!641067 m!614903))

(assert (=> b!641067 m!614903))

(declare-fun m!614909 () Bool)

(assert (=> b!641067 m!614909))

(declare-fun m!614911 () Bool)

(assert (=> b!641079 m!614911))

(declare-fun m!614913 () Bool)

(assert (=> b!641079 m!614913))

(assert (=> b!641079 m!614903))

(assert (=> b!641079 m!614903))

(declare-fun m!614915 () Bool)

(assert (=> b!641079 m!614915))

(declare-fun m!614917 () Bool)

(assert (=> b!641079 m!614917))

(declare-fun m!614919 () Bool)

(assert (=> b!641079 m!614919))

(assert (=> b!641079 m!614905))

(declare-fun m!614921 () Bool)

(assert (=> b!641079 m!614921))

(assert (=> b!641069 m!614905))

(declare-fun m!614923 () Bool)

(assert (=> b!641069 m!614923))

(declare-fun m!614925 () Bool)

(assert (=> b!641073 m!614925))

(declare-fun m!614927 () Bool)

(assert (=> b!641072 m!614927))

(declare-fun m!614929 () Bool)

(assert (=> start!57936 m!614929))

(declare-fun m!614931 () Bool)

(assert (=> start!57936 m!614931))

(declare-fun m!614933 () Bool)

(assert (=> b!641084 m!614933))

(declare-fun m!614935 () Bool)

(assert (=> b!641065 m!614935))

(declare-fun m!614937 () Bool)

(assert (=> b!641065 m!614937))

(assert (=> b!641065 m!614903))

(assert (=> b!641065 m!614903))

(declare-fun m!614939 () Bool)

(assert (=> b!641065 m!614939))

(declare-fun m!614941 () Bool)

(assert (=> b!641065 m!614941))

(declare-fun m!614943 () Bool)

(assert (=> b!641065 m!614943))

(assert (=> b!641065 m!614903))

(declare-fun m!614945 () Bool)

(assert (=> b!641065 m!614945))

(declare-fun m!614947 () Bool)

(assert (=> b!641074 m!614947))

(declare-fun m!614949 () Bool)

(assert (=> b!641082 m!614949))

(assert (=> b!641082 m!614903))

(assert (=> b!641082 m!614903))

(declare-fun m!614951 () Bool)

(assert (=> b!641082 m!614951))

(declare-fun m!614953 () Bool)

(assert (=> b!641066 m!614953))

(assert (=> b!641078 m!614903))

(assert (=> b!641078 m!614903))

(declare-fun m!614955 () Bool)

(assert (=> b!641078 m!614955))

(assert (=> b!641080 m!614903))

(declare-fun m!614957 () Bool)

(assert (=> b!641071 m!614957))

(declare-fun m!614959 () Bool)

(assert (=> b!641068 m!614959))

(assert (=> b!641070 m!614903))

(assert (=> b!641070 m!614903))

(declare-fun m!614961 () Bool)

(assert (=> b!641070 m!614961))

(push 1)

(assert (not start!57936))

(assert (not b!641082))

(assert (not b!641068))

(assert (not b!641071))

(assert (not b!641065))

(assert (not b!641067))

(assert (not b!641084))

(assert (not b!641078))

(assert (not b!641074))

(assert (not b!641079))

(assert (not b!641073))

(assert (not b!641070))

(assert (not b!641072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!641266 () Bool)

(declare-fun c!73319 () Bool)

(declare-fun lt!296891 () (_ BitVec 64))

(assert (=> b!641266 (= c!73319 (= lt!296891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367151 () SeekEntryResult!6841)

(declare-fun e!367150 () SeekEntryResult!6841)

(assert (=> b!641266 (= e!367151 e!367150)))

(declare-fun lt!296892 () SeekEntryResult!6841)

(declare-fun b!641267 () Bool)

(assert (=> b!641267 (= e!367150 (seekKeyOrZeroReturnVacant!0 (x!58437 lt!296892) (index!29686 lt!296892) (index!29686 lt!296892) k!1786 a!2986 mask!3053))))

(declare-fun b!641268 () Bool)

(assert (=> b!641268 (= e!367150 (MissingZero!6841 (index!29686 lt!296892)))))

(declare-fun b!641265 () Bool)

(assert (=> b!641265 (= e!367151 (Found!6841 (index!29686 lt!296892)))))

(declare-fun d!90527 () Bool)

(declare-fun lt!296890 () SeekEntryResult!6841)

(assert (=> d!90527 (and (or (is-Undefined!6841 lt!296890) (not (is-Found!6841 lt!296890)) (and (bvsge (index!29685 lt!296890) #b00000000000000000000000000000000) (bvslt (index!29685 lt!296890) (size!18765 a!2986)))) (or (is-Undefined!6841 lt!296890) (is-Found!6841 lt!296890) (not (is-MissingZero!6841 lt!296890)) (and (bvsge (index!29684 lt!296890) #b00000000000000000000000000000000) (bvslt (index!29684 lt!296890) (size!18765 a!2986)))) (or (is-Undefined!6841 lt!296890) (is-Found!6841 lt!296890) (is-MissingZero!6841 lt!296890) (not (is-MissingVacant!6841 lt!296890)) (and (bvsge (index!29687 lt!296890) #b00000000000000000000000000000000) (bvslt (index!29687 lt!296890) (size!18765 a!2986)))) (or (is-Undefined!6841 lt!296890) (ite (is-Found!6841 lt!296890) (= (select (arr!18401 a!2986) (index!29685 lt!296890)) k!1786) (ite (is-MissingZero!6841 lt!296890) (= (select (arr!18401 a!2986) (index!29684 lt!296890)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6841 lt!296890) (= (select (arr!18401 a!2986) (index!29687 lt!296890)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!367149 () SeekEntryResult!6841)

(assert (=> d!90527 (= lt!296890 e!367149)))

(declare-fun c!73318 () Bool)

(assert (=> d!90527 (= c!73318 (and (is-Intermediate!6841 lt!296892) (undefined!7653 lt!296892)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38363 (_ BitVec 32)) SeekEntryResult!6841)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90527 (= lt!296892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90527 (validMask!0 mask!3053)))

(assert (=> d!90527 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!296890)))

(declare-fun b!641269 () Bool)

(assert (=> b!641269 (= e!367149 Undefined!6841)))

(declare-fun b!641270 () Bool)

(assert (=> b!641270 (= e!367149 e!367151)))

(assert (=> b!641270 (= lt!296891 (select (arr!18401 a!2986) (index!29686 lt!296892)))))

(declare-fun c!73320 () Bool)

(assert (=> b!641270 (= c!73320 (= lt!296891 k!1786))))

(assert (= (and d!90527 c!73318) b!641269))

(assert (= (and d!90527 (not c!73318)) b!641270))

(assert (= (and b!641270 c!73320) b!641265))

(assert (= (and b!641270 (not c!73320)) b!641266))

(assert (= (and b!641266 c!73319) b!641268))

(assert (= (and b!641266 (not c!73319)) b!641267))

(declare-fun m!615107 () Bool)

(assert (=> b!641267 m!615107))

(declare-fun m!615109 () Bool)

(assert (=> d!90527 m!615109))

(declare-fun m!615111 () Bool)

(assert (=> d!90527 m!615111))

(assert (=> d!90527 m!614929))

(declare-fun m!615113 () Bool)

(assert (=> d!90527 m!615113))

(assert (=> d!90527 m!615109))

(declare-fun m!615115 () Bool)

(assert (=> d!90527 m!615115))

(declare-fun m!615117 () Bool)

(assert (=> d!90527 m!615117))

(declare-fun m!615119 () Bool)

(assert (=> b!641270 m!615119))

(assert (=> b!641072 d!90527))

(declare-fun d!90557 () Bool)

(assert (=> d!90557 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57936 d!90557))

(declare-fun d!90573 () Bool)

(assert (=> d!90573 (= (array_inv!14197 a!2986) (bvsge (size!18765 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57936 d!90573))

(declare-fun e!367189 () SeekEntryResult!6841)

(declare-fun b!641339 () Bool)

(assert (=> b!641339 (= e!367189 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641340 () Bool)

(declare-fun e!367190 () SeekEntryResult!6841)

(assert (=> b!641340 (= e!367190 (Found!6841 index!984))))

(declare-fun b!641341 () Bool)

(declare-fun e!367188 () SeekEntryResult!6841)

(assert (=> b!641341 (= e!367188 e!367190)))

(declare-fun lt!296928 () (_ BitVec 64))

(declare-fun c!73353 () Bool)

(assert (=> b!641341 (= c!73353 (= lt!296928 (select (arr!18401 a!2986) j!136)))))

(declare-fun b!641342 () Bool)

(assert (=> b!641342 (= e!367188 Undefined!6841)))

(declare-fun b!641343 () Bool)

(assert (=> b!641343 (= e!367189 (MissingVacant!6841 vacantSpotIndex!68))))

(declare-fun b!641344 () Bool)

(declare-fun c!73355 () Bool)

(assert (=> b!641344 (= c!73355 (= lt!296928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641344 (= e!367190 e!367189)))

(declare-fun lt!296929 () SeekEntryResult!6841)

(declare-fun d!90575 () Bool)

(assert (=> d!90575 (and (or (is-Undefined!6841 lt!296929) (not (is-Found!6841 lt!296929)) (and (bvsge (index!29685 lt!296929) #b00000000000000000000000000000000) (bvslt (index!29685 lt!296929) (size!18765 a!2986)))) (or (is-Undefined!6841 lt!296929) (is-Found!6841 lt!296929) (not (is-MissingVacant!6841 lt!296929)) (not (= (index!29687 lt!296929) vacantSpotIndex!68)) (and (bvsge (index!29687 lt!296929) #b00000000000000000000000000000000) (bvslt (index!29687 lt!296929) (size!18765 a!2986)))) (or (is-Undefined!6841 lt!296929) (ite (is-Found!6841 lt!296929) (= (select (arr!18401 a!2986) (index!29685 lt!296929)) (select (arr!18401 a!2986) j!136)) (and (is-MissingVacant!6841 lt!296929) (= (index!29687 lt!296929) vacantSpotIndex!68) (= (select (arr!18401 a!2986) (index!29687 lt!296929)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90575 (= lt!296929 e!367188)))

(declare-fun c!73354 () Bool)

(assert (=> d!90575 (= c!73354 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90575 (= lt!296928 (select (arr!18401 a!2986) index!984))))

(assert (=> d!90575 (validMask!0 mask!3053)))

(assert (=> d!90575 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053) lt!296929)))

(assert (= (and d!90575 c!73354) b!641342))

(assert (= (and d!90575 (not c!73354)) b!641341))

(assert (= (and b!641341 c!73353) b!641340))

(assert (= (and b!641341 (not c!73353)) b!641344))

(assert (= (and b!641344 c!73355) b!641343))

(assert (= (and b!641344 (not c!73355)) b!641339))

(assert (=> b!641339 m!614917))

(assert (=> b!641339 m!614917))

(assert (=> b!641339 m!614903))

(declare-fun m!615179 () Bool)

(assert (=> b!641339 m!615179))

(declare-fun m!615181 () Bool)

(assert (=> d!90575 m!615181))

(declare-fun m!615183 () Bool)

(assert (=> d!90575 m!615183))

(assert (=> d!90575 m!614949))

(assert (=> d!90575 m!614929))

(assert (=> b!641082 d!90575))

(declare-fun d!90579 () Bool)

(declare-fun res!415375 () Bool)

(declare-fun e!367200 () Bool)

(assert (=> d!90579 (=> res!415375 e!367200)))

(assert (=> d!90579 (= res!415375 (is-Nil!12439 Nil!12439))))

(assert (=> d!90579 (= (noDuplicate!401 Nil!12439) e!367200)))

(declare-fun b!641355 () Bool)

(declare-fun e!367201 () Bool)

(assert (=> b!641355 (= e!367200 e!367201)))

(declare-fun res!415376 () Bool)

(assert (=> b!641355 (=> (not res!415376) (not e!367201))))

(declare-fun contains!3129 (List!12442 (_ BitVec 64)) Bool)

(assert (=> b!641355 (= res!415376 (not (contains!3129 (t!18670 Nil!12439) (h!13483 Nil!12439))))))

(declare-fun b!641356 () Bool)

(assert (=> b!641356 (= e!367201 (noDuplicate!401 (t!18670 Nil!12439)))))

(assert (= (and d!90579 (not res!415375)) b!641355))

(assert (= (and b!641355 res!415376) b!641356))

(declare-fun m!615195 () Bool)

(assert (=> b!641355 m!615195))

(declare-fun m!615197 () Bool)

(assert (=> b!641356 m!615197))

(assert (=> b!641071 d!90579))

(declare-fun d!90585 () Bool)

(assert (=> d!90585 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641084 d!90585))

(declare-fun b!641365 () Bool)

(declare-fun e!367208 () Bool)

(declare-fun e!367209 () Bool)

(assert (=> b!641365 (= e!367208 e!367209)))

(declare-fun c!73359 () Bool)

(assert (=> b!641365 (= c!73359 (validKeyInArray!0 (select (arr!18401 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33528 () Bool)

(declare-fun call!33531 () Bool)

(assert (=> bm!33528 (= call!33531 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!90587 () Bool)

(declare-fun res!415382 () Bool)

(assert (=> d!90587 (=> res!415382 e!367208)))

(assert (=> d!90587 (= res!415382 (bvsge #b00000000000000000000000000000000 (size!18765 a!2986)))))

(assert (=> d!90587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!367208)))

(declare-fun b!641366 () Bool)

(declare-fun e!367210 () Bool)

(assert (=> b!641366 (= e!367210 call!33531)))

(declare-fun b!641367 () Bool)

(assert (=> b!641367 (= e!367209 call!33531)))

(declare-fun b!641368 () Bool)

(assert (=> b!641368 (= e!367209 e!367210)))

(declare-fun lt!296941 () (_ BitVec 64))

(assert (=> b!641368 (= lt!296941 (select (arr!18401 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296940 () Unit!21698)

